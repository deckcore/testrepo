!include "MUI.nsh"
!insertmacro MUI_PAGE_WELCOME_TITLE "hello"
!insertmacro MUI_PAGE_LICENSE "C:\Users\kritsada\Desktop\link.txt"
!insertmacro MUI_PAGE_DIRECTORY

; The name of the installer
 Name "Example1"

; The file to write
 OutFile "example1.exe"

; The default installation directory
 InstallDir $PROGRAMFILES\Example1

; The text to prompt the user to enter a directory
 DirText "This will install Cool Program on your computer. Please choose a directory"

;--------------------------------

; The stuff to install
 Section "" ;No components page, name is not important

; Set output path to the installation directory.
 SetOutPath $INSTDIR

; Put file there
 File "C:\Users\kritsada\Desktop\TestEXcel.xlsx"

 SectionEnd ; end the section

 Section "Desktop Shortcut" SectionX
    SetShellVarContext current
    CreateShortCut "$DESKTOP\Your Program.lnk" "$INSTDIR\TestEXcel.xlsx"
SectionEnd

# start default section
Section
 
    # set the installation directory as the destination for the following actions
    SetOutPath $INSTDIR
 
    # create the uninstaller
    WriteUninstaller "$INSTDIR\uninstall.exe"
 
    # create a shortcut named "new shortcut" in the start menu programs directory
    # point the new shortcut at the program uninstaller
    #CreateShortCut "$SMPROGRAMS\new shortcut.lnk" "$INSTDIR\uninstall.exe"
SectionEnd

# uninstaller section start
Section "uninstall"
 
    # first, delete the uninstaller
    Delete "$INSTDIR\uninstall.exe"
 
    # second, remove the link from the start menu
    Delete "$DESKTOP\new shortcut.lnk"
 
	# delete file
    Delete "$INSTDIR\TestEXcel.xlsx"
	
# uninstaller section end
SectionEnd

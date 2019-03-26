library(R.utils)


### Name: readWindowsShellLink
### Title: Reads a Microsoft Windows Shortcut (.lnk file)
### Aliases: readWindowsShellLink.default readWindowsShellLink
### Keywords: file IO internal

### ** Examples


pathname <- system.file("data-ex/HISTORY.LNK", package="R.utils")
lnk <- readWindowsShellLink(pathname)
str(lnk)
str(lnk$pathname)

lnk0 <- readWindowsShortcut(pathname)
str(lnk0$pathname)




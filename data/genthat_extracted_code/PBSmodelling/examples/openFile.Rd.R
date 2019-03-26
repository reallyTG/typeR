library(PBSmodelling)


### Name: openFile
### Title: Open a File with an Associated Program
### Aliases: openFile
### Keywords: file

### ** Examples

## Not run: 
##D local(envir=.PBSmodEnv,expr={
##D   # use openFile directly:
##D   openFile( "doc/PBSmodelling-UG.pdf", package="PBSmodelling" )
##D })
##D local(envir=.PBSmodEnv,expr={
##D   # via doAction in a window description file:
##D   createWin( "button text=help func=doAction width=20 pady=25 bg=green
##D   action=\"openFile(`doc/PBSmodelling-UG.pdf`,package=`PBSmodelling`)\"", astext=TRUE)
##D })
##D local(envir=.PBSmodEnv,expr={
##D   # Set up Firefox to open .html files (only applicable if Firefox is NOT default web browser)
##D   setPBSext("html", '"c:/Program Files/Mozilla Firefox/firefox.exe" file://%f')
##D   openFile("foo.html")
##D })
## End(Not run)




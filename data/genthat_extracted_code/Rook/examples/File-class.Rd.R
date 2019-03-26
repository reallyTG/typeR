library(Rook)


### Name: File-class
### Title: Class 'File'
### Aliases: File-class File
### Keywords: classes

### ** Examples

# This example serves all your files in /etc (on UNIX and Mac only).
#
# Note that when you open the application, you will see the word
# 'Forbidden'. "File" doesn't serve directories, so you must amend the
# url in the location bar with the file you want to view. Try adding /passwd.

s <- Rhttpd$new()
## Not run: 
##D s$start(quiet=TRUE)
## End(Not run)
s$add(name="etc",app=File$new('/etc'))
## Not run: 
##D s$browse('etc') # Opens a browser window to the app.
## End(Not run)
s$remove(all=TRUE)
rm(s)




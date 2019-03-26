library(BioGeoBEARS)


### Name: addslash
### Title: Add a slash to a directory name if needed
### Aliases: addslash

### ** Examples

tmpstr = "/Dropbox/_njm/__packages"
tmpstr
outstr = addslash(tmpstr)
outstr

# Annoying, getwd() often doesn't return the ending slash, which
# can make life hard for paste() later on
tmpstr = getwd()
tmpstr
outstr = addslash(tmpstr)
outstr




library(bgmfiles)


### Name: bgmfiles
### Title: bgmfiles.
### Aliases: bgmfiles bgmfiles-package

### ** Examples

## obtain all example files installed
bfiles <- bgmfiles()
print(basename(bfiles))

## filter based on an input pattern
afiles <- bgmfiles(pattern = "^antarc")
print(basename(afiles))

## read all the text from all files and table raw characters
## (for no reason)
lapply(bfiles, function(x) table(unlist(strsplit(paste(readLines(x), collapse = ""), ""))))




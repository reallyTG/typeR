library(matlab)


### Name: fileparts
### Title: MATLAB fileparts function
### Aliases: fileparts
### Keywords: file

### ** Examples

## Rename dot-txt file as dot-csv
ans <- fileparts("/home/luser/foo.txt")
fullfile(ans$pathstr, paste(ans$name, "csv", sep="."))   # /home/luser/foo.csv




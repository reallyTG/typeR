library(camtrapR)


### Name: exiftoolPath
### Title: Add a directory to PATH temporarily
### Aliases: exiftoolPath

### ** Examples

exiftool_dir <- "C:/Path/To/Exiftool"
exiftoolPath(exiftoolDir = exiftool_dir)

# check if it has been added to PATH
grepl(exiftool_dir,  Sys.getenv("PATH"))




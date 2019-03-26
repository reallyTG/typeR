library(svMisc)


### Name: system_file
### Title: Get a system file or directory
### Aliases: system_file system_dir systemFile systemDir
### Keywords: utilities

### ** Examples

system_file("INDEX", package = "base")
system_file("help", "AnIndex", package = "splines")
system_file(package = "base")  # This is a dir, not a file!
system_file("zip", exec = TRUE)
system_file("ftp", "ping", "zip", "nonexistingexe", exec = TRUE)
system_dir("temp")             # The R temporary directory
system_dir("sysTemp")          # The system temporary directory
system_dir("user")             # The user directory
system_dir("home", "bin", "doc", "etc", "share")  # Various R dirs
system_dir("zip", exec = TRUE) # Look for the dir of an executable
system_dir("ftp", "ping", "zip", "nonexistingexe", exec = TRUE)
system_dir(package = "base")   # The root of the 'base' package
system_dir(package = "stats")  # The root of package 'stats'
system_dir("INDEX", package = "stats") # This is a file, not a dir!
system_dir("help", package = "splines")




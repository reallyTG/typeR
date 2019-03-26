library(pathological)


### Name: system_file
### Title: Find a file in a package
### Aliases: system_file

### ** Examples

# Examples taken from ?system.file
system_file()                  # The root of the 'base' package
system_file(package = "stats") # The root of package 'stats'
system_file("INDEX")
system_file("help", "AnIndex", package = "splines")




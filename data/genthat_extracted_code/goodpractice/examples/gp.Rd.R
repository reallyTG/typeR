library(goodpractice)


### Name: gp
### Title: Run good practice checks
### Aliases: gp goodpractice

### ** Examples

path <- system.file("bad1", package = "goodpractice")
# run a subset of all checks available
g <- gp(path, checks = all_checks()[3:16])
g




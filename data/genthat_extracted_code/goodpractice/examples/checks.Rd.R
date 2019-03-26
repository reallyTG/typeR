library(goodpractice)


### Name: checks
### Title: List all checks performed
### Aliases: checks

### ** Examples

path <- system.file("bad1", package = "goodpractice")
# run a subset of all checks available
g <- gp(path, checks = all_checks()[3:16])
checks(g)




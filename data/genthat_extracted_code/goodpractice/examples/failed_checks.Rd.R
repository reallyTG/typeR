library(goodpractice)


### Name: failed_checks
### Title: Names of the failed checks
### Aliases: failed_checks

### ** Examples

path <- system.file("bad1", package = "goodpractice")
# run a subset of all checks available
g <- gp(path, checks = all_checks()[3:16])
failed_checks(g)




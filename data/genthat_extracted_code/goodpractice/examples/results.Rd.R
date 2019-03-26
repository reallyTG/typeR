library(goodpractice)


### Name: results
### Title: Return all check results in a data frame
### Aliases: results

### ** Examples

path <- system.file("bad1", package = "goodpractice")
# run a subset of all checks available
g <- gp(path, checks = all_checks()[3:16])
results(g)




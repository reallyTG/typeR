library(analogue)


### Name: compare
### Title: Compare proxies across two data sets
### Aliases: compare compare.default
### Keywords: methods utility multivariate

### ** Examples

data(ImbrieKipp, V12.122, SumSST)
compare(ImbrieKipp, V12.122, env = SumSST, ordination = "rda",
        method = "chord")




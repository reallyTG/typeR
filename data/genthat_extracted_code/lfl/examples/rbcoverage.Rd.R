library(lfl)


### Name: rbcoverage
### Title: Compute rule base coverage of data
### Aliases: rbcoverage
### Keywords: models robust multivariate

### ** Examples

    x <- matrix(1:20 / 20, nrow=2)
    colnames(x) <- letters[1:10]

    rules <- list(c('a', 'c', 'e'),
                  c('b'),
                  c('d', 'a'),
                  c('c', 'a', 'b'))
    rbcoverage(x, rules, "goguen", TRUE)  # returns 1


    rules <- list(c('d', 'a'),
                  c('c', 'a', 'b'))
    rbcoverage(x, rules, "goguen", TRUE)  # returns 0.075)




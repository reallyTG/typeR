library(ltm)


### Name: mult.choice
### Title: Multiple Choice Items to Binary Responses
### Aliases: mult.choice
### Keywords: multivariate

### ** Examples


dat <- data.frame(It1 = sample(4, 100, TRUE),
                  It2 = sample(4, 100, TRUE),
                  It3 = sample(5, 100, TRUE),
                  It4 = sample(5, 100, TRUE),
                  It5 = sample(4, 100, TRUE),
                  It6 = sample(5, 100, TRUE))
dat[] <- lapply(dat, function (x) { x[sample(100, 4)] <- NA; x })
crct <- c(3, 2, 5, 3, 4, 5)
####################
mult.choice(dat, crct)





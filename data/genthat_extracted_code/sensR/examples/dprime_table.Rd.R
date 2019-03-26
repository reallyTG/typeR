library(sensR)


### Name: dprime_table
### Title: Summary table of several discrimination experiments using the
###   simple-binomial protocols (Duo-Trio, Triangle, Tetrad, 2-AFC and
###   3-AFC)
### Aliases: dprime_table
### Keywords: models

### ** Examples


n <- rep(40, 4)
x <- c(25, 25, 30, 35)
protocol <- c("triangle", "duotrio", "threeAFC", "twoAFC")
dprime_table(x, n, protocol)





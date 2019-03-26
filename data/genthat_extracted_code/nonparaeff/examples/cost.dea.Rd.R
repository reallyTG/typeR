library(nonparaeff)


### Name: cost.dea
### Title: Linear Programming for Cost Minimization
### Aliases: cost.dea
### Keywords: Data Envelopment Analysis

### ** Examples


dat.io <- data.frame(y = c(1, 1, 1, 1, 1, 1, 1),
                          x1 = c(2, 3, 5, 9, 6, 3, 8),
                          x2 = c(8, 6, 3, 2, 7, 9, 4))
dat.wm<- c(w1 = 1, w2 = 2)      ## market prices of input factors
(re <- cost.dea(base = dat.io, noutput = 1, input.price = dat.wm))





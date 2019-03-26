library(ChainLadder)


### Name: LRfunction
### Title: Calculate the Link Ratio Function
### Aliases: LRfunction
### Keywords: models

### ** Examples


x <- RAA[1:9,1]
y <- RAA[1:9,2]
delta <- seq(-2, 2, by = .1)
plot(delta, LRfunction(x, y, delta), type = "l")




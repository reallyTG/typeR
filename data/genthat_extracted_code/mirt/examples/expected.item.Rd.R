library(mirt)


### Name: expected.item
### Title: Function to calculate expected value of item
### Aliases: expected.item
### Keywords: expected value

### ** Examples


mod <- mirt(Science, 1)
extr.2 <- extract.item(mod, 2)
Theta <- matrix(seq(-6,6, length.out=200))
expected <- expected.item(extr.2, Theta, min(Science[,1])) #min() of first item
head(data.frame(expected, Theta=Theta))





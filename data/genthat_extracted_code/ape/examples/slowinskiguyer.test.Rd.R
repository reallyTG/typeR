library(ape)


### Name: slowinskiguyer.test
### Title: Slowinski-Guyer Test of Homogeneous Diversification
### Aliases: slowinskiguyer.test
### Keywords: htest

### ** Examples

### from Table 1 in Slowinski and Guyer(1993):
viviparous <- c(98, 8, 193, 36, 7, 128, 2, 3, 23, 70)
oviparous <- c(234, 17, 100, 4, 1, 12, 6, 1, 481, 11)
x <- data.frame(viviparous, oviparous)
slowinskiguyer.test(x, TRUE) # 'P ~ 0.32' in the paper
xalt <- x
xalt[3, 2] <- 1
slowinskiguyer.test(xalt)




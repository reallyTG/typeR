library(nonparaeff)


### Name: additive
### Title: Linear Programming for the Additive Model
### Aliases: additive
### Keywords: Data Envelopment Analysis

### ** Examples


## Simple Example
my.dat <- data.frame(y = c(1, 2, 4, 6, 7, 9, 9),
                     x = c(3, 2, 6, 4, 8, 8, 10))
(re <- additive(my.dat, noutput = 1))

## Property of the Additive Model
dat1 <- data.frame(y = c(1, 1, 1, 1, 1, 1),
                        x1 = c(2, 3, 6, 3, 6, 6),
                        x2 = c(5, 3, 1, 8, 4, 2))
dat2 <- dat1 
dat2$x1 <- dat2$x1 * 10 
dat3 <- dat1 
dat3$x1 <- dat3$x1 + 10 
(re1 <- additive(dat1, noutput = 1))
(re2 <- additive(dat2, noutput = 1))
(re3 <- additive(dat3, noutput = 1))





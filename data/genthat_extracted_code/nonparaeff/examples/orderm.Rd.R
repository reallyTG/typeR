library(nonparaeff)


### Name: orderm
### Title: Efficiency Measures with the order-m Method.
### Aliases: orderm
### Keywords: Data Envelopment Analysis

### ** Examples

x <- abs(runif(200, min = 0.1, max = 4)) 
y <- 3*x*abs(rnorm(200))
dat.orderm <- data.frame(y = y, x = x)  
dat.orderm.out <- rbind(dat.orderm, c(4, 0.1)) ## add one outlier.
(eff <- orderm(dat.orderm.out, noutput = 1, M = 25, B = 20))




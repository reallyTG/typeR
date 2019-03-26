library(QuantPsyc)


### Name: distal.med
### Title: Distal Indirect Effect
### Aliases: distal.med se.indirect3
### Keywords: models

### ** Examples

cormat <- matrix (c(1,.3,.15,.075,.3,1,.3,.15,.15,.3,1,.3,.075,.15,.3,1),ncol=4)
require(MASS)
d200 <- data.frame(mvrnorm(200, mu=c(0,0,0,0), cormat))
names(d200) <- c("x","m1","m2","y")
distal.med(d200)





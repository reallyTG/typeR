library(skellam)


### Name: Skellam
### Title: The Skellam Distribution
### Aliases: Skellam skellam dskellam pskellam qskellam rskellam
###   dskellam.sp pskellam.sp
### Keywords: distribution

### ** Examples

require('skellam')

# one lambda = 0 ~ Poisson
c(dskellam(0:10,5,0), dpois(0:10,5))
c(dskellam(-(0:10),0,5), dpois(0:10,5))
c(pskellam(0:10,5,0,lower.tail=TRUE), 
    ppois(0:10,5,lower.tail=TRUE))
c(pskellam(0:10,5,0,lower.tail=FALSE),
    ppois(0:10,5,lower.tail=FALSE))
c(pskellam(-(0:10),0,5,lower.tail=FALSE),
    ppois(0:10-1,5,lower.tail=TRUE))
c(pskellam(-(0:10),0,5,lower.tail=TRUE),
    ppois(0:10-1,5,lower.tail=FALSE))

# both lambdas != 0 ~ convolution of Poissons
dskellam(1,0.5,0.75)  # sum(dpois(1+0:10,0.5)*dpois(0:10,0.75))
pskellam(1,0.5,0.75)  # sum(dskellam(-10:1,0.5,0.75))
dskellam(c(-1,1),c(12,10),c(10,12))  # c(0.0697968,0.0697968)
dskellam(c(-1,1),c(12,10),c(10,12),log=TRUE) 
 # log(dskellam(c(-1,1),c(12,10),c(10,12)))
dskellam(256,257,1)  
# 0.024829348733183769  
# exact result for comparison with saddlepoint
dskellam(-3724,2000,3000)  
# 3.1058145363400105e-308  
# exact result for comparison with saddlepoint 
# (still accurate in extreme tail)
pskellam(c(-1,0),c(12,10),c(10,12))  # c(0.2965079,0.7034921)
pskellam(c(-1,0),c(12,10),c(10,12),lower.tail=FALSE) 
 # 1-pskellam(c(-1,0),c(12,10),c(10,12))
pskellam(-2:2,8.5,10.25,log.p=TRUE)  # log(pskellam(-2:2,8.5,10.25))
qskellam(c(0.05,0.95),3,4)  # c(-5,3); pskellam(cbind(-6:-5,2:3),3,4)
qskellam(c(0.05,0.95),3,0)  # c(1,6); qpois(c(0.05,0.95),3)
rskellam(35,8.5,10.25)




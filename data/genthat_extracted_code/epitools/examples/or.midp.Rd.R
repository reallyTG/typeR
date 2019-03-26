library(epitools)


### Name: or.midp
### Title: Odds ratio estimation and confidence intervals using mid-p
###   method
### Aliases: or.midp
### Keywords: models

### ** Examples

##rothman p. 243
z1 <- matrix(c(12,2,7,9),2,2,byrow=TRUE)
z2 <- z1[2:1,2:1]
##jewell p. 79
z3 <- matrix(c(347,555,20,88),2,2,byrow=TRUE)
z4 <- z3[2:1,2:1]
or.midp(z1)
or.midp(z2)
or.midp(z3)
or.midp(z4)




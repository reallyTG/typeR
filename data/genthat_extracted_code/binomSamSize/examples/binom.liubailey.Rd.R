library(binomSamSize)


### Name: binom.liubailey
### Title: Calculate fixed width confidence interval for binomial
###   proportion
### Aliases: binom.liubailey
### Keywords: design survey

### ** Examples

binom.liubailey(x=0:20,n=20, d=0.1, lambda=0)

#Compute coverage of this interval
cov <- coverage( binom.liubailey, n=20, alpha=0.05, d=0.1, lambda=0,
                 p.grid=seq(0,1,length=1000))

plot(cov,type="l")





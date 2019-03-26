library(lordif)


### Name: montecarlo
### Title: performs Monte Carlo simulations to generate empirical
###   distributions
### Aliases: montecarlo
### Keywords: ~kwd1 ~kwd2

### ** Examples

##load PROMIS Anxiety sample data (n=766)
## Not run: data(Anxiety)
##age : 0=younger than 65 or 1=65 or older
##run age-related DIF on all 29 items (takes about a minute)
## Not run: age.DIF <- lordif(Anxiety[paste("R",1:29,sep="")],Anxiety$age)
##the following takes several minutes
## Not run: age.DIF.MC <- montecarlo(age.DIF,alpha=0.01,nr=100)




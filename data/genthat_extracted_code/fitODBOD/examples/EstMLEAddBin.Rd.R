library(fitODBOD)


### Name: EstMLEAddBin
### Title: Estimating the probability of success and alpha for Additive
###   Binomial Distribution
### Aliases: EstMLEAddBin

### ** Examples

No.D.D=0:7         #assigning the random variables
Obs.fre.1=c(47,54,43,40,40,41,39,95)     #assigning the corresponding frequencies
## Not run: 
##D #estimating the probability value and alpha value
##D suppressWarnings(EstMLEAddBin(No.D.D,Obs.fre.1))
##D 
##D #extracting the estimated probability value
##D suppressWarnings(EstMLEAddBin(No.D.D,Obs.fre.1)$p)
## End(Not run)




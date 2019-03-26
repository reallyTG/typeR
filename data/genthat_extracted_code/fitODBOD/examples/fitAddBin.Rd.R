library(fitODBOD)


### Name: fitAddBin
### Title: Fitting the Additive Binomial Distribution when binomial random
###   variable, frequency, probability of success and alpha are given
### Aliases: fitAddBin

### ** Examples

No.D.D=0:7         #assigning the random variables
Obs.fre.1=c(47,54,43,40,40,41,39,95)            #assigning the corresponding the frequencies
#assigning the estimated probability value
## Not run: 
##D paddbin=suppressWarnings(EstMLEAddBin(No.D.D,Obs.fre.1)$p)
##D #assigning the estimated alpha value
##D alphaaddbin=suppressWarnings(EstMLEAddBin(No.D.D,Obs.fre.1)$alpha)
##D 
##D #fitting when the random variable,frequencies,probability and alpha are given
##D fitAddBin(No.D.D,Obs.fre.1,paddbin,alphaaddbin)
##D 
##D #extracting the expected frequencies
##D fitAddBin(No.D.D,Obs.fre.1,paddbin,alphaaddbin,FALSE)$exp.freq
## End(Not run)




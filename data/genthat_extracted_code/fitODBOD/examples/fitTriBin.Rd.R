library(fitODBOD)


### Name: fitTriBin
### Title: Fitting the Triangular Binomial Distribution when binomial
###   random variable, frequency and mode value are given
### Aliases: fitTriBin

### ** Examples

No.D.D=0:7      #assigning the random variables
Obs.fre.1=c(47,54,43,40,40,41,39,95)  #assigning the corresponding frequencies
## Not run: 
##D modeTriBin=EstMLETriBin(No.D.D,Obs.fre.1)$mode  #assigning the extracted the mode value
##D #fitting when the random variable,frequencies,mode value are given.
##D fitTriBin(No.D.D,Obs.fre.1,modeTriBin)
##D 
##D fitTriBin(No.D.D,Obs.fre.1,modeTriBin,FALSE)$exp.freq  #extracting the expected frequencies
## End(Not run)




library(fitODBOD)


### Name: fitBin
### Title: Fitting the Binomial Distribution when binomial random variable,
###   frequency and probability value are given
### Aliases: fitBin

### ** Examples

No.D.D=0:7      #assigning the random variables
Obs.fre.1=c(47,54,43,40,40,41,39,95)  #assigning the corresponding frequencies

#fitting when the random variable,frequencies,probability value are given.
fitBin(No.D.D,Obs.fre.1,p=0.7)

fitBin(No.D.D,Obs.fre.1,p=0.7,FALSE)$exp.freq  #extracting the expected frequencies

#fitting when the random variable,frequencies are given.
fitBin(No.D.D,Obs.fre.1)





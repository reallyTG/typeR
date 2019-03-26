library(bayess)


### Name: gibbscap2
### Title: Gibbs sampling for the Arnason-Schwarz capture-recapture model
### Aliases: gibbscap2
### Keywords: Arnason-Schwarz capture-recapture hidden Markov model Gibbs
###   sampling

### ** Examples

data(eurodip)
res=gibbscap2(10,eurodip[1:100,])
plot(res$p,type="l",col="steelblue3",xlab="iterations",ylab="p")




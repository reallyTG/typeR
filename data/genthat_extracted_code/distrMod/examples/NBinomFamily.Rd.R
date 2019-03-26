library(distrMod)


### Name: NbinomFamily
### Title: Generating function for Nbinomial families
### Aliases: NbinomFamily NbinomwithSizeFamily NbinomMeanSizeFamily
### Keywords: models

### ** Examples

(N1 <- NbinomFamily(size = 25, prob = 0.25))
plot(N1)
FisherInfo(N1)
checkL2deriv(N1)
(N1.w <- NbinomwithSizeFamily(size = 25, prob = 0.25))
plot(N1.w)
FisherInfo(N1.w)
checkL2deriv(N1.w)
(N2.w <- NbinomMeanSizeFamily(size = 25, mean = 75))
plot(N2.w)
FisherInfo(N2.w)
checkL2deriv(N2.w)





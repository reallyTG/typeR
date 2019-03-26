library(lmomco)


### Name: pdfkap
### Title: Probability Density Function of the Kappa Distribution
### Aliases: pdfkap
### Keywords: distribution probability density function Distribution: Kappa

### ** Examples

kap <- vec2par(c(1000,15000,0.5,-0.4),type='kap')
F <- nonexceeds()
x <- quakap(F,kap)
check.pdf(pdfkap,kap,plot=TRUE)




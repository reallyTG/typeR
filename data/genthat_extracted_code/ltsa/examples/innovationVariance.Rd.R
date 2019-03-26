library(ltsa)


### Name: innovationVariance
### Title: Nonparametric estimate of the innovation variance
### Aliases: innovationVariance
### Keywords: ts

### ** Examples

z<-sunspot.year
#fitting high-order AR
innovationVariance(z)
#using periodogram
innovationVariance(z, method="Kolmogoroff")
#using smoothed periodogram
innovationVariance(z, method="Kolmogoroff", span=c(3, 3))
#the plot argument for spec.pgram() works too
innovationVariance(z, method="Kolmogoroff", span=c(3, 3), plot=TRUE)




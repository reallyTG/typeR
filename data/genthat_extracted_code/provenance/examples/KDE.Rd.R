library(provenance)


### Name: KDE
### Title: Create a kernel density estimate
### Aliases: KDE

### ** Examples

data(Namib)
samp <- Namib$DZ$x[['N1']]
dens <- KDE(samp,0,3000,kernel="epanechnikov")
plot(dens)




library(provenance)


### Name: Namib
### Title: An example dataset
### Aliases: Namib

### ** Examples

data(Namib)
samp <- Namib$DZ$x[['N1']]
dens <- KDE(samp,0,3000)
plot(dens)




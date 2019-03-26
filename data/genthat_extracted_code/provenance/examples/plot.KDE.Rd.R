library(provenance)


### Name: plot.KDE
### Title: Plot a kernel density estimate
### Aliases: plot.KDE

### ** Examples

data(Namib)
samp <- Namib$DZ$x[['N1']]
dens <- KDE(samp,from=0,to=3000)
plot(dens)




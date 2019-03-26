library(CAvariants)


### Name: plot.CAvariants
### Title: Main plot function
### Aliases: plot.CAvariants
### Keywords: multivariate

### ** Examples

data(asbestos)
resasbestos<-CAvariants(asbestos, catype = "CA", firstaxis = 1, lastaxis = 2) 
plot(resasbestos, plottype = "classic", plot3d = TRUE)
plot(resasbestos, plottype = "biplot", biptype = "column", ell = TRUE)
plot(resasbestos, plottype = "classic", ell = TRUE)




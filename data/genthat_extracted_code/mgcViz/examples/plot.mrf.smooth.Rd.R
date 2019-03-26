library(mgcViz)


### Name: plot.mrf.smooth
### Title: Plotting Markov random field smooths
### Aliases: plot.mrf.smooth

### ** Examples

library(mgcViz)
## Load Columbus Ohio crime data (see ?columbus for details and credits)
data(columb)       ## data frame
data(columb.polys) ## district shapes list
xt <- list(polys=columb.polys) ## neighbourhood structure info for MRF
par(mfrow=c(2,2))
## First a full rank MRF...
b <- gam(crime ~ s(district,bs="mrf",xt=xt),data=columb,method="REML")
b <- getViz(b) 

# Manual plot
plot(sm(b, 1)) + l_poly(colour = 2) + 
  scale_fill_gradientn(colours = heat.colors(50))

# Default plot 
plot(b)





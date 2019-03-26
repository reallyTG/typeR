library(gam)


### Name: plot.Gam
### Title: Plot Components of a GAM Object
### Aliases: plot.Gam preplot.Gam plot.preplot.Gam
### Keywords: models regression nonparametric smooth

### ** Examples

data(gam.data)
Gam.object <- gam(y ~ s(x,6) + z,data=gam.data)
plot(Gam.object,se=TRUE)
data(gam.newdata)
preplot(Gam.object,newdata=gam.newdata)




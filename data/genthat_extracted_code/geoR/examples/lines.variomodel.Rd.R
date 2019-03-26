library(geoR)


### Name: lines.variomodel
### Title: Adds a Line with a Variogram Model to a Variogram Plot
### Aliases: lines.variomodel lines.variomodel.default
### Keywords: spatial aplot

### ** Examples

# computing and ploting empirical variogram
vario <- variog(s100, max.dist = 1)
plot(vario)
# estimating parameters by weighted least squares
vario.wls <- variofit(vario, ini = c(1, .3), fix.nugget = TRUE)
# adding fitted model to the plot  
lines(vario.wls)
#
# Ploting different variogram models
plot(0:1, 0:1, type="n")
lines.variomodel(cov.model = "exp", cov.pars = c(.7, .25), nug = 0.3, max.dist = 1) 
# an alternative way to do this is:
my.model <- list(cov.model = "exp", cov.pars = c(.7, .25), nugget = 0.3,
max.dist = 1) 
lines.variomodel(my.model, lwd = 2)
# now adding another model
lines.variomodel(cov.m = "mat", cov.p = c(.7, .25), nug = 0.3,
                 max.dist = 1, kappa = 1, lty = 2)
# adding the so-called "nested" models
# two exponential structures
lines.variomodel(seq(0,1,l=101), cov.model="exp",
                 cov.pars=rbind(c(0.6,0.15),c(0.4,0.25)), nug=0, col=2)
## exponential and spherical structures
lines.variomodel(seq(0,1,l=101), cov.model=c("exp", "sph"),
                 cov.pars=rbind(c(0.6,0.15), c(0.4,0.75)), nug=0, col=3)




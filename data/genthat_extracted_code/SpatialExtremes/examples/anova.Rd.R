library(SpatialExtremes)


### Name: anova
### Title: Anova Tables
### Aliases: anova anova.maxstab anova.spatgev
### Keywords: htest

### ** Examples

##Define the coordinates of each location
n.site <- 30
locations <- matrix(rnorm(2*n.site, sd = sqrt(.2)), ncol = 2)
colnames(locations) <- c("lon", "lat")

##Simulate a max-stable process - with unit Frechet margins
data <- rmaxstab(50, locations, cov.mod = "gauss", cov11 = 100, cov12 =
25, cov22 = 220)

##Now define the spatial model for the GEV parameters
param.loc <- -10 + 2 * locations[,2]
param.scale <- 5 + 2 * locations[,1] + locations[,2]^2
param.shape <- rep(0.2, n.site)

##Transform the unit Frechet margins to GEV 
for (i in 1:n.site)
  data[,i] <- frech2gev(data[,i], param.loc[i], param.scale[i],
param.shape[i])

##Define three models for the GEV margins to be fitted
loc.form <- loc ~ lat
scale.form <- scale ~ lon + I(lat^2)
shape.form <- shape ~ lon

M0 <- fitspatgev(data, locations, loc.form, scale.form, shape.form)
M1 <- fitspatgev(data, locations, loc.form, scale.form, shape.form,
shapeCoeff2 = 0)

##Model selection
anova(M0, M1)
anova(M0, M1, method = "CB", square = "svd")




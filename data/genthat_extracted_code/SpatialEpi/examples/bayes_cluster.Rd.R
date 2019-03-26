library(SpatialEpi)


### Name: bayes_cluster
### Title: Bayesian Cluster Detection Method
### Aliases: bayes_cluster
### Keywords: file

### ** Examples

## Note for the NYleukemia example, 4 census tracts were completely surrounded 
## by another unique census tract; when applying the Bayesian cluster detection 
## model in \code{bayes_cluster}, we merge them with the surrounding 
## census tracts yielding \code{n=277} areas.

## Load data and convert coordinate system from latitude/longitude to grid
data(NYleukemia)
sp.obj <- NYleukemia$spatial.polygon
population <- NYleukemia$data$population
cases <- NYleukemia$data$cases
centroids <- latlong2grid(NYleukemia$geo[, 2:3])

## Identify the 4 census tract to be merged into their surrounding census tracts 
remove <- NYleukemia$surrounded
add <- NYleukemia$surrounding

## Merge population and case counts and geographical objects accordingly
population[add] <- population[add] + population[remove]
population <- population[-remove]
cases[add] <- cases[add] + cases[remove]
cases <- cases[-remove]
sp.obj <-
  SpatialPolygons(sp.obj@polygons[-remove], proj4string=CRS("+proj=longlat +ellps=WGS84"))
centroids <- centroids[-remove, ]


## Set parameters
y <- cases
E <- expected(population, cases, 1)
max.prop <- 0.15
shape <- c(2976.3, 2.31)
rate <- c(2977.3, 1.31)
J <- 7
pi0 <- 0.95
n.sim.lambda <- 10^4
n.sim.prior <- 10^5
n.sim.post <- 10^5


## (Uncomment first) Compute output
#output <- bayes_cluster(y, E, population, sp.obj, centroids, max.prop, 
#  shape, rate, J, pi0, n.sim.lambda, n.sim.prior, n.sim.post)
#plotmap(output$prior.map$high.area, sp.obj)
#plotmap(output$post.map$high.area, sp.obj)
#plotmap(output$post.map$RR.est.area, sp.obj, log=TRUE)
#barplot(output$pk.y, names.arg=0:J, xlab="k", ylab="P(k|y)")                   




library(SpatialExtremes)


### Name: TIC
### Title: Takeuchi's information criterion
### Aliases: TIC TIC.default
### Keywords: htest

### ** Examples

##Define the coordinate of each location
n.site <- 50
locations <- matrix(runif(2*n.site, 0, 100), ncol = 2)
colnames(locations) <- c("lon", "lat")

##Simulate a max-stable process - with unit Frechet margins
data <- rmaxstab(40, locations, cov.mod = "whitmat", nugget = 0.2, range =
30, smooth = 0.5)

M0 <- fitmaxstab(data, locations, "powexp", fit.marge = FALSE)
M1 <- fitmaxstab(data, locations, "cauchy", fit.marge = FALSE)

TIC(M0, M1)
TIC(M0, M1, k = log(nrow(data)))




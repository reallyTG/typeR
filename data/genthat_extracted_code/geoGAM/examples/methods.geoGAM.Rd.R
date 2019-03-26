library(geoGAM)


### Name: methods
### Title: Methods for 'geoGAM' objects
### Aliases: summary.geoGAM print.geoGAM plot.geoGAM summary print plot
### Keywords: spatial models & regression & nonlinear

### ** Examples


### small example with earthquake data

data(quakes)
set.seed(2)

quakes <- quakes[ sample(1:nrow(quakes), 50), ]

quakes.geogam <- geoGAM(response = "mag",
                        covariates = c("depth", "stations"),
                        data = quakes,
                        seed = 2,
                        max.stop = 5,
                        cores = 1)

summary(quakes.geogam)
summary(quakes.geogam, what = "path")

plot(quakes.geogam)
plot(quakes.geogam, what = "path")





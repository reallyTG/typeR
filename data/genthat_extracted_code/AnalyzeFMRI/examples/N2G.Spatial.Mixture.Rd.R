library(AnalyzeFMRI)


### Name: N2G.Spatial.Mixture
### Title: fMRI Spatial Mixture Modelling
### Aliases: N2G.Spatial.Mixture spatial_mixture
### Keywords: utilities

### ** Examples


## simulate image
d <- c(100, 100, 1)
y <- array(0, dim = d)
m <- y
m[, , ] <- 1

z.init <- 2 * m
z.init[20:40, 20:40, 1] <- 1
z.init[50:70, 50:70, 1] <- 3

y[z.init == 1] <- -rgamma(sum(z.init == 1), 4, 1)
y[z.init == 2] <- rnorm(sum(z.init == 2))
y[z.init == 3] <- rgamma(sum(z.init == 3), 4, 1)

mask <- 1 * (y < 1000)

## fit spatial mixture model
ans <- N2G.Spatial.Mixture(y, par.start = c(4, 2, 4, 2, 0.9, 0.05),
                           ksize = 3, ktype = "2D", mask = m) 

## plot original image, standard mixture model estimate and spatial mixture
## model estimate

par(mfrow = c(1, 3))
image(y[, , 1])
image(y[, , 1] > ans$lims[1]) ## this line plots the results of a Non-Spatial Mixture Model
image(ans$p.map[, , 1] > 0.5) ## this line plots the results of the Spatial Mixture Model






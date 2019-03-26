library(R2BayesX)


### Name: plotmap
### Title: Plot Maps
### Aliases: plotmap plot.bnd drawmap
### Keywords: hplot

### ** Examples

## load a sample map
data("FantasyBnd")

## plot the map 
op <- par(no.readonly = TRUE)
plotmap(FantasyBnd, main = "Example of a plain map")
plotmap(FantasyBnd, lwd = 1, main = "Example of a plain map")
plotmap(FantasyBnd, lwd = 1, lty = 2)
plotmap(FantasyBnd, lwd = 1, lty = 2, border = "green3")
plotmap(FantasyBnd, lwd = 1, lty = 2, border = "green3",
  density = 50)
plotmap(FantasyBnd, lwd = 1, lty = 2, 
  border = c("red", "green3"),
  density = c(10, 20), angle = c(5, 45))
plotmap(FantasyBnd, lwd = 1, lty = 2, 
  border = c("red", "green3"),
  density = c(10, 20), angle = c(5, 45),
  col = c("blue", "yellow"))
plotmap(FantasyBnd, col = gray.colors(length(FantasyBnd)))

## add some values to the corresponding polygon areas
## note that the first column in matrix val contains
## the region identification index
x <- cbind(as.integer(names(FantasyBnd)), runif(length(FantasyBnd), -2, 2))
plotmap(FantasyBnd, x = x)
        
## now only plot values for some certain regions
set.seed(432)
samps <- sample(x[,1], 4)
nx <- x[samps,]
plotmap(FantasyBnd, x = nx, density = 20)

## play with legend
plotmap(FantasyBnd, x = x, names = TRUE, legend = FALSE)
plotmap(FantasyBnd, x = nx, density = 20, pos = c(0, 1))
plotmap(FantasyBnd, x = nx, density = 20, pos = c(0, 0.8),
  side.legend = 2)
plotmap(FantasyBnd, x = nx, density = 20, pos = c(0, 0.8),
  side.legend = 2, side.tick = 2)
plotmap(FantasyBnd, x = nx, density = 20, pos = c(0, 0.8),
  side.legend = 2, side.tick = 2, cex.legend = 0.5)
plotmap(FantasyBnd, x = x, values = TRUE, 
  pos = c(-0.15, -0.12))
plotmap(FantasyBnd, x = nx, values = TRUE, 
  pos = c(-0.07, -0.22), width = 2, 
  at = nx[,2], side.legend = 2, distance.labels = 3,
  density = 20)
plotmap(FantasyBnd, x = nx, values = TRUE, 
  pos = c(-0.07, -0.22), width = 2, 
  at = nx[,2], side.legend = 2, distance.labels = 3,
  density = 20, symmetric = FALSE, 
  col = heat_hcl, swap = TRUE)
plotmap(FantasyBnd, x = nx, values = TRUE, 
  pos = c(-0.07, -0.22), width = 2, 
  at = nx[,2], side.legend = 2, distance.labels = 3,
  density = 20, symmetric = FALSE, 
  col = heat_hcl, swap = TRUE, range = c(-5, 5))
plotmap(FantasyBnd, x = nx, values = TRUE, 
  pos = c(-0.07, -0.22), width = 2, 
  at = nx[,2], side.legend = 2, distance.labels = 3,
  density = 20, symmetric = FALSE, 
  col = heat_hcl, swap = TRUE, lrange = c(-5, 5))
plotmap(FantasyBnd, x = nx, values = TRUE, 
  pos = c(-0.07, -0.22), width = 2, 
  at = nx[,2], side.legend = 2, distance.labels = 3,
  density = 20, symmetric = FALSE, 
  col = heat_hcl, swap = TRUE, 
  ncol = 4, breaks = seq(-2, 2, length = 5))

## more position options
plotmap(FantasyBnd, x = nx, density = 20, pos = "bottomleft")
plotmap(FantasyBnd, x = nx, density = 20, pos = "topleft")
plotmap(FantasyBnd, x = nx, density = 20, pos = "topright")
plotmap(FantasyBnd, x = nx, density = 20, pos = "bottomright")
plotmap(FantasyBnd, x = nx, density = 20, pos = "right")
par(op)

# load and plot a map from GermanyBnd
op <- par(no.readonly = TRUE)
data("GermanyBnd")
plotmap(GermanyBnd, main = "Map of GermanyBnd")
n <- length(GermanyBnd)

# add some colors
plotmap(GermanyBnd, col = rainbow(n))
plotmap(GermanyBnd, col = heat.colors(n))
plotmap(GermanyBnd, col = topo.colors(n))
plotmap(GermanyBnd, col = cm.colors(n))
plotmap(GermanyBnd, col = gray.colors(n))
plotmap(GermanyBnd, col = c("green", "green3"))
par(op)


## now with bayesx
set.seed(333)

## simulate some geographical data
data("MunichBnd")
N <- length(MunichBnd); names(MunichBnd) <- 1:N
n <- N*5

## regressors
dat <- data.frame(id = rep(1:N, n/N))
dat$sp <- with(dat, sort(runif(N, -2, 2), decreasing = TRUE)[id])

## response
dat$y <- with(dat, 1.5 + sp + rnorm(n, sd = 0.6))

## Not run: 
##D ## estimate model
##D b <- bayesx(y ~ sx(id, bs = "mrf", map = MunichBnd),
##D   method = "MCMC", data = dat)
##D 
##D ## summary statistics
##D summary(b)
##D 
##D ## plot spatial effect
##D op <- par(no.readonly = TRUE)
##D plot(b, map = MunichBnd)
##D plot(b, map = MunichBnd, c.select = "97.5##D 
##D plot(b, map = MunichBnd, c.select = "2.5##D 
##D plot(b, map = MunichBnd, c.select = "50##D 
##D plot(b, map = MunichBnd, names = TRUE, 
##D   cex.names = 0.5, cex.legend = 0.8)
##D plot(b, map = MunichBnd, range = c(-0.5, 0.5))
##D plot(b, map = MunichBnd, range = c(-5, 5))
##D plot(b, map = MunichBnd, col = heat_hcl, 
##D   swap = TRUE, symmetric = FALSE)
##D par(op)
## End(Not run)




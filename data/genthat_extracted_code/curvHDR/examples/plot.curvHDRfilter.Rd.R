library(curvHDR)


### Name: plot.curvHDRfilter
### Title: Plot a curvHDR filter.
### Aliases: plot.curvHDRfilter
### Keywords: flow cytomery feature significance density estimation

### ** Examples

library(curvHDR)

# Univariate curvHDR example:

xUniv <- c(rnorm(1000,-2),rnorm(1000,2))
gate1 <- curvHDRfilter(xUniv)
plot(gate1)

# Bivariate curvHDR example:

xBiva <- cbind(c(rnorm(1000,-2),rnorm(1000,2)),
               c(rnorm(1000,-2),rnorm(1000,2)))
gate2 <- curvHDRfilter(xBiva)
plot(gate2)

# Trivariate curvHDR example:

## Not run: 
##D xTriv <- cbind(c(rnorm(1000,-2),rnorm(1000,2)),
##D                c(rnorm(1000,-2),rnorm(1000,2)),
##D                c(rnorm(1000,-2),rnorm(1000,2)))
##D gate3 <- curvHDRfilter(xTriv)
##D plot(gate3)
## End(Not run)





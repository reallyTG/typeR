library(spatstat)


### Name: suffstat
### Title: Sufficient Statistic of Point Process Model
### Aliases: suffstat
### Keywords: spatial models

### ** Examples

    fitS <- ppm(swedishpines~1, Strauss(7))
    suffstat(fitS)
    X <- rpoispp(intensity(swedishpines), win=Window(swedishpines))
    suffstat(fitS, X)




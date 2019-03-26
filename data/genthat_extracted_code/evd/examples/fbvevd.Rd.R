library(evd)


### Name: fbvevd
### Title: Maximum-likelihood Fitting of Bivariate Extreme Value
###   Distributions
### Aliases: fbvevd print.bvevd
### Keywords: models

### ** Examples

bvdata <- rbvevd(100, dep = 0.6, model = "log", mar1 = c(1.2,1.4,0.4))
M1 <- fbvevd(bvdata, model = "log")
M2 <- fbvevd(bvdata, model = "log", dep = 0.75)
anova(M1, M2)
par(mfrow = c(2,2))
plot(M1)
plot(M1, mar = 1)
plot(M1, mar = 2)
## Not run: par(mfrow = c(1,1))
## Not run: M1P <- profile(M1, which = "dep")
## Not run: plot(M1P)

trend <- (-49:50)/100
rnd <- runif(100, min = -.5, max = .5)
fbvevd(bvdata, model = "log", nsloc1 = trend)
fbvevd(bvdata, model = "log", nsloc1 = trend, nsloc2 = data.frame(trend
= trend,  random = rnd))
fbvevd(bvdata, model = "log", nsloc1 = trend, nsloc2 = data.frame(trend
= trend, random = rnd), loc2random = 0)

bvdata <- rbvevd(100, dep = 1, asy = c(0.5,0.5), model = "anegl")
anlog <- fbvevd(bvdata, model = "anegl")
mixed <- fbvevd(bvdata, model = "anegl", dep = 1, sym = TRUE)
anova(anlog, mixed)
amixed <- fbvevd(bvdata, model = "amix")
mixed <- fbvevd(bvdata, model = "amix", beta = 0)
anova(amixed, mixed)




library(modeest)


### Name: distrMode
### Title: Mode of some continuous and discrete distributions
### Aliases: distrMode betaMode cauchyMode chisqMode dagumMode expMode
###   fMode fiskMode frechetMode gammaMode normMode gevMode ghMode ghtMode
###   gldMode gompertzMode gpdMode gumbelMode hypMode koenkerMode kumarMode
###   laplaceMode logisMode lnormMode lomaxMode maxwellMode mvnormMode
###   nakaMode nigMode paralogisticMode paretoMode rayleighMode stableMode
###   stableMode2 tMode unifMode weibullMode yulesMode bernMode binomMode
###   geomMode hyperMode nbinomMode poisMode

### ** Examples

## Beta distribution
curve(dbeta(x, shape1 = 2, shape2 = 3.1), 
      xlim = c(0,1), ylab = "Beta density")
M <- betaMode(shape1 = 2, shape2 = 3.1)
abline(v = M, col = 2)
mlv("beta", shape1 = 2, shape2 = 3.1)

## Lognormal distribution
curve(stats::dlnorm(x, meanlog = 3, sdlog = 1.1), 
      xlim = c(0, 10), ylab = "Lognormal density")
M <- lnormMode(meanlog = 3, sdlog = 1.1)
abline(v = M, col = 2)
mlv("lnorm", meanlog = 3, sdlog = 1.1)

curve(VGAM::dpareto(x, scale = 1, shape = 1), xlim = c(0, 10))
abline(v = paretoMode(scale = 1), col = 2)

## Poisson distribution
poisMode(lambda = 6)
poisMode(lambda = 6.1)
mlv("poisson", lambda = 6.1)





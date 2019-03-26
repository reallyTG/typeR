library(semTools)


### Name: SSpower
### Title: Power for model parameters
### Aliases: SSpower

### ** Examples

## Specify population values. Note every paramter has a fixed value.
modelP <- '
  f1 =~ .7*V1 + .7*V2 + .7*V3 + .7*V4
  f2 =~ .7*V5 + .7*V6 + .7*V7 + .7*V8
  f1 ~~ .3*f2
  f1 ~~ 1*f1
  f2 ~~ 1*f2
  V1 ~~ .51*V1
  V2 ~~ .51*V2
  V3 ~~ .51*V3
  V4 ~~ .51*V4
  V5 ~~ .51*V5
  V6 ~~ .51*V6
  V7 ~~ .51*V7
  V8 ~~ .51*V8
'
## Specify analysis model. Note parameter of interest f1~~f2 is fixed to 0.
modelA <- '
  f1 =~ V1 + V2 + V3 + V4
  f2 =~ V5 + V6 + V7 + V8
  f1 ~~ 0*f2
'
## Calculate power
SSpower(powerModel = modelA, popModel = modelP, n = 150, nparam = 1,
        std.lv = TRUE)

## Get power for a range of sample sizes

Ns <- seq(100, 500, 40)
Power <- rep(NA, length(Ns))
for(i in 1:length(Ns)) {
  Power[i] <- SSpower(powerModel = modelA, popModel = modelP,
                      n = Ns[i], nparam = 1, std.lv = TRUE)
}
plot(x = Ns, y = Power, type = "l", xlab = "Sample Size")

## Specify second population to calculate power for multigroup model

popMoments1 <- fitted(cfa(modelP))
modelP2 <- '
  f1 =~ .7*V1 + .7*V2 + .7*V3 + .7*V4
  f2 =~ .7*V5 + .7*V6 + .7*V7 + .7*V8
  f1 ~~ .5*f2     ## higher correlation in Group 2
  f1 ~~ 1*f1
  f2 ~~ 1*f2
  V1 ~~ .51*V1
  V2 ~~ .51*V2
  V3 ~~ .51*V3
  V4 ~~ .51*V4
  V5 ~~ .51*V5
  V6 ~~ .51*V6
  V7 ~~ .51*V7
  V8 ~~ .51*V8
'
popMoments2 <- fitted(cfa(modelP2))
modelA2 <- '
  f1 =~ V1 + V2 + V3 + V4
  f2 =~ V5 + V6 + V7 + V8
  f1 ~~ c(0, 0)*f2
'
mu <- list(popMoments1$mean, popMoments2$mean) # ignored if NULL
Sigma <- list(popMoments1$cov, popMoments2$cov)
SSpower(powerModel = modelA2, mu = mu, Sigma = Sigma,
        n = c(60, 65), nparam = 2)





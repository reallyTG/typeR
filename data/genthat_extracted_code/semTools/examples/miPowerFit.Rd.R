library(semTools)


### Name: miPowerFit
### Title: Modification indices and their power approach for model fit
###   evaluation
### Aliases: miPowerFit

### ** Examples


library(lavaan)

HS.model <- ' visual  =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '

fit <- cfa(HS.model, data = HolzingerSwineford1939,
           group = "sex", meanstructure = TRUE)
miPowerFit(fit)

model <- '
  # latent variable definitions
     ind60 =~ x1 + x2 + x3
     dem60 =~ y1 + a*y2 + b*y3 + c*y4
     dem65 =~ y5 + a*y6 + b*y7 + c*y8

  # regressions
    dem60 ~ ind60
    dem65 ~ ind60 + dem60

  # residual correlations
    y1 ~~ y5
    y2 ~~ y4 + y6
    y3 ~~ y7
    y4 ~~ y8
    y6 ~~ y8
'
fit2 <- sem(model, data = PoliticalDemocracy, meanstructure = TRUE)
miPowerFit(fit2, stdLoad = 0.3, cor = 0.2, stdBeta = 0.2, intcept = 0.5)





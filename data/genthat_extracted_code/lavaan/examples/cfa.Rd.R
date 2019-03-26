library(lavaan)


### Name: cfa
### Title: Fit Confirmatory Factor Analysis Models
### Aliases: cfa

### ** Examples

## The famous Holzinger and Swineford (1939) example
HS.model <- ' visual  =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '

fit <- cfa(HS.model, data=HolzingerSwineford1939)
summary(fit, fit.measures=TRUE)




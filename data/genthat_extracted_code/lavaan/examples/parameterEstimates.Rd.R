library(lavaan)


### Name: parameterEstimates
### Title: Parameter Estimates
### Aliases: parameterEstimates parameterestimates

### ** Examples

HS.model <- ' visual  =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '

fit <- cfa(HS.model, data=HolzingerSwineford1939)
parameterEstimates(fit)




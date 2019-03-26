library(lavaan)


### Name: fitMeasures
### Title: Fit Measures for a Latent Variable Model
### Aliases: fitMeasures fitmeasures fitMeasures,lavaan-method
###   fitmeasures,lavaan-method fitindices

### ** Examples

HS.model <- ' visual  =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '

fit <- cfa(HS.model, data=HolzingerSwineford1939)
fitMeasures(fit)
fitMeasures(fit, "cfi")
fitMeasures(fit, c("chisq", "df", "pvalue", "cfi", "rmsea"))




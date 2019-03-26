library(semTools)


### Name: moreFitIndices
### Title: Calculate more fit indices
### Aliases: moreFitIndices

### ** Examples


HS.model <- ' visual  =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '

fit <- cfa(HS.model, data = HolzingerSwineford1939)
moreFitIndices(fit)

fit2 <- cfa(HS.model, data = HolzingerSwineford1939, estimator = "mlr")
moreFitIndices(fit2)





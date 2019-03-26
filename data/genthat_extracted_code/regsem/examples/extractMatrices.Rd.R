library(regsem)


### Name: extractMatrices
### Title: This function extracts RAM matrices from a lavaan object.
### Aliases: extractMatrices
### Keywords: extract

### ** Examples


library(lavaan)
data(HolzingerSwineford1939)
HS.model <- ' visual =~ x1 + x2 + x3
textual =~ x4 + x5 + x6
speed =~ x7 + x8 + x9 '
mod <- cfa(HS.model, data=HolzingerSwineford1939)
mats = extractMatrices(mod)




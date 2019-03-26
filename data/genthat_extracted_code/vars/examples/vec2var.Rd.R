library(vars)


### Name: vec2var
### Title: Transform a VECM to VAR in levels
### Aliases: vec2var print.vec2var
### Keywords: regression

### ** Examples

library(urca)
data(finland)
sjf <- finland
sjf.vecm <- ca.jo(sjf, ecdet = "none", type = "eigen", K = 2,
spec = "longrun", season = 4)
vec2var(sjf.vecm, r = 2)




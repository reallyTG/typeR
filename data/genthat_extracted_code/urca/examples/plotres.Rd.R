library(urca)


### Name: plotres
### Title: Graphical inspection of VECM residuals
### Aliases: plotres
### Keywords: regression

### ** Examples

data(denmark)
sjd <- denmark[, c("LRM", "LRY", "IBO", "IDE")]
sjd.vecm <- ca.jo(sjd, ecdet="const", type="eigen", K=2, spec="longrun",
season=4)
plotres(sjd.vecm)




library(oce)


### Name: plotTaylor
### Title: Plot a Model-data Comparison Diagram
### Aliases: plotTaylor

### ** Examples


library(oce)
data(sealevel)
x <- sealevel[["elevation"]]
M2 <- predict(tidem(sealevel, constituents="M2"))
S2 <- predict(tidem(sealevel, constituents=c("S2")))
plotTaylor(x, cbind(M2, S2))




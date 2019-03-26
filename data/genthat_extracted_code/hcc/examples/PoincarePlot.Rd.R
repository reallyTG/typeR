library(hcc)


### Name: PoincarePlot
### Title: Poincare plot
### Aliases: PoincarePlot
### Keywords: htest models

### ** Examples

data(trees)
ans<-lm(Volume~Girth+Height, data=trees)
x <- trees$Girth
res <- resid(ans)
PoincarePlot(x, res)




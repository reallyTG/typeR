library(clinfun)


### Name: roc.area.test
### Title: Nonparametric area under the ROC curve
### Aliases: roc.area.test print.roc.area.test
### Keywords: htest

### ** Examples

g <- rep(0:1, 50)
x <- rnorm(100) + g
y <- rnorm(100) + g
z <- rnorm(100) + g
roc.area.test(cbind(x,y), g)
roc.area.test(cbind(x,y,z), g)
y1 <- y + 0.75*g
roc.area.test(cbind(x,y1), g)




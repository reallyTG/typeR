library(varSelRF)


### Name: plot.varSelRF
### Title: Plot a varSelRF object
### Aliases: plot.varSelRF
### Keywords: tree classif

### ** Examples

x <- matrix(rnorm(25 * 30), ncol = 30)
x[1:10, 1:2] <- x[1:10, 1:2] + 2
cl <- factor(c(rep("A", 10), rep("B", 15)))  

rf.vs1 <- varSelRF(x, cl, ntree = 200, ntreeIterat = 100,
                   vars.drop.frac = 0.2)
rf.vs1
plot(rf.vs1)




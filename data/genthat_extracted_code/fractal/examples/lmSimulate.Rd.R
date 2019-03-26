library(fractal)


### Name: lmSimulate
### Title: Stochastic fractal time series simulation
### Aliases: lmSimulate
### Keywords: univar models nonlinear

### ** Examples

old.plt <- par("plt")
models <- c("ppl","fdp","fgn","dfbm")
for (i in seq(along=models)){
    splitplot(2,2,i)
    plot(lmSimulate(lmModel(models[i])),
    reference.grid=FALSE)
}
par(plt=old.plt)




library(fractal)


### Name: lmSDF
### Title: SDF for various stochastic fractal time series models
### Aliases: lmSDF
### Keywords: univar models nonlinear

### ** Examples

old.plt <- par("plt")
models <- c("ppl","fdp","fgn","dfbm")
for (i in seq(along=models)){
    splitplot(2,2,i)
    plot(lmSDF(lmModel(models[i])),
    reference.grid=FALSE, log.axes="xy")
}
par(plt=old.plt)




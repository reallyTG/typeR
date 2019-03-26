library(grt)


### Name: lines.gqcStruct
### Title: lines Method for class 'gqc'
### Aliases: lines.gqcStruct
### Keywords: aplot

### ** Examples

data(subjdemo_2d)
fit.2dq <- gqc(response ~ x + y, data=subjdemo_2d, 
     category=subjdemo_2d$category, zlimit=7)
plot(fit.2dq, fitdb=FALSE, initdb=FALSE)
lines(fit.2dq$par, xlim=c(0,400), ylim=c(0,400), col="red")
lines(fit.2dq$initpar, xlim=c(0,400), ylim=c(0,400), col="blue")




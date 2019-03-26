library(mosaic)


### Name: fitModel
### Title: Fit a nonlinear least squares model
### Aliases: fitModel model model.nlsfunction summary.nlsfunction
###   coef.nlsfunction

### ** Examples

if (require(mosaicData)) {
f <- fitModel(temp ~ A+B*exp(-k*time), data=CoolingWater, start=list(A=50,B=50,k=1/20))
f(time=50)
coef(f)
summary(f)
model(f)
}




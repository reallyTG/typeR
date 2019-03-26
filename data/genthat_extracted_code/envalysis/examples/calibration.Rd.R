library(envalysis)


### Name: calibration
### Title: Analytical calibration functions
### Aliases: calibration print.calibration plot.calibration lod loq

### ** Examples

data(din32645)
din <- calibration(Area ~ Conc, data = din32645)
din
plot(din, interval = "confidence")
summary(din$model)

lod(din)

loq(din)





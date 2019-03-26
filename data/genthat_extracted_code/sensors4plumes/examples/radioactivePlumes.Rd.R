library(sensors4plumes)


### Name: radioactivePlumes
### Title: Simulations of radioactive plumes
### Aliases: radioactivePlumes
### Keywords: datasets

### ** Examples

data(radioactivePlumes)
plot(radioactivePlumes, zcol = 2)
# plot first plume, all kinds of values
spplotLog(extractSpatialDataFrame(radioactivePlumes, plumes = 1)) 
demo(radioactivePlumes_addProperties)
plot(radioactivePlumes, zcol = 2)
spplot(radioactivePlumes@locations)
plot(radioactivePlumes@plumes$totalDose)




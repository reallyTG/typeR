library(MonoInc)


### Name: simulated_data
### Title: Simulated Data
### Aliases: simulated_data
### Keywords: datasets simulated

### ** Examples

data(simulated_data)
library(sitar)

## plot each individual growth curve
mplot(x=age, y=height, id=nestid, data=simulated_data, col=nestid, main="Growth Curves")	





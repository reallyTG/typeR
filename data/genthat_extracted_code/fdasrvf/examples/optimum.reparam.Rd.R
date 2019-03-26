library(fdasrvf)


### Name: optimum.reparam
### Title: Align two functions
### Aliases: optimum.reparam
### Keywords: alignment srsf

### ** Examples

data("simu_data")
q = f_to_srvf(simu_data$f,simu_data$time)
gam = optimum.reparam(q[,1],simu_data$time,q[,2],simu_data$time)




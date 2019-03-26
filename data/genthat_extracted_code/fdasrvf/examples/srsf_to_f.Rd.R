library(fdasrvf)


### Name: srsf_to_f
### Title: Convert SRSF to f
### Aliases: srsf_to_f
### Keywords: alignment srsf

### ** Examples

data("simu_data")
q = f_to_srvf(simu_data$f,simu_data$time)
f = srsf_to_f(q,simu_data$time,simu_data$f[1,])




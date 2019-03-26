library(fdasrvf)


### Name: warp_q_gamma
### Title: Warp SRSF
### Aliases: warp_q_gamma
### Keywords: alignment srvf

### ** Examples

data("simu_data")
q = f_to_srvf(simu_data$f,simu_data$time)
qnew = warp_q_gamma(q[,1],simu_data$time,seq(0,1,length.out=101))




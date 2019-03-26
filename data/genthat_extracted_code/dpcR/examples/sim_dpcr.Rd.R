library(dpcR)


### Name: sim_dpcr
### Title: Simulate Droplet Digital PCR
### Aliases: sim_dpcr
### Keywords: datagen

### ** Examples


#simulate fluorescence data
tmp_VIC <- sim_dpcr(m = 7, n = 20, times = 5, fluo = list(0.1, 0))
tmp_FAM <- sim_dpcr(m = 15, n = 20, times = 5, fluo = list(0.1, 0))
par(mfrow = c(2,1))
plot(tmp_VIC, col = "green", type = "l")
plot(tmp_FAM, col = "blue", type = "l")
summary(tmp_FAM)

summary(sim_dpcr(m = 7, n = 20, times = 5, n_exp = 5))





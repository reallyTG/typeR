library(remote)


### Name: denoise
### Title: Noise filtering through principal components
### Aliases: denoise

### ** Examples

data("vdendool")
vdd_dns <- denoise(vdendool, expl.var = 0.8)

opar <- par(mfrow = c(1,2))
plot(vdendool[[1]], main = "original")
plot(vdd_dns[[1]], main = "denoised")
par(opar)




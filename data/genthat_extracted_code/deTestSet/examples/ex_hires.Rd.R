library(deTestSet)


### Name: hires
### Title: High Irradiance Response model, from Plant Physiology, ODE
### Aliases: hires
### Keywords: utilities

### ** Examples

out <- hires()
plot(out, lwd = 2)

# compare with reference solution
out1 <- hires(times = c(0, 321.8122))

max(abs(out1[nrow(out1),-1] - reference("hires")))




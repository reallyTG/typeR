library(LPCM)


### Name: lpc.control
### Title: Auxiliary parameters for controlling local principal curves.
### Aliases: lpc.control

### ** Examples

data(calspeedflow)
fit1 <- lpc(calspeedflow[,c(3,4)], x0=c(50,60),scaled=TRUE,
   control=lpc.control(iter=20, boundary=0))
plot(fit1, type=c("curve","start","mass"))




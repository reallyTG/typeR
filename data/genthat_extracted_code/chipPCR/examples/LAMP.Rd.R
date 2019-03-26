library(chipPCR)


### Name: LAMP
### Title: real-time loop-mediated isothermal amplification (LAMP) by
###   Tanner et al. (2012)
### Aliases: LAMP
### Keywords: datasets LAMP isothermal

### ** Examples

plot(LAMP, main = "LAMP by Tanner et al.(2012)", xlab = "Time (minutes)", 
       ylab = "RFU (Normalized)", col = "red", type = "l")
abline(h = 0.05, lty = 2, col = "grey")
legend("bottomright", c("E. coli (Cy5)"), col = "red", pch = 19)




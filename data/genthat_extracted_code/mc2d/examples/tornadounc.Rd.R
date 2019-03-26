library(mc2d)


### Name: tornadounc
### Title: Computes Correlation between Inputs and Output in a mc Object
###   (tornado) in the Uncertainty Dimension
### Aliases: tornadounc tornadounc.mc tornadounc tornadounc.default
###   print.tornadounc tornadounc.mccut
### Keywords: univar

### ** Examples

data(total)
tornadounc(total, 3)
tornadounc(total, 4, use="complete")
tornadounc(total, 7, use="complete.obs")
tornadounc(total, 8, use="complete.obs")
(y <- tornadounc(total, 10, use="complete.obs"))
plot(y, 1, 1)








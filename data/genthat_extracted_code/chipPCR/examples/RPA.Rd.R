library(chipPCR)


### Name: RPA
### Title: Recombinase polymerase amplification (RPA) by Lutz et al.(2009)
### Aliases: RPA
### Keywords: datasets RPA isothermal

### ** Examples

data(RPA)
plot(RPA, main = "RPA by Lutz et al.(2009)", xlab = "Reaction Time [min]", 
     ylab = "Relative fluorescence units [RFU]", type = "l")
abline(h = 5, lty = 2, col = "grey")




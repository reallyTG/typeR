library(evd)


### Name: chiplot
### Title: Dependence Measure Plots
### Aliases: chiplot
### Keywords: hplot

### ** Examples

par(mfrow = c(1,2))
smdat1 <- rbvevd(1000, dep = 0.6, model = "log")
smdat2 <- rbvevd(1000, dep = 1, model = "log")
chiplot(smdat1)
chiplot(smdat2)




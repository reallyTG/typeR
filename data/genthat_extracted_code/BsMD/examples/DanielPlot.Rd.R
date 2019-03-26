library(BsMD)


### Name: DanielPlot
### Title: Normal Plot of Effects
### Aliases: DanielPlot
### Keywords: design

### ** Examples

### Injection Molding Experiment. Box et al. 1978.
library(BsMD)
# Data
data(BM86.data,package="BsMD")     # Design matrix and response
print(BM86.data)    # from Box and Meyer (1986)

# Model Fitting. Box and Meyer (1986) example 3.
injectionMolding.lm <- lm(y3 ~ X1 + X2 + X3 + X4 + X5 + X6 + X7 + X8 + X9 +
                    X10 + X11 + X12 + X13 + X14 + X15, data = BM86.data)
print(coef(injectionMolding.lm)) # Model coefficients

# Daniel Plots
par(mfrow=c(1,3),oma=c(0,0,1,0),pty="s")
DanielPlot(injectionMolding.lm, half = TRUE, main = "Half-Normal Plot")
DanielPlot(injectionMolding.lm, main = "Normal Plot of Effects")
DanielPlot(injectionMolding.lm,
        faclab = list(idx = c(12,4,13), lab = c(" -H"," VG"," -B")),
        main = "Active Contrasts")




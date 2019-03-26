library(BsMD)


### Name: LenthPlot
### Title: Lenth's Plot of Effects
### Aliases: LenthPlot
### Keywords: design

### ** Examples

### Tensile Strength Experiment. Taguchi and Wu. 1980
library(BsMD)
# Data
data(BM86.data,package="BsMD")     # Design matrix and responses
print(BM86.data)    # from Box and Meyer (1986)

# Model Fitting. Box and Meyer (1986) example 2.
tensileStrength.lm <- lm(y2 ~ X1 + X2 + X3 + X4 + X5 + X6 + X7 + X8 + X9 +
                    X10 + X11 + X12 + X13 + X14 + X15, data = BM86.data)
print(coef(tensileStrength.lm)) # Model coefficients

par(mfrow=c(1,2),pty="s")
DanielPlot(tensileStrength.lm, main = "Daniel Plot")
LenthPlot(tensileStrength.lm, main = "Lenth's Plot")




library(HH)


### Name: resid.squares
### Title: plot squared residuals in inches to match the y-dimension
### Aliases: resid.squares
### Keywords: models regression

### ** Examples

data(hardness)

hardness.lin.lm  <- lm(hardness ~ density, data=hardness)

plot(hardness ~ density, data=hardness, xlim=c(22,73), ylim=c(0,3400))
abline(hardness.lin.lm)
resid.squares(hardness$density, hardness$hardness,
              predict(hardness.lin.lm))

plot(hardness ~ density, data=hardness, xlim=c(22,73), ylim=c(0,3400))
abline(hardness.lin.lm)
resid.squares(hardness$density, hardness$hardness,
              predict(hardness.lin.lm), resid.plot = "line")




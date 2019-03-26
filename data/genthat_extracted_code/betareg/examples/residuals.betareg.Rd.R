library(betareg)


### Name: residuals.betareg
### Title: Residuals Method for betareg Objects
### Aliases: residuals.betareg
### Keywords: regression

### ** Examples

options(digits = 4)

data("GasolineYield", package = "betareg")

gy <- betareg(yield ~ gravity + pressure + temp10 + temp, data = GasolineYield)

gy_res <- cbind(
  residuals(gy, type = "pearson"),
  residuals(gy, type = "deviance"),
  residuals(gy, type = "response"),
  residuals(gy, type = "weighted"),
  residuals(gy, type = "sweighted"),
  residuals(gy, type = "sweighted2")
)
colnames(gy_res) <- c("pearson", "deviance", "response",
  "weighted", "sweighted", "sweighted2")
pairs(gy_res)




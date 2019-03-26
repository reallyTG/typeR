library(ghyp)


### Name: qq-ghyp
### Title: Quantile-Quantile Plot
### Aliases: qqghyp
### Keywords: models hplot

### ** Examples

  data(smi.stocks)

  smi <- fit.ghypuv(data = smi.stocks[, "Swiss.Re"])

  qqghyp(smi, spline.points = 100)

  qqghyp(fit.tuv(smi.stocks[, "Swiss.Re"], symmetric = TRUE),
         add = TRUE, ghyp.col = "red", line = FALSE)




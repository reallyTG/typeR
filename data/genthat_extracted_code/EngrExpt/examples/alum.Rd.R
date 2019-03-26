library(EngrExpt)


### Name: alum
### Title: Aluminum impurity amounts
### Aliases: alum
### Keywords: datasets

### ** Examples

str(alum)
qqmath(~ ppm, alum, xlab = "Standard normal quantiles",
       aspect = 1, ylab = "Amount of aluminum impurities (ppm)",
       type = c("g","p"))
qqmath(~ log(ppm), alum, xlab = "Standard normal quantiles",
       aspect = 1, type = c("g","p"),
       ylab = "Natural log of amount of aluminum impurities (log(ppm))")




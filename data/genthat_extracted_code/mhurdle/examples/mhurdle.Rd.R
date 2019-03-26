library(mhurdle)


### Name: mhurdle
### Title: Estimation of limited dependent variable models
### Aliases: mhurdle coef.mhurdle vcov.mhurdle logLik.mhurdle print.mhurdle
###   summary.mhurdle print.summary.mhurdle predict.mhurdle update.mhurdle
###   fitted.mhurdle
### Keywords: regression

### ** Examples


data("Interview", package = "mhurdle")

# independent double hurdle model
idhm <- mhurdle(vacations ~ car + size | linc + linc2 | 0, Interview,
              dist = "ln", h2 = TRUE, method = "bfgs")

# dependent double hurdle model
ddhm <- mhurdle(vacations ~ car + size | linc + linc2  | 0, Interview,
              dist = "ln", h2 = TRUE, method = "bfgs", corr = TRUE)

# a double hurdle p-tobit model
ptm <- mhurdle(vacations ~ 0 | linc + linc2 | car + size, Interview,
              dist = "ln", h2 = TRUE, method = "bfgs", corr = TRUE)





library(mhurdle)


### Name: rsq
### Title: R squared and pseudo R squared
### Aliases: rsq
### Keywords: htest

### ** Examples

data("Interview", package = "mhurdle")
# independent double hurdle model
idhm <- mhurdle(vacations ~ car + size | linc + linc2 | 0, Interview,
              dist = "ln", h2 = TRUE, method = "bfgs")
rsq(idhm, type = "lratio")
rsq(idhm, type = "coefdet", r2pos = "rss")




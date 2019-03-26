library(ROCit)


### Name: plot.rocci
### Title: Plot ROC Curve with confidence limits
### Aliases: plot.rocci

### ** Examples

score <- c(rnorm(300,30,15), rnorm(300,50,15))
class <- c(rep(0,300), rep(1,300))
rocit_object <- rocit(score = score, class = class, method = "bi")
rocci_object <- ciROC(rocit_object)
# ---------------------------
plot(rocci_object)
plot(rocci_object, col = c(2,4))
plot(rocci_object, col = c(2,4), legendpos = "bottom", lty = c(1,3))






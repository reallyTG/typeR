library(Rcapture)


### Name: closedp.custom
### Title: Customization of a Loglinear Model for Closed Populations
###   Capture-Recapture Experiments
### Aliases: closedp.custom closedp.mX closedp.h print.closedp.custom
###   boxplot.closedp.custom
### Keywords: models

### ** Examples

data(HIV)
mat <- histpos.t(4)
mX2 <- cbind(mat, mat[, 1] * mat[, 2])
closedp.mX(HIV, dfreq = TRUE, mX = mX2)

data(mvole)
period3 <- mvole[, 11:15]
psi <- function(x) { -log(3.5 + x) + log(3.5) }
closedp.h(period3, h = psi)




library(robustbase)


### Name: tolEllipsePlot
### Title: Tolerance Ellipse Plot
### Aliases: tolEllipsePlot
### Keywords: hplot robust

### ** Examples

data(hbk)
hbk.x <- data.matrix(hbk[, 1:3])
mcd <- covMcd(hbk.x)       # compute mcd in advance
## must be a 2-dimensional data set: take the first two columns :
tolEllipsePlot(hbk.x[,1:2])

## an "impressive" example:
data(telef)
tolEllipsePlot(telef, classic=TRUE)




library(DMRnet)


### Name: plot.cv.DMR
### Title: plot.cv.DMR
### Aliases: plot.cv.DMR

### ** Examples

## cv.DMR for linear regression
set.seed(13)
data(miete)
y <- miete$rent
X <- miete$area
cv = cv.DMR(X,y)
plot(cv)





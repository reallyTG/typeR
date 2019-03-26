library(DMRnet)


### Name: coef.cv.DMR
### Title: coef.cv.DMR
### Aliases: coef.cv.DMR

### ** Examples

## cv.DMR for linear regression
set.seed(13)
data(miete)
y <- miete$rent
X <- miete$area
cv = cv.DMR(X,y)
coef(cv)





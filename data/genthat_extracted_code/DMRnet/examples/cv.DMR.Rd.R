library(DMRnet)


### Name: cv.DMR
### Title: cross-validation for DMR
### Aliases: cv.DMR

### ** Examples

## cv.DMR for linear regression
set.seed(13)
data(miete)
ytr <- miete$rent[1:1500]
Xtr <- miete$area[1:1500]
Xte <- miete$area[1501:2053]
cv <- cv.DMR(Xtr, ytr)
print(cv)
plot(cv)
coef(cv)
ypr <- predict(cv, newx = Xte)





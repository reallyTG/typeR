library(DMRnet)


### Name: cv.DMRnet
### Title: cross-validation for DMRnet
### Aliases: cv.DMRnet

### ** Examples

## cv.DMRnet for linear regression
set.seed(13)
data(miete)
ytr <- miete$rent[1:1500]
Xtr <- miete$area[1:1500]
Xte <- miete$area[1501:2053]
cv <- cv.DMRnet(Xtr, ytr)
print(cv)
plot(cv)
coef(cv)
ypr <- predict(cv, newx = Xte)





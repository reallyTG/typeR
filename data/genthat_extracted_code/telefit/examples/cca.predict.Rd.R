library(telefit)


### Name: cca.predict
### Title: Make predictions using canonical correlation analysis (CCA)
### Aliases: cca.predict

### ** Examples


data("coprecip")
attach(coprecip)

# compute CCA predictions of Y (CO precipitation) given Z (Pacific ocean SSTs)
# using 2 principal components (aka. EOFs)
preds = cca.predict(X = Z, Y = Y, X.new = Z, k.x = 2, k.y = 2)

# compute R^2
1 - var(as.numeric(preds-Y)) / var(as.numeric(Y))





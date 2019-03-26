library(mdatools)


### Name: pca
### Title: Principal Component Analysis
### Aliases: pca

### ** Examples

library(mdatools)
### Examples for PCA class

## 1. Make PCA model for People data with autoscaling
## and full cross-validation

data(people)
model = pca(people, scale = TRUE, cv = 1, info = 'Simple PCA model')
model = selectCompNum(model, 4)
summary(model)
plot(model, show.labels = TRUE)

## 3. Show scores and loadings plots for the model
par(mfrow = c(2, 2))
plotScores(model, comp = c(1, 3), show.labels = TRUE)
plotScores(model, comp = 2, type = 'h', show.labels = TRUE)
plotLoadings(model, comp = c(1, 3), show.labels = TRUE)
plotLoadings(model, comp = c(1, 2), type = 'h', show.labels = TRUE)
par(mfrow = c(1, 1))

## 4. Show residuals and variance plots for the model
par(mfrow = c(2, 2))
plotVariance(model, type = 'h')
plotCumVariance(model, show.labels = TRUE, legend.position = 'bottomright')
plotResiduals(model, show.labels = TRUE)
plotResiduals(model, ncomp = 2, show.labels = TRUE)
par(mfrow = c(1, 1))





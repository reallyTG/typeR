library(mdatools)


### Name: pcares
### Title: Results of PCA decomposition
### Aliases: pcares

### ** Examples

### Examples for PCA results class

library(mdatools)

## 1. Make a model for every odd row of People data
## and apply it to the objects from every even row

data(people)
x = people[seq(1, 32, 2), ]
x.new = people[seq(1, 32, 2), ]

model = pca(people, scale = TRUE, cv = 1, info = 'Simple PCA model')
model = selectCompNum(model, 4)

res = predict(model, x.new)
summary(res)
plot(res)

## 1. Make PCA model for People data with autoscaling
## and full cross-validation and get calibration results


data(people)
model = pca(people, scale = TRUE, cv = 1, info = 'Simple PCA model')
model = selectCompNum(model, 4)

res = model$calres
summary(res)
plot(res)

## 2. Show scores plots for the results
par(mfrow = c(2, 2))
plotScores(res)
plotScores(res, cgroup = people[, 'Beer'], show.labels = TRUE)
plotScores(res, comp = c(1, 3), show.labels = TRUE)
plotScores(res, comp = 2, type = 'h', show.labels = TRUE)
par(mfrow = c(1, 1))

## 3. Show residuals and variance plots for the results
par(mfrow = c(2, 2))
plotVariance(res, type = 'h')
plotCumVariance(res, show.labels = TRUE, legend.position = 'bottomright')
plotResiduals(res, show.labels = TRUE, cgroup = people[, 'Sex'])
plotResiduals(res, ncomp = 2, show.labels = TRUE)
par(mfrow = c(1, 1))





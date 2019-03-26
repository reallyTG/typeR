library(analogue)


### Name: mat
### Title: Modern Analogue Technique transfer function models
### Aliases: mat mat.default mat.formula fitted.mat residuals.mat resid.mat
###   print.residuals.mat print.mat print.fitted.mat
### Keywords: models multivariate methods

### ** Examples

## Imbrie and Kipp Sea Surface Temperature
data(ImbrieKipp)
data(SumSST)
data(V12.122)

## merge training set and core samples
dat <- join(ImbrieKipp, V12.122, verbose = TRUE)

## extract the merged data sets and convert to proportions
ImbrieKipp <- dat[[1]] / 100
ImbrieKippCore <- dat[[2]] / 100

## fit the MAT model using the squared chord distance measure
ik.mat <- mat(ImbrieKipp, SumSST, method = "chord")
ik.mat

## model summary
summary(ik.mat)

## fitted values
fitted(ik.mat)

## model residuals
resid(ik.mat)

## draw summary plots of the model
par(mfrow = c(2,2))
plot(ik.mat)
par(mfrow = c(1,1))

## reconstruct for the V12.122 core data
coreV12.mat <- predict(ik.mat, V12.122, k = 3)
coreV12.mat
summary(coreV12.mat)

## draw the reconstruction
reconPlot(coreV12.mat, use.labels = TRUE, display.error = "bars",
          xlab = "Depth", ylab = "SumSST")

## fit the MAT model using the squared chord distance measure
## and restrict the number of analogues we fit models for to 1:20
ik.mat2 <- mat(ImbrieKipp, SumSST, method = "chord", kmax = 20)
ik.mat2





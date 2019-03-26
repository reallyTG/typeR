library(analogue)


### Name: bootstrap
### Title: Bootstrap estimation and errors
### Aliases: bootstrap bootstrap.default bootstrap.mat print.bootstrap.mat
###   residuals.bootstrap.mat resid.bootstrap.mat
###   print.residuals.bootstrap.mat fitted.bootstrap.mat
###   print.fitted.bootstrap.mat
### Keywords: multivariate methods

### ** Examples

## Imbrie and Kipp example
## load the example data
data(ImbrieKipp)
data(SumSST)
data(V12.122)

## merge training and test set on columns
dat <- join(ImbrieKipp, V12.122, verbose = TRUE)

## extract the merged data sets and convert to proportions
ImbrieKipp <- dat[[1]] / 100
V12.122 <- dat[[2]] / 100

## Imbrie and Kipp foraminfera sea-surface temperature 
## fit the MAT model using the squared chord distance measure
ik.mat <- mat(ImbrieKipp, SumSST, method = "SQchord")

## bootstrap training set
ik.boot <- bootstrap(ik.mat, n.boot = 100)
ik.boot
summary(ik.boot)

## Bootstrap fitted values for training set
fitted(ik.boot)

## residuals
resid(ik.boot) # uses abbreviated form




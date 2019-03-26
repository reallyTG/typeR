library(analogue)


### Name: RMSEP
### Title: Root mean square error of prediction
### Aliases: RMSEP RMSEP.default RMSEP.mat RMSEP.bootstrap.mat
###   RMSEP.bootstrap.wa
### Keywords: methods utilities

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

## fit the MAT model using the squared chord distance measure
(ik.mat <- mat(ImbrieKipp, SumSST, method = "chord"))

## Leave-one-out RMSEP for the MAT model
RMSEP(ik.mat)

## bootstrap training set
(ik.boot <- bootstrap(ik.mat, n.boot = 100))

## extract the Birks et al (1990) RMSEP
RMSEP(ik.boot)

## Calculate the alternative formulation
RMSEP(ik.boot, type = "standard")




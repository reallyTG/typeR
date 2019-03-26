library(analogue)


### Name: screeplot
### Title: Screeplots of model results
### Aliases: screeplot.mat screeplot.bootstrap.mat
### Keywords: hplot methods

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

## fit the MAT model using the chord distance measure
(ik.mat <- mat(ImbrieKipp, SumSST, method = "chord"))

screeplot(ik.mat)




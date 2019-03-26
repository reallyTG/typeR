library(analogue)


### Name: analog
### Title: Analogue matching
### Aliases: analog analog.default analog.distance print.analog
### Keywords: multivariate

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

## analog matching between SWAP and RLGH core
ik.analog <- analog(ImbrieKipp, V12.122, method = "chord")
ik.analog
summary(ik.analog)

## Can take pre-computed dissimilarity objects
d1 <- distance(ImbrieKipp, V12.122)
d2 <- distance(ImbrieKipp)
ik <- analog(d1, d2, keep.train = TRUE)
ik





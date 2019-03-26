library(analogue)


### Name: cma
### Title: Close modern analogues
### Aliases: cma cma.default cma.analog cma.mat cma.predict.mat print.cma
###   plot.cma
### Keywords: methods manip hplot

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

## analog matching between SWAP and RLGH reference samples
(ik.ana <- analog(ImbrieKipp, V12.122, method = "chord"))

## close modern analogues --- no analogues are "close"
(ik.cma <- cma(ik.ana, cutoff = 0.91))
summary(ik.cma)

## plot the results
plot(ik.cma)





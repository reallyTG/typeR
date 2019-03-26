library(mpm)


### Name: summary.mpm
### Title: Summary Statistics for Spectral Map Analysis...
### Aliases: summary.mpm summary.mpm
### Keywords: multivariate

### ** Examples
# Example 1 weighted spectral map analysis Golub data
data(Golub)
r.sma <- mpm(Golub[,1:39], row.weight = "mean", col.weight = "mean")
# summary report
summary(r.sma)
# Example 2 using print function
data(Famin81A)
r.fam <- mpm(Famin81A, row.weight = "mean", col.weight = "mean")
r.sum <- summary(r.fam)
print(r.sum, what = "all")



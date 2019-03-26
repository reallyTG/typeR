library(DiPhiSeq)


### Name: outprop
### Title: Give a rough estimate of the proportion of outliers in the data
###   based on the results of DiPhiSeq.
### Aliases: outprop

### ** Examples

countmat <- matrix(rnbinom(100, size=1, mu=50), nrow=4, ncol=25)
classlab <- c(rep(1, 10), rep(2, 15))
res <- diphiseq(countmat, classlab)
outlier.proportion <- outprop(res)




library(DiPhiSeq)


### Name: diphiseq
### Title: Main function. For most users, this function is all what they
###   need for the analysis.
### Aliases: diphiseq

### ** Examples

countmat <- matrix(rnbinom(100, size=1, mu=50), nrow=4, ncol=25)
classlab <- c(rep(1, 10), rep(2, 15))
res <- diphiseq(countmat, classlab)

countmat <- matrix(rnbinom(100, size=1, mu=50), nrow=4, ncol=25)
classlab <- c(rep(1, 10), rep(2, 15))
res <- diphiseq(countmat, classlab, phi.ini=0.5)




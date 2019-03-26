library(ClassComparison)


### Name: TNoM-class
### Title: Classes "TNoM" and "fullTNoM"
### Aliases: TNoM TNoM-class countSignificant,TNoM-method
###   selectSignificant,TNoM-method summary,TNoM-method update,TNoM-method
###   fullTNoM-class hist,fullTNoM-method plot,fullTNoM,missing-method
### Keywords: classes multivariate htest

### ** Examples

showClass("TNoM")
showClass("fullTNoM")
n.genes <- 200
n.samples <- 10

bogus <- matrix(rnorm(n.samples*n.genes, 0, 3), ncol=n.samples)
splitter <- rep(FALSE, n.samples)
splitter[sample(1:n.samples, trunc(n.samples/2))] <- TRUE

tn <- TNoM(bogus, splitter)
summary(tn)

tnf <- update(tn)
plot(tnf)
hist(tnf)




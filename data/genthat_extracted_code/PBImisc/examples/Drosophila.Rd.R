library(PBImisc)


### Name: Drosophila
### Title: Drosophila datasets and QTL mapping study
### Aliases: Drosophila
### Keywords: Drosophila

### ** Examples

data(Drosophila)
library(lattice)
# calculate log likelihoods
pval1 = numeric(41)
for (i in 1:41) {
  y = Drosophila$bm$pc1
  x = factor(Drosophila$bm[,i])
  pval1[i] = logLik(lm(y~x))
}
# loglikelihood plot
xyplot(pval1~pos|chr, data=Drosophila, type=c("p","l"), 
     pch=19, ylab="log likelihood")




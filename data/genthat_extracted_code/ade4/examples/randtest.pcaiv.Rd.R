library(ade4)


### Name: randtest.pcaiv
### Title: Monte-Carlo Test on the percentage of explained (i.e.
###   constrained) inertia
### Aliases: randtest.pcaiv randtest.pcaivortho
### Keywords: multivariate nonparametric

### ** Examples

data(rpjdl)
millog <- log(rpjdl$mil + 1)
coa1 <- dudi.coa(rpjdl$fau, scann = FALSE)
caiv1 <- pcaiv(coa1, millog, scan = FALSE)
randtest(caiv1)




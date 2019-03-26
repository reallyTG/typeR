library(StatMatch)


### Name: pBayes
### Title: Pseudo-Bayes estimates of cell probabilities
### Aliases: pBayes
### Keywords: multivariate

### ** Examples


data(samp.A, package="StatMatch")
tab <- xtabs(~ area5 + urb + c.age + sex + edu7, data = samp.A)
out.pb <- pBayes(x=tab, method="m.ind")
out.pb$info

out.pb <- pBayes(x=tab, method="h.assoc")
out.pb$info

out.pb <- pBayes(x=tab, method="Jeffreys")
out.pb$info

# usage of weights in estimating the input table
n <- nrow(samp.A)
r.w <- samp.A$ww / sum(samp.A$ww) * n   # rescale weights to sum up to n 
tab.w <- xtabs(r.w ~ area5 + urb + c.age + sex + edu7, data = samp.A)
out.pbw <- pBayes(x=tab.w, method="m.ind")
out.pbw$info





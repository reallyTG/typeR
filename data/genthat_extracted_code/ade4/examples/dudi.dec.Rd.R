library(ade4)


### Name: dudi.dec
### Title: Decentred Correspondence Analysis
### Aliases: dudi.dec
### Keywords: multivariate

### ** Examples

data(ichtyo)
dudi1 <- dudi.dec(ichtyo$tab, ichtyo$eff, scan = FALSE)
sum(apply(ichtyo$tab, 2, function(x)
    chisq.test(x, p = ichtyo$eff/sum(ichtyo$eff))$statistic))
sum(dudi1$eig) * sum(ichtyo$eff) # the same

s.class(dudi1$li, ichtyo$dat, wt = ichtyo$eff/sum(ichtyo$eff))




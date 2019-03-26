library(cluster)


### Name: coef.hclust
### Title: Agglomerative / Divisive Coefficient for 'hclust' Objects
### Aliases: coefHier coef.hclust coef.twins
### Keywords: cluster

### ** Examples

data(agriculture)
aa <- agnes(agriculture)
coef(aa) # really just extracts aa$ac
coef(as.hclust(aa))# recomputes
coefHier(aa)       # ditto
## Don't show: 
 stopifnot(all.equal(coef(aa), coefHier(aa)))
 d.a <- dist(agriculture, "manhattan")
 for (m in c("average", "single", "complete"))
    stopifnot(all.equal(coef(hclust(d.a, method=m)),
                        coef(agnes (d.a, method=m)), tol=1e-13))
## End(Don't show)




library(sharx)


### Name: hsarx
### Title: Fit SAR, SARX, HSAR and HSARX models to data
### Aliases: hsarx hsarx-class show,hsarx-method
### Keywords: htest models

### ** Examples

## Not run: 
##D ## to reproduce results from Solymos and Lele (Table 1)
##D data(sardata)
##D DAT <- data.frame(sardata$islands, 
##D     sardata$studies[match(sardata$islands$study, 
##D     rownames(sardata$studies)),])
##D x <- hsarx(log(S+0.5) ~ log(A) | (taxon.group + island.type + 
##D     abs(latitude) + I(log(extent)))^2 | study, DAT, 
##D     n.clones=5, n.adapt=2000, n.update=3000, n.iter=1000)
##D 
##D ## SAR
##D DATS <- DAT[1:191,]
##D (x1 <- hsarx(log(S+0.5) ~ log(A), 
##D     DATS[DATS$study=="abbott1978bird",], n.clones=2))
##D 
##D ## SARX
##D DATS$rnd <- rnorm(nrow(DATS), log(DATS$extent))
##D (x2 <- hsarx(log(S+0.5) ~ log(A) * rnd, 
##D     DATS[DATS$study=="abbott1978bird",], n.clones=2))
##D 
##D ## HSAR
##D (x3 <- hsarx(log(S+0.5) ~ log(A) | 1 | study, 
##D     DATS, n.clones=2, n.iter=1000))
##D 
##D ## HSARX
##D (x4 <- hsarx(log(S+0.5) ~ log(A) | abs(latitude) | study, 
##D     DATS, n.clones=2, n.iter=1000))
## End(Not run)




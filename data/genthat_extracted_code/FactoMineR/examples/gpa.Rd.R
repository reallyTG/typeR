library(FactoMineR)


### Name: GPA
### Title: Generalised Procrustes Analysis
### Aliases: GPA
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(wine)
##D res.gpa <- GPA(wine[,-(1:2)], group=c(5,3,10,9,2),
##D     name.group=c("olf","vis","olfag","gust","ens"))
##D 
##D ### If you want to construct the partial points for some individuals only
##D plotGPApartial (res.gpa)
## End(Not run)




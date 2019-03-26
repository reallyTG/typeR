library(FactoMineR)


### Name: tea
### Title: tea (data)
### Aliases: tea
### Keywords: datasets

### ** Examples

## Not run: 
##D data(tea)
##D res.mca=MCA(tea,quanti.sup=19,quali.sup=20:36)
##D plot(res.mca,invisible=c("var","quali.sup","quanti.sup"),cex=0.7)
##D plot(res.mca,invisible=c("ind","quali.sup","quanti.sup"),cex=0.8)
##D plot(res.mca,invisible=c("quali.sup","quanti.sup"),cex=0.8)
##D dimdesc(res.mca)
##D plotellipses(res.mca,keepvar=1:4)
##D 
##D ## make a hierarchical clustering: click on the tree to define the number of clusters
##D ## HCPC(res.mca)
## End(Not run)




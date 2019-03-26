library(FactoMineR)


### Name: wine
### Title: Wine
### Aliases: wine
### Keywords: datasets

### ** Examples

data(wine)

## Example of PCA
res.pca = PCA(wine,ncp=5, quali.sup = 1:2)

## Not run: 
##D ## Example of MCA
##D res.mca = MCA(wine,ncp=5, quanti.sup = 3:ncol(wine))
##D 
##D ## Example of MFA
##D res.mfa = MFA(wine,group=c(2,5,3,10,9,2),type=c("n",rep("s",5)),ncp=5,
##D     name.group=c("orig","olf","vis","olfag","gust","ens"),
##D     num.group.sup=c(1,6),graph=FALSE)
##D plotellipses(res.mfa)
##D plotellipses(res.mfa,keepvar="Label") ## for 1 variable
## End(Not run)




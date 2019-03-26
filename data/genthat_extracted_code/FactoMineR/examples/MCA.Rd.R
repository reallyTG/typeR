library(FactoMineR)


### Name: MCA
### Title: Multiple Correspondence Analysis (MCA)
### Aliases: MCA
### Keywords: multivariate

### ** Examples

## Not run: 
##D ## Tea example
##D  data(tea)
##D  res.mca <- MCA(tea,quanti.sup=19,quali.sup=20:36)
##D  summary(res.mca)
##D  plot(res.mca,invisible=c("var","quali.sup","quanti.sup"),cex=0.7)
##D  plot(res.mca,invisible=c("ind","quali.sup","quanti.sup"),cex=0.8)
##D  plot(res.mca,invisible=c("quali.sup","quanti.sup"),cex=0.8)
##D  dimdesc(res.mca)
##D  plotellipses(res.mca,keepvar=1:4)
##D  plotellipses(res.mca,keepvar="Tea")
##D 
##D ## Hobbies example
##D data(hobbies)
##D res.mca <- MCA(hobbies,quali.sup=19:22,quanti.sup=23)
##D plot(res.mca,invisible=c("ind","quali.sup"),hab="quali") 
##D plot(res.mca,invisible=c("var","quali.sup"),cex=.5,label="none") 
##D plot(res.mca,invisible=c("ind","var"),hab="quali")
##D dimdesc(res.mca)
##D plotellipses(res.mca,keepvar=1:4)
##D 
##D ## Specific MCA: some categories are supplementary
##D data (poison)
##D res <- MCA (poison[,3:8],excl=c(1,3))
##D 
##D ## Example with missing values : use the missMDA package
##D require(missMDA)
##D data(vnf)
##D completed <- imputeMCA(vnf,ncp=2)
##D res.mca <- MCA(vnf,tab.disj=completed$tab.disj)
## End(Not run)




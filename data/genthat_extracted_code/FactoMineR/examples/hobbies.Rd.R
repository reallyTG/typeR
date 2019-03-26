library(FactoMineR)


### Name: hobbies
### Title: hobbies (data)
### Aliases: hobbies
### Keywords: datasets

### ** Examples

data(hobbies)
## Not run: 
##D res.mca <- MCA(hobbies,quali.sup=19:22,quanti.sup=23,method="Burt")
##D plot(res.mca,invisible=c("ind","quali.sup"),hab="quali") ### active var. only
##D plot(res.mca,invisible=c("var","quali.sup"),cex=.5,label="none") ### individuals only
##D plot(res.mca,invisible=c("ind","var"),hab="quali") ### supp. qualitative var. only
##D 
##D dimdesc(res.mca)
##D plotellipses(res.mca,keepvar=1:4)
## End(Not run)





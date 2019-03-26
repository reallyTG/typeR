library(FactoMineR)


### Name: MFA
### Title: Multiple Factor Analysis (MFA)
### Aliases: MFA
### Keywords: multivariate

### ** Examples

data(wine)
res <- MFA(wine, group=c(2,5,3,10,9,2), type=c("n",rep("s",5)),
    ncp=5, name.group=c("orig","olf","vis","olfag","gust","ens"),
    num.group.sup=c(1,6))
summary(res)
barplot(res$eig[,1],main="Eigenvalues",names.arg=1:nrow(res$eig))

## Not run: 
##D #### Confidence ellipses around categories per variable
##D plotellipses(res)
##D plotellipses(res,keepvar="Label") ## for 1 variable
##D 
##D #### Interactive graph
##D liste = plotMFApartial(res)
##D plot(res,choix="ind",habillage = "Terroir")
##D 
##D ###Example with groups of categorical variables
##D data (poison)
##D MFA(poison, group=c(2,2,5,6), type=c("s","n","n","n"),
##D     name.group=c("desc","desc2","symptom","eat"),
##D     num.group.sup=1:2)
##D 
##D ###Example with groups of frequency tables
##D data(mortality)
##D res<-MFA(mortality,group=c(9,9),type=c("f","f"),
##D     name.group=c("1979","2006"))
## End(Not run)




library(psych)


### Name: faCor
### Title: Correlations between two factor analysis solutions
### Aliases: faCor
### Keywords: multivariate models

### ** Examples

faCor(Thurstone,nfactors=c(2,3)) #compare two solutions to the Thurstone problem
faCor(bfi[1:25],nfactors=c(5,5),fm=c("minres","pca")) #compare pca and fa solutions
#compare two levels of factor extraction, and then find the correlations of the scores
faCor(bfi[1:25],nfactors=c(3,5)) #based upon linear algebra 
f3 <- fa(bfi[1:25],3,scores="tenBerge")
f5 <- fa(bfi[1:25],5 ,scores="tenBerge")
cor2(f3$scores,f5$scores) #the correlation between the factor score estimates




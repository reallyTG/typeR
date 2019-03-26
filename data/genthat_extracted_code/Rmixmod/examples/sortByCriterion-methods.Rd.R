library(Rmixmod)


### Name: sortByCriterion
### Title: Sorting results of a ['Mixmod'] object by a given criterion
### Aliases: sortByCriterion sortByCriterion,Mixmod,character-method

### ** Examples

  x<-mixmodCluster(iris[1:4],2:10,criterion=c("BIC","ICL"))
  icl<-sortByCriterion(x,"ICL")
  icl["results"]





library(mmtfa)


### Name: mmtfa
### Title: mmtfa: Function for Model-Based Clustering and Classification
###   with Mixtures of Multivariate t Factor Analyzers
### Aliases: mmtfa

### ** Examples

###Note that only one model is run for each example
###in order to reduce computation time

#Clustering iris data with hard random start
tirisr <- mmtfa(iris[,-5], models="UUUU", Gs=1:3, Qs=1, init="hard")

#Clustering iris data with hierarchical starting values
initial_list <- list()
clustree <- hclust(dist(iris[,-5]))
for(i in 1:3){
	initial_list[[i]] <- cutree(clustree,i)
}
tirish <- mmtfa(iris[,-5], models="CUCU", Gs=1:3, Qs=1, init=initial_list)

#Classification with the iris data set via percentage of data taken to have known membership
tirisc <- mmtfa(iris[,-5], Qs=1, models="CUIU", init="uniform",clas=50, known=iris[,5])
tirisc$tab





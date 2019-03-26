library(qha)


### Name: classification
### Title: Cluster Analysis
### Aliases: classification
### Keywords: cluster analysis kmeans method ward method

### ** Examples

data(ratingTV)
 

# Fuzzy Correspondence Analysis 
fuzzyb<-fuzzy(datos=ratingTV$tab, vectorc=c(15,15,15,15,15,15))  
6

#Cluster analysis
clases<-classification(datos=fuzzyb$li,numclass=7, numaxes=6)
clases$cluster
clases$centers
clases$size





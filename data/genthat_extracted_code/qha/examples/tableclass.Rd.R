library(qha)


### Name: tableclass
### Title: Correspondence Analysis Factorial Planes
### Aliases: tableclass
### Keywords: cluster analysis

### ** Examples

data(ratingTV)

# Fuzzy Correspondence Analysis 
fuzzyb<-fuzzy(datos=ratingTV$tab, vectorc=c(15,15,15,15,15,15))  
20

tabla_clases<-tableclass(fuzzyb$li, numaxes=4, numclass=7)
tabla_clases




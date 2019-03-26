library(qha)


### Name: fuzzy
### Title: Qualitative Harmonic Analysis
### Aliases: fuzzy fuzzy
### Keywords: qualitative harmonic analysis fuzzy correspondence analysis

### ** Examples


data(ratingTV)

# Fuzzy Correspondence Analysis with weights
fuzzya<-fuzzy(datos=ratingTV$tab, vectorc=c(15,15,15,15,15,15), pesos=ratingTV$weight) 
6


# Fuzzy Correspondence Analysis without weights
fuzzyb<-fuzzy(datos=ratingTV$tab, vectorc=c(15,15,15,15,15,15))  
6

# First factorial plane with FactoClass
#plot(fuzzya,1,2,Tcol=FALSE,ucal=10)
#plot(fuzzyb,1,2,Tcol=FALSE,ucal=10)





library(rFerns)


### Name: naiveWrapper
### Title: Naive feature selection method utilising the rFerns shadow
###   imporance
### Aliases: naiveWrapper

### ** Examples

set.seed(77)
#Fetch Iris data
data(iris)
#Extend with random noise
noisyIris<-cbind(iris[,-5],apply(iris[,-5],2,sample))
names(noisyIris)[5:8]<-sprintf("Nonsense%d",1:4)
#Execute selection
naiveWrapper(noisyIris,iris$Species,iterations=50,ferns=20,size=8)




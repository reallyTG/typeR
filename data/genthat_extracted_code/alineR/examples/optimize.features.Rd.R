library(alineR)


### Name: optimize.features
### Title: Supervised learning with a genetic algorithm
### Aliases: optimize.features
### Keywords: Optimal Parameter Genetic Algorithm

### ** Examples

# This simplified example illustrates the supervised learning workflow 
# some cognate data
data<-data.frame(dog=c('dog','perro'),cat=c('cat','gato'),rat=c('rat','rata'))

# generate training data for linguist (not written)
M1<-generate.training(raw.data=data, search.size=100)

# optimize features using expert determinations: 1,1,1
optimize.features(set=M1, ranking=c(1,1,1),
            num=20, step=5, replication=2, list=FALSE)





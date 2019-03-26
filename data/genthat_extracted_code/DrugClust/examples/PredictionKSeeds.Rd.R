library(DrugClust)


### Name: PredictionKSeeds
### Title: PredictionKSeeds
### Aliases: PredictionKSeeds

### ** Examples

r <- 8
c <- 10
m0 <- matrix(0, r, c)
num_clusters=4
features<-apply(m0, c(1,2), function(x) sample(c(0,1),1))
#Generate a sample side effects binary matrix
r1 <- 8
c1 <- 15
m1 <- matrix(0, r1, c1)
side_effects<-apply(m1, c(1,2), function(x) sample(c(0,1),1))
folds<-CreateFolds(features,2)
i=0
train = features[folds != i,]
trainpharmat = side_effects[folds != i,]
test = features[folds == i,]
testpharmat = side_effects[folds == i,]
s<-RandomSeedGenerator(num_clusters,nrow(train))
Seed<-SeedSelection(train,num_clusters,s)
clusters<-KSeedsClusters (train,num_clusters,Seed,s)
A<-KSeedsScores(train,trainpharmat,num_clusters,Seed,s,clusters)
predizioni<-PredictionKSeeds(test,Seed,num_clusters,A,ncol(side_effects))




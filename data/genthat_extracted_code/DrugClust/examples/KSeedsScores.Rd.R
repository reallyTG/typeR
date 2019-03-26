library(DrugClust)


### Name: KSeedsScores
### Title: KSeedsScores
### Aliases: KSeedsScores

### ** Examples

r <- 8
c <- 10
m0 <- matrix(0, r, c)
num_clusters=4
features<-apply(m0, c(1,2), function(x) sample(c(0,1),1))
#Generate a sample side effects binary matrix
r1 <- 8
c1 <- 10
m1 <- matrix(0, r1, c1)
side_effects<-apply(m1, c(1,2), function(x) sample(c(0,1),1))
s<-RandomSeedGenerator(num_clusters,nrow(features))
Seed<-SeedSelection(features,num_clusters,s)
clusters<-KSeedsClusters (features,num_clusters,Seed,s)
A<-KSeedsScores(features,side_effects,num_clusters,Seed,s,clusters)




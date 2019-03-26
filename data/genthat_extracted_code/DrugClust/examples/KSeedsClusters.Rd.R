library(DrugClust)


### Name: KSeedsClusters
### Title: KSeedsClusters
### Aliases: KSeedsClusters

### ** Examples

r <- 8
c <- 10
m0 <- matrix(0, r, c)
num_clusters=4
features<-apply(m0, c(1,2), function(x) sample(c(0,1),1))
s<-RandomSeedGenerator(num_clusters,nrow(features))
Seed<-SeedSelection(features,num_clusters,s)
clusters<-KSeedsClusters (features,num_clusters,Seed,s)




library(RDS)


### Name: get.seed.id
### Title: Calculates the root seed id for each node of the recruitement
###   tree.
### Aliases: get.seed.id

### ** Examples

data(fauxmadrona)
seeds <- get.seed.id(fauxmadrona)
#number recruited by each seed
barplot(table(seeds))




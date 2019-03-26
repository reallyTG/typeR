library(mazeGen)


### Name: genEMLseed
### Title: Generate Equal Minimum Legs Seed
### Aliases: genEMLseed

### ** Examples


rank <- 5
satPercent <- 0.5
seed <- 1

#Search for just one unique path
justOne <- genEMLseed(path=1,rank=rank,satPercent=satPercent,seed=seed)
nodePosition <- np(rank,satPercent,seed=justOne)
mazeEst(nodePosition)

#Search for three path
justThree <- genEMLseed(path=3,rank=rank,satPercent=satPercent,seed=seed, runSeed=300)
nodePosition <- np(rank,satPercent,seed=justThree)
mazeEst(nodePosition)




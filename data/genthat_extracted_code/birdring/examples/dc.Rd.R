library(birdring)


### Name: dc
### Title: Division coefficient
### Aliases: dc bootci.dc
### Keywords: ring recovery migratory connectivity

### ** Examples


N<-c(7125, 9661, 5266, 3240, 3643, 3192, 3227)

recmatrix<-matrix(c(22,25, 6, 2, 4, 1, 0, 47, 78, 49, 28, 38,27, 34), ncol=2)
colnames(recmatrix) <- c("Scandinavian", "Eastern")
rownames(recmatrix) <- c("North", "West", "Southwest",
    "Central North", "Central South", "Northeast","Southeast")

dc(N, recmatrix, group.names= c("North", "West", "Southwest",
    "Central North", "Central South", "Northeast","Southeast"),
    area.names= c("Scandinavian", "Eastern"))





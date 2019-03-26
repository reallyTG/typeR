library(ppsbm)


### Name: ARI
### Title: Adjusted Rand Index (ARI)
### Aliases: ARI

### ** Examples


z <- matrix(c(1,1,0,0,0,0, 0,0,1,1,0,0, 0,0,0,0,1,1), nrow = 3, byrow = TRUE)
hat.z <- matrix(c(0,0,1,1,0,0, 1,1,0,0,0,0, 0,0,0,0,1,1), nrow = 3, byrow = TRUE)

ARI(z, hat.z)





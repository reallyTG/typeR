library(ppsbm)


### Name: permuteZEst
### Title: Optimal matching between 2 clusterings
### Aliases: permuteZEst

### ** Examples


z <- matrix(c(1,1,0,0,0,0, 0,0,1,1,0,0, 0,0,0,0,1,1), nrow = 3, byrow = TRUE)
hat.z <- matrix(c(0,0,1,1,0,0, 1,1,0,0,0,0, 0,0,0,0,1,1), nrow = 3, byrow = TRUE)

perm <- permuteZEst(z,hat.z)





library(BAT)


### Name: gdm
### Title: General dynamic model of oceanic island biogeography (GDM).
### Aliases: gdm

### ** Examples

div <- c(1,3,5,8,10)
comm <- matrix(c(2,0,0,0,3,1,0,0,2,4,5,0,1,3,2,5,1,1,1,1), nrow = 5, ncol = 4, byrow = TRUE)
tree <- hclust(dist(c(1:4), method="euclidean"), method="average")
area <- c(10,40,80,160,160)
time <- c(1,2,3,4,5)
gdm(div,,area,time)
gdm(comm,tree,area,time)
gdm(div,,area)




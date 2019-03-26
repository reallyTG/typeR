library(LPmerge)


### Name: LPmerge
### Title: Merging linkage maps by linear programming.
### Aliases: LPmerge

### ** Examples

mapI <- data.frame(marker=c("A","B","C","D","E","F","G"),position=0:6) 
mapII <- data.frame(marker=c("A","C","B","D","E","F","G"),position=0:6) 
mapIII <- data.frame(marker=c("A","B","C","D","E","G","F"),position=0:6) 
mapIV <- data.frame(marker=c("B","A","C","D","E","F","G"),position=0:6) 

maps <- list(I=mapI,II=mapII,III=mapIII,IV=mapIV)
ans <- LPmerge(maps)




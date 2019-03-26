library(RClone)


### Name: edge_effect
### Title: Edge Effect
### Aliases: edge_effect edge_effect_core
### Keywords: documentation

### ** Examples

data(posidonia)
data(coord_posidonia)

center1 <- c(40,10)
#Our sample quadra ranges from 0 to 80 and 0 to 20

edge_effect(posidonia, coords = coord_posidonia, center = center1, nbrepeat = 1000, 
	bar = TRUE)

#But if, for some reasons you don't know where the middle of the sampling 
##area is, you can try some of these:
center <- c(mean(coord_posidonia[,1]), mean(coord_posidonia[,2])) #or
center <- c(mean(c(min(coord_posidonia[,1]), max(coord_posidonia[,1]))), 
mean(c(min(coord_posidonia[,2]), max(coord_posidonia[,2])))) #or
center <- c((max(coord_posidonia[,1])-min(coord_posidonia[,1]))/2, 
(max(coord_posidonia[,2])-min(coord_posidonia[,2]))/2)




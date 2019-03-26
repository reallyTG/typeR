library(geomorph)


### Name: coords.subset
### Title: Subset landmark coordinates via a factor
### Aliases: coords.subset
### Keywords: utilities

### ** Examples

data(pupfish) 
group <- factor(paste(pupfish$Pop, pupfish$Sex))
levels(group)
new.coords <- coords.subset(A = pupfish$coords, group = group)
names(new.coords) # see the list levels
# group shape means
lapply(new.coords, mshape)





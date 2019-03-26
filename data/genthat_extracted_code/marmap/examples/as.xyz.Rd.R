library(marmap)


### Name: as.xyz
### Title: Convert to xyz format
### Aliases: as.xyz

### ** Examples

# load celt data
data(celt)
dim(celt)
class(celt)
summary(celt)
plot(celt,deep= -300,shallow= -25,step=25)

# use as.xyz
celt2 <- as.xyz(celt)
dim(celt2)
class(celt2)
summary(celt2)





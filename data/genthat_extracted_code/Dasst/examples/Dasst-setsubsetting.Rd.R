library(Dasst)


### Name: [<-
### Title: "[<-" method for class 'Dasst'
### Aliases: [<- [<-,Dasst,logical-method [<-,Dasst,numeric-method

### ** Examples

# Replace position 1 with the contents of position 30.
data(plantGrowth)
plantGrowth[[1]][1:10, 1:15]
plantGrowth[1] <- plantGrowth[30]
plantGrowth[[1]][1:10, 1:15]

# Add a copy of the first order at the end extending the object length
rmax <- length(plantGrowth)
rmax
plantGrowth[rmax+1] <- plantGrowth[1]
length(plantGrowth)

# Copy position 2 into position 31, moving the former position 31 to the 32.
plantgro31 <- plantGrowth[31]
plantGrowth[31] <- plantGrowth[2]
plantGrowth[32] <- plantgro31




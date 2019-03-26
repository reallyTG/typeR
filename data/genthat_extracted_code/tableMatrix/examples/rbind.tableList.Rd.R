library(tableMatrix)


### Name: rbind.tableList
### Title: Combine by rows
### Aliases: rbind.tableList

### ** Examples


data(images8By8)
data(images10By10)

# Create tableList objects from images8By8[,1:3] and images10By10[,1:3]
TL1 <- tableList(images8By8[,1:3])
TL2 <- tableList(images10By10[,1:3])

# Bindind rows of two tableList objects
rbind(TL1, TL2)





library(itree)


### Name: prune.itree
### Title: Cost-complexity Pruning of an itree Object
### Aliases: prune.itree prune
### Keywords: tree

### ** Examples

#the rpart example:
z.auto <- itree(Mileage ~ Weight, car.test.frame)
zp <- prune(z.auto, cp=0.1)
plot(zp) #plot smaller itree object




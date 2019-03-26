library(kulife)


### Name: bees
### Title: Bee data. Number of different types of bees caught.
### Aliases: bees
### Keywords: datasets

### ** Examples

data(bees)
model <- glm(Number ~ Locality + Type*Color,
             family=poisson, data=bees)




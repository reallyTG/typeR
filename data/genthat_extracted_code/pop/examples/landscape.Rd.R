library(pop)


### Name: landscape
### Title: landscape objects
### Aliases: [[.landscape area area<- as.landscape distance distance<-
###   features features<- is.landscape landscape landscape<- population
###   population<- print.landscape

### ** Examples

# create a default landscape
landscape <- as.landscape(NULL)

# create a marginally more interesting one-patch landscape
landscape <- as.landscape(list(coordinates = data.frame(x = c(10, 11),
                                                        y = c(11, 12)),
                               area = data.frame(area = 10),
                               population = data.frame(adult = 10,
                                                       larva = 3,
                                                       egg = 20),
                               features = data.frame(temperature = 10)))
# print method
print(landscape)

# get and set the area
area(landscape)
area(landscape) <- area(landscape) * 2
area(landscape)

# get and set the population
population(landscape)
population(landscape) <- population(landscape) * 2
population(landscape)

# get and set the features
features(landscape)
features(landscape) <- cbind(features(landscape), rainfall = 100)
features(landscape)

# get and set the distance matrix
distance(landscape)
distance(landscape) <- sqrt(distance(landscape))
distance(landscape)

# landscapes can be subsetted to get sub-landscapes of patches with double
# braces
landscape
landscape[[1]]
landscape[[1:2]]





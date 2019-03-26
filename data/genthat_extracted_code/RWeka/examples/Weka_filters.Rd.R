library(RWeka)


### Name: Weka_filters
### Title: R/Weka Filters
### Aliases: Normalize Discretize
### Keywords: models classif

### ** Examples

## Using a Weka data set ...
w <- read.arff(system.file("arff","weather.arff",
	       package = "RWeka"))

## Normalize (response irrelevant)
m1 <- Normalize(~., data = w)
m1

## Discretize
m2 <- Discretize(play ~., data = w)
m2




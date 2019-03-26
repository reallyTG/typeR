library(RRF)


### Name: imports85
### Title: The Automobile Data
### Aliases: imports85
### Keywords: datasets

### ** Examples

data(imports85)
imp85 <- imports85[,-2]  # Too many NAs in normalizedLosses.
imp85 <- imp85[complete.cases(imp85), ]
## Drop empty levels for factors.
imp85[] <- lapply(imp85, function(x) if (is.factor(x)) x[, drop=TRUE] else x)

stopifnot(require(RRF))
price.rf <- RRF(price ~ ., imp85, do.trace=10, ntree=100)
print(price.rf)
numDoors.rf <- RRF(numOfDoors ~ ., imp85, do.trace=10, ntree=100)
print(numDoors.rf)




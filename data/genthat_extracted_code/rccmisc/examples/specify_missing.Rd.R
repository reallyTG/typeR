library(rccmisc)


### Name: specify_missing
### Title: Specify missing values for a vector
### Aliases: specify_missing

### ** Examples

x <- sample(100)
x[sample(100, 10)] <- 999
specify_missing(x, 999)




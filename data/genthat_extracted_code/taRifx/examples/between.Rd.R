library(taRifx)


### Name: between
### Title: Classify values into groups based on which numbers they're
###   between
### Aliases: between bin quantile_cutpoints

### ** Examples

test <- runif(100)
between(test,c(0,.1,.5,.9,1))
bin(test,n=5)




library(tnet)


### Name: weighted_richclub_w
### Title: The weighted rich-club effect
### Aliases: weighted_richclub_w

### ** Examples

## Load sample data
sample <- cbind(
i=c(1,1,2,2,2,2,3,3,4,5,5,6),
j=c(2,3,1,3,4,5,1,2,2,2,6,5),
w=c(4,2,4,4,1,2,2,4,1,2,1,1))

## Run the function
weighted_richclub_w(sample, rich="k", reshuffle="weights")





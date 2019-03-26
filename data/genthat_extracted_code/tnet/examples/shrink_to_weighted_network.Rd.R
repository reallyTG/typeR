library(tnet)


### Name: shrink_to_weighted_network
### Title: Shrink a repetative edgelist into a weighted
### Aliases: shrink_to_weighted_network

### ** Examples

## Load sample data
sample <- rbind(
c(1,2),
c(1,2),
c(1,2),
c(1,2),
c(1,3),
c(1,3),
c(2,1),
c(2,1),
c(2,1),
c(2,1),
c(2,3),
c(2,3),
c(2,3),
c(2,3),
c(2,4),
c(2,5),
c(2,5),
c(3,1),
c(3,1),
c(3,2),
c(3,2),
c(3,2),
c(3,2),
c(4,2),
c(5,2),
c(5,2),
c(5,6),
c(6,5))

## Run the programme
shrink_to_weighted_network(sample)




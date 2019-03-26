library(tnet)


### Name: degree_w
### Title: Degree centrality in a weighted network
### Aliases: degree_w

### ** Examples

## Load sample data
network <- rbind(
c(1,2,4),
c(1,3,2),
c(2,1,4),
c(2,3,4),
c(2,4,1),
c(2,5,2),
c(3,1,2),
c(3,2,4),
c(4,2,1),
c(5,2,2),
c(5,6,1),
c(6,5,1))

## Run the programme
degree_w(network)





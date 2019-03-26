library(tnet)


### Name: tnet_igraph
### Title: Exports a tnet network to an igraph object
### Aliases: tnet_igraph

### ** Examples

## Load sample data
sample <- rbind(
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
tnet_igraph(sample, type="weighted one-mode tnet")





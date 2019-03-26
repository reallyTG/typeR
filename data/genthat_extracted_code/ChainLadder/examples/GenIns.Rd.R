library(ChainLadder)


### Name: GenIns
### Title: Run off triangle of claims data.
### Aliases: GenIns GenInsLong
### Keywords: datasets

### ** Examples

GenIns
plot(GenIns)

plot(GenIns, lattice=TRUE)


head(GenInsLong)

## Convert long format into triangle
## Triangles are usually stored as 'long' tables in data bases
as.triangle(GenInsLong, origin="accyear", dev="devyear", "incurred claims")





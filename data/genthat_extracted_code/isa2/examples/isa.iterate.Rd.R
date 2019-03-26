library(isa2)


### Name: isa.iterate
### Title: The Iterative Signature Algorithm
### Aliases: isa.iterate isa.iterate,list-method
### Keywords: cluster

### ** Examples

## A basic ISA work flow for a single threshold combination
## In-silico data
set.seed(1)
insili <- isa.in.silico()

## Random seeds
seeds <- generate.seeds(length=nrow(insili[[1]]), count=100)

## Normalize input matrix
nm <- isa.normalize(insili[[1]])

## Do ISA
isares <- isa.iterate(nm, row.seeds=seeds, thr.row=2, thr.col=1)

## Eliminate duplicates
isares <- isa.unique(nm, isares)

## Filter out not robust ones
isares <- isa.filter.robust(insili[[1]], nm, isares)

## Print the sizes of the modules
cbind( colSums(isares$rows!=0), colSums(isares$columns!=0) )

## Plot the original data and the modules found
if (interactive()) {
  layout(rbind(1:2))
  image(insili[[1]], main="In silico data")
  image(outer(isares$rows[,1],isares$columns[,1])+
        outer(isares$rows[,2],isares$columns[,2])+
        outer(isares$rows[,3],isares$columns[,3]), main="ISA modules")
}




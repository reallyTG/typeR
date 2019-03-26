library(isa2)


### Name: ppa.iterate
### Title: The Ping-Pong Algorithm
### Aliases: ppa.iterate ppa.iterate,list-method
### Keywords: cluster

### ** Examples

## A basic PPA workflow with a single threshold combination
## In-silico data
set.seed(1)
insili <- ppa.in.silico()

## Random seeds
seeds <- generate.seeds(length=nrow(insili[[1]]), count=100)

## Normalize input matrices
nm <- ppa.normalize(insili[1:2])

## Do PPA
ppares <- ppa.iterate(nm, row1.seeds=seeds, thr.row1=1, direction="up")

## Eliminate duplicates
ppares <- ppa.unique(nm, ppares)

## Fitler out not robust ones
ppares <- ppa.filter.robust(insili[1:2], nm, ppares)

## Print the sizes of the co-modules
cbind(colSums(ppares$rows1 != 0), colSums(ppares$rows1 != 0),
      colSums(ppares$columns != 0))

## Plot the original data and the first three modules found
if (interactive()) {
  layout(rbind(1:2,3:4))
  image(insili[[1]], main="In silico data 1")
  image(outer(ppares$rows1[,1],ppares$columns[,1])+
        outer(ppares$rows1[,2],ppares$columns[,2])+
        outer(ppares$rows1[,3],ppares$columns[,3]), main="PPA co-modules 2")
  image(insili[[2]], main="In silico data 2")
  image(outer(ppares$rows2[,1],ppares$columns[,1])+
        outer(ppares$rows2[,2],ppares$columns[,2])+
        outer(ppares$rows2[,3],ppares$columns[,3]), main="PPA co-modules 2")
}





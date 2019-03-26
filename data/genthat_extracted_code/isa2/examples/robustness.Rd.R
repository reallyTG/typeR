library(isa2)


### Name: robustness
### Title: Robustness of ISA biclusters and PPA co-modules
### Aliases: robustness isa.filter.robust ppa.filter.robust
###   robustness,list-method isa.filter.robust,matrix-method
###   ppa.filter.robust,list-method
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

## Calculate robustness
rob <- robustness(nm, isares$rows, isares$columns)
rob

## There are three robust ones and a lot of less robust ones
## Plot the three robust ones and three others
if (interactive()) {
  toplot1 <- rev(order(rob))[1:3]
  toplot2 <- sample(seq_along(rob)[-toplot1], 3)
  layout( rbind(1:3,4:6) )
  for (i in c(toplot1, toplot2)) {
    image(outer(isares$rows[,i], isares$column[,i]),
          main=round(rob[i],2))
  }
}

## Filter out not robust ones
isares2 <- isa.filter.robust(insili[[1]], nm, isares)

## Probably there are only three of them left
ncol(isares2$rows)




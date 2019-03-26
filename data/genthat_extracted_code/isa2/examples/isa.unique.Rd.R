library(isa2)


### Name: isa.unique
### Title: Filter out biclusters that are very similar to each other
### Aliases: isa.unique isa.unique,list,list-method
### Keywords: cluster

### ** Examples

## Create an ISA module set
set.seed(1)
insili <- isa.in.silico(noise=0.01)

## Random seeds
seeds <- generate.seeds(length=nrow(insili[[1]]), count=20)

## Normalize input matrix
nm <- isa.normalize(insili[[1]])

## Do ISA
isares <- isa.iterate(nm, row.seeds=seeds, thr.row=2, thr.col=1)

## Check correlation among modules
cc <- cor(isares$rows)
if (interactive()) { hist(cc[lower.tri(cc)],10) }

## Some of them are quite high, how many?
undiag <- function(x) { diag(x) <- 0; x }
sum(undiag(cc) > 0.99, na.rm=TRUE)

## Eliminate duplicated modules
isares.unique <- isa.unique(nm, isares)

## How many modules left?
ncol(isares.unique$rows)

## Double check
cc2 <- cor(isares.unique$rows)
if (interactive()) { hist(cc2[lower.tri(cc2)],10) }

## High correlation?
sum(undiag(cc2) > 0.99, na.rm=TRUE)





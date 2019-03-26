library(isa2)


### Name: ppa.unique
### Title: Filter co-modules that are very similar to each other
### Aliases: ppa.unique ppa.unique,list,list-method
### Keywords: cluster

### ** Examples

## Create an PPA module set
set.seed(1)
insili <- ppa.in.silico(noise=0.01)

## Random seeds
seeds <- generate.seeds(length=nrow(insili[[1]]), count=20)

## Normalize input matrix
nm <- ppa.normalize(insili[1:2])

## Do PPA
ppares <- ppa.iterate(nm, row1.seeds=seeds,
                      thr.row1=2, thr.row2=2, thr.col=1)

## Check correlation among modules
cc <- cor(ppares$rows1)
if (interactive()) { hist(cc[lower.tri(cc)],10) }

## Some of them are quite high, how many?
undiag <- function(x) { diag(x) <- 0; x }
sum(undiag(cc) > 0.99, na.rm=TRUE)

## Eliminate duplicated modules
ppares.unique <- ppa.unique(nm, ppares)

## How many modules left?
ncol(ppares.unique$rows1)

## Double check
cc2 <- cor(ppares.unique$rows1)
if (interactive()) { hist(cc2[lower.tri(cc2)],10) }

## High correlation?
sum(undiag(cc2) > 0.99, na.rm=TRUE)





library(isa2)


### Name: generate.seeds
### Title: Generate seed vectors for the Iterative Signature Algorithm
### Aliases: generate.seeds
### Keywords: cluster

### ** Examples

## Just to get always the same result
set.seed(24)

## Create some random seeds with different sparseness
data <- isa.in.silico()
sparsity <- rep( c(1,5,25,125), length=100)
row.seeds <- generate.seeds(length=nrow(data[[1]]), count=100,
                            sparsity=sparsity)

## Do ISA with the seeds
normed.data <- isa.normalize(data[[1]])
isaresult <- isa.iterate(normed.data, thr.row=1, thr.col=1,
                         row.seeds=row.seeds)

## Add the sparsity to the seed data
isaresult$seeddata$sparsity <- sparsity

## Check which ones leed to higher robustness scores
rob <- robustness(normed.data, isaresult$rows, isaresult$columns)
tapply(rob, sparsity, mean)
## About the same

## How many unique modules did we find for the different sparsity
isaresult.unique <- isa.unique(normed.data, isaresult)
tapply(seq_len(ncol(isaresult.unique$rows)),
       isaresult.unique$seeddata$sparsity, length)
## We usually find more modules with sparser seeds




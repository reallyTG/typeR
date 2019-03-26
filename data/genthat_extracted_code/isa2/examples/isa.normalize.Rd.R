library(isa2)


### Name: isa.normalize
### Title: Normalize input data for use with ISA
### Aliases: isa.normalize isa.normalize,matrix-method
### Keywords: cluster

### ** Examples

## In-silico data
set.seed(1)
insili <- isa.in.silico()
nm <- isa.normalize(insili[[1]])

## Check it
max(abs(rowSums(nm[[1]])))
max(abs(rowSums(nm[[2]])))

max(abs(apply(t(nm[[1]]), 2, sd) - 1))
max(abs(apply(t(nm[[2]]), 2, sd) - 1))

## Plot them
if (interactive()) {
  layout(rbind(1:2,3:4))
  image(insili[[1]], main="Original data")
  image(t(nm[[1]]), main="Row normalized")
  image(nm[[2]], main="Column normalized")
}





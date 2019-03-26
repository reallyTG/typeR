library(isa2)


### Name: ppa.normalize
### Title: Normalize input data for use with the PPA
### Aliases: ppa.normalize ppa.normalize,list-method
### Keywords: cluster

### ** Examples

## In-silico data
set.seed(1)
insili <- ppa.in.silico()
nm <- ppa.normalize(insili[1:2])

## Check it
max(abs(rowSums(nm[[1]])))
max(abs(rowSums(nm[[2]])))
max(abs(rowSums(nm[[3]])))
max(abs(rowSums(nm[[4]])))

max(abs(rowSums(nm[[1]])))
max(abs(rowSums(nm[[2]])))
max(abs(rowSums(nm[[3]])))
max(abs(rowSums(nm[[4]])))

## Plot them
if (interactive()) {
  layout(rbind(1:3,4:6))
  image(insili[[1]], main="Original data 1")
  image(t(nm[[1]]), main="Row normalized 1")
  image(nm[[2]], main="Column normalized 1")

  image(insili[[2]], main="Original data 2")
  image(t(nm[[3]]), main="Row normalized 2")
  image(nm[[4]], main="Column normalized 2")
}





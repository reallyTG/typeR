library(TraMineR)


### Name: ex2
### Title: Example data sets with weighted and unweighted sequence data
### Aliases: ex2 ex2.weighted ex2.unweighted
### Keywords: Datasets

### ** Examples

data(ex2)

ex2w.seq <- seqdef(ex2.weighted, 1, weights=ex2.weighted$weight)
ex2u.seq <- seqdef(ex2.unweighted)




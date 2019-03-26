library(nos)


### Name: NOSM_undir
### Title: Compute NOS using an undirected network without a user provided
###   network of potential interactions
### Aliases: NOSM_undir

### ** Examples

data(boreal)
y <-  boreal[sample(rownames(boreal), 100, FALSE),] #subset 100 rows for speed
x <- NOSM_undir(y, perc = 1, sl = 1)
summary(x)




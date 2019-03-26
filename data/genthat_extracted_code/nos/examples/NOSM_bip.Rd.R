library(nos)


### Name: NOSM_bip
### Title: Compute NOS using a bipartite network
### Aliases: NOSM_bip

### ** Examples

data(boreal)
y <-  boreal[sample(rownames(boreal), 100, FALSE),] #subset 100 rows for speed
x <- NOSM_bip(y, perc = 1, sl = 1)
summary(x)




library(nos)


### Name: NOSM_dir
### Title: Compute NOS using a directed network without a user provided
###   network of potential interactions
### Aliases: NOSM_dir

### ** Examples

data(boreal)
y <-  boreal[sample(rownames(boreal), 100, FALSE),] #subset 100 rows for speed
x <- NOSM_dir(y, perc = 1, sl = 1)
summary(x)




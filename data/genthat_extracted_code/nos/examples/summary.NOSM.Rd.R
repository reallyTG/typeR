library(nos)


### Name: summary.NOSM
### Title: Summarising the results of the five main NOSM functions
### Aliases: summary.NOSM

### ** Examples

data(boreal)
z <- boreal[sample(rownames(boreal), 200, FALSE),] #subset for speed
x <- NOSM_bip(z, perc = 1, sl = 1)
summary(x, y = 3)




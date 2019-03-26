library(lsbclust)


### Name: meanbiplot
### Title: Biplots of
### Aliases: meanbiplot

### ** Examples

set.seed(1)
dat <- rlsbclust(ndata = 1, nobs = 100, size = c(10, 8), nclust = c(5, 4, 6, 5))
meanbiplot(dat[[1]]$interactions$C, dat[[1]]$interactions$D)




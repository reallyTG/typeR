library(spatstat)


### Name: varblock
### Title: Estimate Variance of Summary Statistic by Subdivision
### Aliases: varblock
### Keywords: nonparametric spatial

### ** Examples

   v <- varblock(amacrine, Kest, nx=4, ny=2)
   v <- varblock(amacrine, Kcross, nx=4, ny=2)
   if(interactive()) plot(v, iso ~ r, shade=c("hiiso", "loiso"))




library(prabclus)


### Name: toprab
### Title: Convert abundance matrix into presence/absence matrix
### Aliases: toprab
### Keywords: manip

### ** Examples

  data(siskiyou)
  x <- prabinit(prabmatrix=siskiyou, neighborhood=siskiyou.nb,
             distance="none")
  toprab(x)




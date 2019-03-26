library(IsoGene)


### Name: IsoGene1
### Title: The five test statistics calculated for both the increasing and
###   decreasing trends
### Aliases: IsoGene1
### Keywords: htest

### ** Examples

  x <- c(rep(1,3),rep(2,3),rep(3,3),rep(4,3))
  y <- c(rnorm(3,1,1),rnorm(3,2,1),rnorm(3,3,1),rnorm(3,4,1))
  stat <- IsoGene1(x,y)
  stat




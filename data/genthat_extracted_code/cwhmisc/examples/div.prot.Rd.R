library(cwhmisc)


### Name: div.prot
### Title: Protected division
### Aliases: div.prot
### Keywords: algebra

### ** Examples

  de <- .Machine$double.eps
  v<-c(0,de/c(1,2,4,8))
  div.prot(1,v)
 #  1.55252e+231  4.50360e+15  9.00720e+15  1.80144e+16  3.60288e+16




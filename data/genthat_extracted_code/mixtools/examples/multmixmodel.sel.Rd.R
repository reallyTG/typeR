library(mixtools)


### Name: multmixmodel.sel
### Title: Model Selection Mixtures of Multinomials
### Aliases: multmixmodel.sel
### Keywords: file

### ** Examples

##Data generated using the multinomial cutpoint method.

set.seed(100)
x <- matrix(rpois(70, 6), 10, 7) 
x.new <- makemultdata(x, cuts = 5)
multmixmodel.sel(x.new$y, comps = c(1,2), epsilon = 1e-03)





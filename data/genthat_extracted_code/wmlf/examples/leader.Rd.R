library(wmlf)


### Name: leader
### Title: Calculating the wavelet leaders decomposition of a square matrix
### Aliases: leader Leader-class wmlf-package $,Leader-method
###   [,Leader-method
### Keywords: ~kwd1 ~kwd2

### ** Examples

library(wmlf)
data(bocage)
l_b=leader(bocage,full=FALSE)
plotfit(l_b) 

l_b=leader(bocage,frac=1,full=TRUE)
plotfit(l_b)
fit(l_b,2:5)





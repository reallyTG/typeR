library(BinOrdNonNor)


### Name: valid.limits.BinOrdNN
### Title: Computes the lower and upper bounds of correlation in the form
###   of two matrices
### Aliases: valid.limits.BinOrdNN

### ** Examples

marginal <- list(0.2, c(0.4, 0.7, 0.9))
valid.limits.BinOrdNN(plist=marginal, skew.vec=c(1,2), kurto.vec=c(2,7), 
                      no.bin=1, no.ord=1, no.NN=2)




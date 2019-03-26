library(epoc)


### Name: synth
### Title: Blinded cancer mRNA, CNA and survival data
### Aliases: synth
### Keywords: datasets cancer epoc

### ** Examples

## Not run: 
##D   
##D   data(synth)
##D   y <- synth$y
##D   # standardize u
##D   u <- apply(synth$u, 2, function(x) x/sd(x))
##D   G <- epocG(Y=y, U=u)
##D   summary(G)
##D   plot(G)
## End(Not run)




library(spacodiR)


### Name: resamp.3t
### Title: randomizing a community phylogenetics matrix: '3t' of Hardy
###   (2008)
### Aliases: resamp.3t

### ** Examples

# define a community dataset
data(sp.example)
attach(sp.example)
spl

# define a distance matrix
foo <- matrix(runif((ncol(spl)->ss)^2,0,100),ss,ss)
foo[upper.tri(foo)] <- foo[lower.tri(foo)]
diag(foo) <- 0
dmat <- as.data.frame(foo)
row.names(dmat) <- names(spl)
names(dmat) <- row.names(dmat)


# shuffle dataset
resamp.3t(obj=spl, dmat=dmat) 
spl ## comparison with original




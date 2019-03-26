library(blink)


### Name: rl.gibbs
### Title: Gibbs sampler for empirically motivated Bayesian record linkage
### Aliases: rl.gibbs

### ** Examples

data(RLdata500)
X.c <- as.matrix(RLdata500[c("by","bm","bd")])[1:3,]
p.c <- ncol(X.c)
X.s <- as.matrix(RLdata500[c(1,3)])[1:3,]
p.s <- ncol(X.s)
file.num <- rep(c(1,1,1),c(1,1,1))
d <- function(string1,string2){adist(string1,string2)}
lam.gs <- rl.gibbs(file.num,X.s,X.c,num.gs=2,a=.01,b=100,c=1,d, M=3)




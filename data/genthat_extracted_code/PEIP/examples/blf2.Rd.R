library(PEIP)


### Name: blf2
### Title: Bounded least squares
### Aliases: blf2
### Keywords: misc

### ** Examples


###  set up an inverse problem:Shaw problem

n = 20
G = shawG(n,n)

spike = rep(0,n)
spike[10] = 1

spiken = G %*%  spike

wts = rep(1, n)
delta = 1e-03
set.seed(2015)
dspiken = spiken + 6e-6 *rnorm(length(spiken))

lb = spike - (.2) * wts
ub = spike + (.2) * wts

dspiken = dspiken

 blf2(G, dspiken, wts , delta, lb, ub)






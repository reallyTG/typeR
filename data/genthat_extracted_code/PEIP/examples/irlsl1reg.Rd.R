library(PEIP)


### Name: irlsl1reg
### Title: L1 least squares with sparsity
### Aliases: irlsl1reg
### Keywords: misc

### ** Examples



n = 20
G = shawG(n,n)

spike = rep(0,n)
spike[10] = 1

spiken = G %*%  spike

wts = rep(1, n)
delta = 1e-03
set.seed(2015)
dspiken = spiken + 6e-6 *rnorm(length(spiken))
L1 = get_l_rough(n,1);
alpha = 0.001

k = irlsl1reg(G, dspiken, L1, alpha, maxiter = 100, tolx = 1e-04, tolr = 1e-06)


plotconst(k,-pi/2,pi/2, ylim=c(-.2,  0.5), xlab="theta", ylab="Intensity" );






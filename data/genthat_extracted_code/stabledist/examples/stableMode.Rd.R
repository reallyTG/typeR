library(stabledist)


### Name: StableMode
### Title: Mode of the Stable Distribution Function
### Aliases: stableMode
### Keywords: distribution

### ** Examples

## beta = 0  <==>  symmetric  <==>  mode = 0
all.equal(stableMode(alpha=1, beta=0), 0)
al.s <- c(1e-100, seq(0,2, by = 1/32)[-1])
stopifnot(vapply(al.s, function(alp)
                 stableMode(alpha=alp, beta=0), 1.) == 0)

## more interesting: asymmetric (beta != 0):
stableMode(alpha=1.2, beta=0.1)

if(stabledist:::doExtras()) { # takes 2.5 seconds
 sm0.5 <- vapply(al.s, function(AA)
                 stableMode(alpha=AA, beta= 0.5), 1.)
 plot(al.s, sm0.5, type = "o", col=2, xlab = quote(alpha), ylab="mode",
      main = quote("Mode of stable"*{}(alpha, beta == 0.5, pm==0)))
}




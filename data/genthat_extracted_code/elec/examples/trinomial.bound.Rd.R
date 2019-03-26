library(elec)


### Name: trinomial.bound
### Title: Auditing with the Trinomial Bound: trinomial.bound and
###   trinomial.audit
### Aliases: trinomial.bound trinomial.audit

### ** Examples


## Auditing Santa Cruz
data(santa.cruz.audit)
data(santa.cruz)
Z = elec.data(santa.cruz, C.names=c("leopold","danner"))
res = trinomial.audit( Z, santa.cruz.audit )
res
plan = tri.calc.sample( Z, beta=0.75, guess.N = 10, p_d = 0.05,
               swing=10, power=0.9, bound="e.plus" )

## Compute the bound.  Everything is scaled by 100 (i.e. to percents) for easier numbers. 
trinomial.bound(n=res$n, k = res$k, d=100*plan$d, e.max=100, p.value.bound=100/plan$T,
           xlim=c(0.75,1), ylim=c(0.0,0.25),
           alpha.lvls=c(25), asp=1,
           main="Auditing Santa Cruz with Trinomial Bound" )





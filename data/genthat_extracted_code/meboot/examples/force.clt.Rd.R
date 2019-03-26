library(meboot)


### Name: force.clt
### Title: Enforce Central Limit Theorem
### Aliases: force.clt
### Keywords: ts

### ** Examples

    set.seed(345)
    out <- meboot(x=AirPassengers, reps=100, trim=0.10, reachbnd=FALSE, elaps=TRUE)
    cm1 <- colMeans(out$ensemb)
    # Note that the column means are somewhat non-normal
    qqnorm(cm1)

    clt.ens <- force.clt(x=AirPassengers, ensemble=out$ensemble) 
    cm2 <- colMeans(clt.ens)
    # Note that the columns are closer to being normal
    qqnorm(cm2)

  



library(rich)


### Name: c2m
### Title: Compares 2 mean values using a randomization test
### Aliases: c2m

### ** Examples


## Not run: 
##D # The example of mandible length of male and female 
##D # golden jackals from Manly (1997), p.4.
##D males<-c(120, 107, 110, 116, 114, 111, 113, 117, 114, 112)
##D females<-c(110, 111, 107, 108, 110, 105, 107, 106, 111, 111)
##D out <- c2m(pop1=males, pop2=females, nrandom=99)
##D out$res
##D hist(out$rand)
##D abline(v=out$res[3,1], col="red")
##D abline(v=out$res[5,1], col="blue")
##D abline(v=out$res[6,1], col="blue")
##D 
##D # Compare simulated datasets
##D pop1<-rnorm(10)
##D pop2<-rnorm(10)
##D out <- c2m(pop1=pop1, pop2=pop2, nrandom=99)
##D out$res
##D hist(out$rand)
##D abline(v=out$res[3,1], col="red")
##D abline(v=out$res[5,1], col="blue")
##D abline(v=out$res[6,1], col="blue")
##D 
##D 
##D # Maximum temperature in a set of sites where the bark beetle Tomicus destruens
##D # or T. piniperda are present. Both species are present at 4 sites.
##D data(Tomicus)
##D out <- c2m(pop1=Tomicus$destruens,pop2=Tomicus$piniperda, 
##D pop3=Tomicus$both, nrandom=99)
##D out$res
##D hist(out$rand)
##D abline(v=out$res[3,1], col="red")
##D abline(v=out$res[5,1], col="blue")
##D abline(v=out$res[6,1], col="blue")
##D 
##D # using c2m with outputs of rich
##D data(ef)
##D o1 <- rich(matrix=ef, nrandom=99, verbose=TRUE)
##D data(ea)
##D o2 <- rich(matrix=ea, nrandom=99, verbose=TRUE)
##D out <- c2m(pop1=o1$sumrow, pop2=o2$sumrow, nrandom=999, verbose=TRUE)
##D hist(out$rand)
##D abline(v=out$res[3,1], col="red")
##D abline(v=out$res[5,1], col="blue")
##D abline(v=out$res[6,1], col="blue")
## End(Not run)



library(rmetasim)


### Name: landscape.sample
### Title: simulates sampling for genetics on the landscape
### Aliases: landscape.sample
### Keywords: misc

### ** Examples

	l <- landscape.new.example()
	l <- landscape.simulate(l,1)
	l.samp <- landscape.sample(l,np=1,ns=24)
	landscape.amova.pairwise(l.samp)
        l.samp2 <- landscape.sample(l,ns=24,pvec=c(2))
	landscape.amova.pairwise(l.samp2) 




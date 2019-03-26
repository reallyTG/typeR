library(multiDimBio)


### Name: h2Estimate
### Title: Estimates the heritability of a binomial trait
### Aliases: h2Estimate

### ** Examples

	ndads <- 18
	mm <- 4
	vv <-  6
	tau2 <- 1.5
	nbins <- 3
	
	mylogit <- function(x) log(x/{1-x})
	ilogit <- function(x) 1/{1+exp(-x)}
	
	swimprob <- ilogit(rnorm(ndads, 0, sqrt(tau2)))
	mytable <- NULL
	for(i in 1:ndads) {
		bincounts <- pmax(1,rnbinom(nbins, mu = mm, size = mm^2/{vv-mm}))
		swim <- rbinom(3, bincounts,swimprob[i])
		set <- bincounts - swim
		theserows <- data.frame(set=set,swim=swim, Dad = i, Bin = 1:nbins)
		mytable <- rbind(mytable, theserows)
	}
	
	est <- h2Estimate(mytable,nreps=10)
	
	print(est$h2)




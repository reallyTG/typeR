library(EpiBayes)


### Name: EpiBayes_ns
### Title: Disease Model without Storage
### Aliases: EpiBayes_ns

### ** Examples

testrun_nostorage = EpiBayes_ns(
		H = 2,
		k = rep(30, 2),
		n = rep(rep(150, 30), 2),
		seasons = rep(c(1, 2, 3, 4), each = 15),
		reps = 10,
		MCMCreps = 10,
		poi = "tau",
		y = NULL,
		mumodes = matrix(c(
			0.50, 0.70,
			0.50, 0.70,
			0.02, 0.50,
			0.02, 0.50
			), 4, 2, byrow = TRUE
		),
		pi.thresh = 0.05,
	    tau.thresh = 0.02,
     gam.thresh = 0.10,
		tau.T = 0,
		poi.lb = 0,
		poi.ub = 1,
		p1 = 0.95,
		psi = 4,
		omegaparm = c(100, 1),
		gamparm = c(100, 1),
		tauparm = c(1, 1),
		etaparm = c(100, 6),
		thetaparm = c(100, 6),
		burnin = 1
		)

testrun_nostorage
print(testrun_nostorage)
testrun_nostoragesummary = summary(testrun_nostorage, prob = 0.90, n.output = 5)
testrun_nostoragesummary
plot(testrun_nostorage$taumat[1, 1, ], type = "l")
plot(testrun_nostorage$gammat[1, ], type = "l")

## Can't look at any other posterior distributions other than gam and tau
## Not run: 
##D     plot(testrun_nostorage$pimat[1, 1, ], type = "l")
##D 	   plot(testrun_nostorage$omegamat[1, ], type = "l")
## End(Not run)




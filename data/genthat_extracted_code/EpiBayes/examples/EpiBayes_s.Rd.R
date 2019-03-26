library(EpiBayes)


### Name: EpiBayes_s
### Title: Disease Model with Storage
### Aliases: EpiBayes_s

### ** Examples

testrun_storage = EpiBayes_s(
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

testrun_storage
print(testrun_storage)
testrun_storagesummary = summary(testrun_storage, prob = 0.90, n.output = 5)
testrun_storagesummary
plot(testrun_storage$taumat[1, 1, ], type = "l")
plot(testrun_storage$gammat[1, ], type = "l")

## Can look at all posterior distributions
    plot(testrun_storage$pimat[1, 1, ], type = "l")
    plot(testrun_storage$omegamat[1, ], type = "l")




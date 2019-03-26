library(EpiBayes)


### Name: EpiBayesSampleSize
### Title: Sample Size Search for EpiBayes Models
### Aliases: EpiBayesSampleSize

### ** Examples

testrun_samplesize = EpiBayesSampleSize(
		H = c(2, 4),
		k = c(10, 20),
		n = c(100, 500),
		season = 3,
		burnin = 1,
		reps = 1,
		MCMCreps = 10,
		tau.T = 0,
		poi = "tau",
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
		poi.lb = 0.1,
		poi.ub = 0.4,
		p1 = 0.95,
		psi = 4,
		tauparm = c(1, 1),
		omegaparm = c(1000, 1),
		gamparm = c(1000, 1),
		etaparm = c(100, 6),
		thetaparm = c(100, 6)
		)

testrun_samplesize
print(testrun_samplesize, out.ptilde = "p4.tilde")




library(EpiBayes)


### Name: EpiBayesHistorical
### Title: Historical Aggregation for Disease Model
### Aliases: EpiBayesHistorical

### ** Examples

## Construct input data frame with columns Year, Subzone, Cluster size, Season, and Number positives
year = rep(c("Period 1", "Period 2", "Period 3"), c(60, 60, 60))
subz = rep(rep(c("Subzone 1", "Subzone 2"), c(25, 35)), 3)
size = rep(100, 3 * 60)
season = rep(rep(c(1,2), each = 30), 3)
y = matrix(c(
    rep(10, 15), rep(0, 10),  # Period 1: Subzone 1
    rep(0, 35),  # Period 1: Subzone 2
    rep(10, 15), rep(0, 10),  # Period 2: Subzone 1
    rep(10, 10), rep(0, 25),  # Period 2: Subzone 2
    rep(25, 25), # Period 3: Subzone 1
    rep(25, 10), rep(0, 25)  # Period 3: Subzone 2
    ),
    ncol = 1
)

testrun_historical_inputdf = data.frame(year, subz, size, season, y)

testrun_historical = EpiBayesHistorical(
		input.df = testrun_historical_inputdf,
		orig.tauparm = c(1, 1),
		burnin = 1,
		MCMCreps = 5,
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
		tau.T = 0,
		poi.lb = 0,
		poi.ub = 1,
		p1 = 0.95,
		psi = 4,
		omegaparm = c(1, 1),
		gamparm = c(1, 1),
		etaparm = c(10, 1),
		thetaparm = c(10, 1)
		)

testrun_historical
plot(testrun_historical)
testrun_historicalsummary = summary(testrun_historical, sumstat = "quantile",
    prob = 0.99, time.labels = c("Period 1", "Period 2", "Period 3"))
testrun_historicalsummary
plot(testrun_historicalsummary)




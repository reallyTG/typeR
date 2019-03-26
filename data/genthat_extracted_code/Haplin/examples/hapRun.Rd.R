library(Haplin)


### Name: hapRun
### Title: Simulates genetic data and runs Haplin for each simulation
### Aliases: hapRun

### ** Examples

## Not run: 
##D ## Simulate Haplin results from 100 files using the multiplicative model in haplin. 
##D ## The files consist of fetal effects at two diallelic markers,
##D ## corresponding to haplo.freq = rep(0.25, 4), RR = c(2,1,1,1) 
##D ## and RRstar = c(1,1,1,1). That is, the first allele has a doubled risk 
##D ## relative to the rest. The data consists of a combination of 
##D ## 100 case triads and 100 control triads with no missing data.
##D ## No environmental factors are considered, i.e. the number of strata is one.
##D hapRun(nall = c(2,2), n.strata = 1, cases = c(mfc=100), controls = c(mfc=100),
##D haplo.freq = rep(0.25,4), RR = c(2,1,1,1), RRstar = c(1,1,1,1), 
##D hapfunc = "haplin", response = "mult", n.sim = 100, dire = "simfiles", ask = FALSE)
##D 
##D ## Simulate power from 100 files applying haplinStrat. 
##D ## The files consist of fetal and maternal effects at two diallelic markers.
##D ## The data is simulated for 500 case triads and 200 control families in the first stratum,
##D ## and 500 case triads and 500 control trids in the second.
##D ## The fetal effects vary across strata,
##D ## whereas the maternal effects are the same.
##D ## One percent of the case triads are missing at random in the second stratum.
##D hapRun(nall = c(2,2), n.strata = 2, cases = c(mfc=500),
##D controls = list(c(mfc=200),c(mfc=500)), haplo.freq = rep(0.25,4), maternal = TRUE, 
##D RR = list(c(1.5,1,1,1),c(1,1,1,1)), RRstar = c(1,1,1,1),
##D RR.mat = c(1.5,1,1,1), RRstar.mat = c(1,1,1,1), 
##D gen.missing.cases = list(NULL,0.01), use.missing = TRUE, hapfunc = "haplinStrat", 
##D n.sim = 100, ask = FALSE)
##D 
##D ## Simulate Haplin results from 100 files using haplin. 
##D ## The files consist of fetal effects at one diallelic locus, 
##D ## corresponding to haplo.freq = rep(0.5,2), RR = c(1.5,1) and RRstar = c(1,1).
##D ## We have a combination of 100 case triads and 
##D ## 100 control triads with no missing data. 
##D ## No environmental effects are considered.
##D hapRun(nall = c(2), n.strata = 2, cases = c(mfc=100), controls = c(mfc=100),
##D haplo.freq = rep(0.5,2), RR = c(1.5,1), RRstar = c(1,1),
##D hapfunc = "haplinStrat", n.sim = 100, dire = "simfiles", ask = FALSE)
## End(Not run)




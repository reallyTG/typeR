library(Haplin)


### Name: hapPower
### Title: Power simulation for association analyses with Haplin
### Aliases: hapPower

### ** Examples

## Not run: 
##D ## Simulate power from 100 files using haplin. 
##D ## The files consist of fetal effects at two diallelic markers,
##D ## corresponding to haplo.freq = rep(0.25, 4), RR = c(2,1,1,1) and RRstar = c(1,1,1,1).
##D ## The power is simulated for the combination of 100 case triads 
##D ## and 100 control triads with no missing data at a 0.05 significance level,
##D ## applying a multiplicative model.
##D hapRun.res <- hapRun(nall = c(2,2), n.strata = 1, cases = c(mfc=100), controls = c(mfc=100),
##D haplo.freq = rep(0.25,4), RR = c(2,1,1,1), RRstar = c(1,1,1,1), 
##D hapfunc = "haplin", response = "mult", n.sim = 100, dire = "simfiles", ask = FALSE)
##D hapPower(hapRun.res)
##D 
##D ## Simulate power from 100 files applying haplinStrat. 
##D ## The files consist of fetal and maternal effects at two diallelic markers.
##D ## The data is simulated for 500 case triads and 200 control families in the first stratum,
##D ## and 500 case triads and 500 control trids in the second.
##D ## The fetal effects vary across strata,
##D ## whereas the maternal effects are the same.
##D ## One percent of the case triads are missing at random in the second stratum.
##D hapRun.res <- hapRun(nall = c(2,2), n.strata = 2, cases = c(mfc=500),
##D controls = list(c(mfc=200),c(mfc=500)), haplo.freq = rep(0.25,4), maternal = TRUE, 
##D RR = list(c(1.5,1,1,1),c(1,1,1,1)), RRstar = c(1,1,1,1),
##D RR.mat = c(1.5,1,1,1), RRstar.mat = c(1,1,1,1), gen.missing.cases = list(NULL,0.01), 
##D use.missing = TRUE, hapfunc = "haplinStrat", n.sim = 100, ask = FALSE)
##D hapPower(hapRun.res)
##D 
##D ## Simulate power at the 10##D 
##D ## The files consist of fetal effects at one diallelic locus,
##D ## corresponding to haplo.freq = c(0.1,0.9), RR = c(1.5,1) and RRstar = c(1,1).
##D ## The data consists of a combination of 100 case triads and 100 control triads.
##D hapRun.res <- hapRun(nall = c(2), cases = c(mfc=100), controls = c(mfc=100),
##D haplo.freq = c(0.1,0.9), RR = c(2,1), RRstar = c(1,1),
##D hapfunc = "haplin", response = "mult", n.sim = 1000, ask = FALSE)
##D hapPower(hapRun.res, alpha= 0.10)
##D 
##D ## The latter example, applying response = "mult", should be comparable to 
##D ## the theoretic calculations of snpPower.
##D snpPower(cases = list(mfc=100), controls = list(mfc=100),
##D RR = 2, MAF = 0.1, alpha = 0.10)
## End(Not run)




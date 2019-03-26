library(Haplin)


### Name: hapSim
### Title: Simulation of genetic data in Haplin format
### Aliases: hapSim

### ** Examples

## Not run: 
##D ## Simulate genetic data (100 files) at two diallelic markers, consisting of fetal effects 
##D ## corresponding to haplo.freq = rep(0.25, 4), RR = c(2,1,1,1) and RRstar = c(1,1,1,1),
##D ## for the combination of 1000 case triads and 1000 control triads with no missing data.
##D ## Only one stratum.
##D hapSim(nall = c(2,2), n.strata = 1, cases = c(mfc=1000),
##D controls = c(mfc=1000), haplo.freq = rep(0.25,4),
##D RR = c(2,1,1,1), RRstar = c(1,1,1,1), n.sim = 100, dire = "simfiles")
##D 
##D ## Simulate genetic data (100 files) at two diallelic markers,
##D ## consisting of fetal and maternal effects corresponding to 
##D ## haplo.freq = rep(0.25, 4), RR = c(2,1,1,1), RRstar = c(1,1,1,1),
##D ## RR.mat = c(2,1,1,1) and RRstar.mat = c(1,1,1,1),
##D ## for 1000 case triads and zero control families. 
##D ## One percent of the case triads are missing at random. One stratum only.
##D hapSim(nall = c(2,2), n.strata=1, cases = c(mfc=1000),
##D controls = c(mfc=0), haplo.freq = rep(0.25,4), RR = c(2,1,1,1),
##D RRstar = c(1,1,1,1), RR.mat = c(2,1,1,1), RRstar.mat = c(1,1,1,1), 
##D gen.missing.cases = 0.01, n.sim = 100, dire = "simfiles")
##D 
##D ## Simulate genetic data (100 files) at two diallelic markers. In the first stratum, 
##D ## we have a combination of 500 case triads and 500 control triads with
##D ## haplo.freq = rep(0.25, 4), RR = c(2,1,1,1) and RRstar = c(1,1,1,1).
##D ## In the second stratum, we have 300 case triads and 500 control triads with
##D ## haplo.freq = rep(0.25, 4), RR = c(1,1,1,1) and RRstar = c(1,1,1,1).
##D ## One percent of the control triads are missing at random in the first stratum.
##D hapSim(nall = c(2,2), n.strata= 2, cases = list(c(mfc=500),c(mfc=300)), 
##D controls = c(mfc=500),haplo.freq = rep(0.25,4),
##D RR = list(c(2,1,1,1),c(1,1,1,1)), RRstar = c(1,1,1,1),
##D gen.missing.controls = list(0.01,NULL), n.sim = 100, dire = "simfiles")
## End(Not run)




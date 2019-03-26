library(simPH)


### Name: coxsimtvc
### Title: Simulate time-interactive quantities of interest from Cox
###   Proportional Hazards models
### Aliases: coxsimtvc

### ** Examples

## Not run: 
##D # Load Golub & Steunenberg (2007) Data
##D data("GolubEUPData")
##D 
##D # Load survival package
##D library(survival)
##D 
##D # Expand data (not run to speed processing time, but should be run)
##D GolubEUPData <- SurvExpand(GolubEUPData, GroupVar = 'caseno',
##D                      Time = 'begin', Time2 = 'end', event = 'event')
##D 
##D # Create time interactions
##D BaseVars <- c('qmv', 'backlog', 'coop', 'codec', 'qmvpostsea', 'thatcher')
##D GolubEUPData <- tvc(GolubEUPData, b = BaseVars, tvar = 'end', tfun = 'log')
##D 
##D # Run Cox PH Model
##D M1 <- coxph(Surv(begin, end, event) ~ qmv + qmvpostsea + qmvpostteu +
##D                 coop + codec + eu9 + eu10 + eu12 + eu15 + thatcher +
##D                 agenda + backlog + qmv_log + qmvpostsea_log + coop_log +
##D                 codec_log + thatcher_log + backlog_log,
##D             data = GolubEUPData, ties = "efron")
##D 
##D # Create simtvc object for Relative Hazard
##D Sim1 <- coxsimtvc(obj = M1, b = "qmv", btvc = "qmv_log",
##D                    tfun = "log", from = 80, to = 2000,
##D                    Xj = 1, by = 15, ci = 0.99, nsim = 100)
##D 
##D # Create simtvc object for First Difference
##D Sim2 <- coxsimtvc(obj = M1, b = "qmv", btvc = "qmv_log",
##D                  qi = "First Difference", Xj = 1,
##D                  tfun = "log", from = 80, to = 2000,
##D                  by = 15, ci = 0.95)
##D 
##D # Create simtvc object for Hazard Ratio
##D Sim3 <- coxsimtvc(obj = M1, b = "backlog", btvc = "backlog_log",
##D                   qi = "Hazard Ratio", Xj = c(191, 229),
##D                   Xl = c(0, 0),
##D                   tfun = "log", from = 80, to = 2000,
##D                   by = 15, ci = 0.5)
## End(Not run)





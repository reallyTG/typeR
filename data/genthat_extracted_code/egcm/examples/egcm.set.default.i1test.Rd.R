library(egcm)


### Name: egcm.defaults
### Title: Set and get defaults for Engle-Granger cointegration models
### Aliases: egcm.set.default.i1test egcm.set.default.urtest
###   egcm.set.default.pvalue egcm.default.i1test egcm.default.urtest
###   egcm.default.pvalue egcm.i1tests egcm.urtests

### ** Examples

# Get and set the current default I(1) test
egcm.default.i1test()
egcm.set.default.i1test("adf")

# Get and set the current default unit root test
egcm.default.urtest()
egcm.set.default.urtest("pp")

# Get and set the current default p-value
egcm.default.pvalue()
egcm.set.default.pvalue(0.01)




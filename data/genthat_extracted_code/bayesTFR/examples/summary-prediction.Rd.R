library(bayesTFR)


### Name: summary.bayesTFR.prediction
### Title: Summary of a Prediction of the Total Fertility Rate
### Aliases: summary.bayesTFR.prediction print.summary.bayesTFR.prediction
### Keywords: univar print

### ** Examples

## Not run: 
##D sim.dir <- file.path(find.package("bayesTFR"), "ex-data", "bayesTFR.output")
##D pred <- tfr.predict(sim.dir=sim.dir, 
##D                     output.dir=file.path(getwd(), "exampleTFRpred"), 
##D                     use.tfr3=FALSE, burnin=15, verbose=TRUE)
##D # If the above function was run previously, do
##D # pred <- get.tfr.prediction(sim.dir=file.path(getwd(), "exampleTFRpred"))
##D                                                         
##D summary(pred, country="Ireland")
## End(Not run)




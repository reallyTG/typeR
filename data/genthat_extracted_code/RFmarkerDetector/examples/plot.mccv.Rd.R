library(RFmarkerDetector)


### Name: plot.mccv
### Title: Plotting single or multiple ROC curves of the cross-validated
###   Random Forest models 'plot.mccv' allows to plot single or multiple
###   ROC curves to characterize the performace of a cross-validated Random
###   Forest model
### Aliases: plot.mccv

### ** Examples

## data(cachexiaData)
## params <- list(ntrees = 500, ref_level = levels(cachexiaData[,2])[1] )
## mccv_obj <- rfMCCV(cachexiaData, nsplits = 50, test_prop = 1/3, opt_params = params)
## params = list(avg = 'vertical', colorize = FALSE) 
## plot.mccv(mccv_obj, opt = params)




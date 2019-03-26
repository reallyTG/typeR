library(precrec)


### Name: part
### Title: Calculate partial AUCs
### Aliases: part part.sscurves part.mscurves part.smcurves part.mmcurves

### ** Examples

## Not run: 
##D 
##D ## Load library
##D library(ggplot2)
##D 
##D ##################################################
##D ### Single model & single test dataset
##D ###
##D 
##D ## Load a dataset with 10 positives and 10 negatives
##D data(P10N10)
##D 
##D ## Generate an sscurve object that contains ROC and Precision-Recall curves
##D sscurves <- evalmod(scores = P10N10$scores, labels = P10N10$labels)
##D 
##D ## Calculate partial AUCs
##D sscurves.part <- part(sscurves, xlim = c(0.25, 0.75))
##D 
##D ## Show AUCs
##D sscurves.part
##D 
##D ## Plot partial curve
##D plot(sscurves.part)
##D 
##D ## Plot partial curve with ggplot
##D autoplot(sscurves.part)
##D 
##D 
##D ##################################################
##D ### Multiple models & single test dataset
##D ###
##D 
##D ## Create sample datasets with 100 positives and 100 negatives
##D samps <- create_sim_samples(1, 100, 100, "all")
##D mdat <- mmdata(samps[["scores"]], samps[["labels"]],
##D                modnames = samps[["modnames"]])
##D 
##D ## Generate an mscurve object that contains ROC and Precision-Recall curves
##D mscurves <- evalmod(mdat)
##D 
##D ## Calculate partial AUCs
##D mscurves.part <- part(mscurves, xlim = c(0, 0.75), ylim = c(0.25, 0.75))
##D 
##D ## Show AUCs
##D mscurves.part
##D 
##D ## Plot partial curves
##D plot(mscurves.part)
##D 
##D ## Plot partial curves with ggplot
##D autoplot(mscurves.part)
##D 
##D 
##D ##################################################
##D ### Single model & multiple test datasets
##D ###
##D 
##D ## Create sample datasets with 100 positives and 100 negatives
##D samps <- create_sim_samples(4, 100, 100, "good_er")
##D mdat <- mmdata(samps[["scores"]], samps[["labels"]],
##D                modnames = samps[["modnames"]],
##D                dsids = samps[["dsids"]])
##D 
##D ## Generate an smcurve object that contains ROC and Precision-Recall curves
##D smcurves <- evalmod(mdat)
##D 
##D ## Calculate partial AUCs
##D smcurves.part <- part(smcurves, xlim = c(0.25, 0.75))
##D 
##D ## Show AUCs
##D smcurves.part
##D 
##D ## Plot partial curve
##D plot(smcurves.part)
##D 
##D ## Plot partial curve with ggplot
##D autoplot(smcurves.part)
##D 
##D 
##D ##################################################
##D ### Multiple models & multiple test datasets
##D ###
##D 
##D ## Create sample datasets with 100 positives and 100 negatives
##D samps <- create_sim_samples(4, 100, 100, "all")
##D mdat <- mmdata(samps[["scores"]], samps[["labels"]],
##D                modnames = samps[["modnames"]],
##D                dsids = samps[["dsids"]])
##D 
##D ## Generate an mscurve object that contains ROC and Precision-Recall curves
##D mmcurves <- evalmod(mdat, raw_curves = TRUE)
##D 
##D ## Calculate partial AUCs
##D mmcurves.part <- part(mmcurves, xlim = c(0, 0.25))
##D 
##D ## Show AUCs
##D mmcurves.part
##D 
##D ## Plot partial curves
##D plot(mmcurves.part)
##D 
##D ## Plot partial curves with ggplot
##D autoplot(mmcurves.part)
## End(Not run)





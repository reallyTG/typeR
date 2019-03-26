library(precrec)


### Name: plot
### Title: Plot performance evaluation measures
### Aliases: plot plot.sscurves plot.mscurves plot.smcurves plot.mmcurves
###   plot.sspoints plot.mspoints plot.smpoints plot.mmpoints

### ** Examples


## Not run: 
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
##D ## Plot both ROC and Precision-Recall curves
##D plot(sscurves)
##D 
##D ## Plot a ROC curve
##D plot(sscurves, curvetype = "ROC")
##D 
##D ## Plot a Precision-Recall curve
##D plot(sscurves, curvetype = "PRC")
##D 
##D ## Generate an sspoints object that contains basic evaluation measures
##D sspoints <- evalmod(mode = "basic", scores = P10N10$scores,
##D                     labels = P10N10$labels)
##D 
##D ## Plot normalized ranks vs. basic evaluation measures
##D plot(sspoints)
##D 
##D ## Plot normalized ranks vs. precision
##D plot(sspoints, curvetype = "precision")
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
##D ## Plot both ROC and Precision-Recall curves
##D plot(mscurves)
##D 
##D ## Hide the legend
##D plot(mscurves, show_legend = FALSE)
##D 
##D ## Generate an mspoints object that contains basic evaluation measures
##D mspoints <- evalmod(mdat, mode = "basic")
##D 
##D ## Plot normalized ranks vs. basic evaluation measures
##D plot(mspoints)
##D 
##D ## Hide the legend
##D plot(mspoints, show_legend = FALSE)
##D 
##D 
##D ##################################################
##D ### Single model & multiple test datasets
##D ###
##D 
##D ## Create sample datasets with 100 positives and 100 negatives
##D samps <- create_sim_samples(10, 100, 100, "good_er")
##D mdat <- mmdata(samps[["scores"]], samps[["labels"]],
##D                modnames = samps[["modnames"]],
##D                dsids = samps[["dsids"]])
##D 
##D ## Generate an smcurve object that contains ROC and Precision-Recall curves
##D smcurves <- evalmod(mdat, raw_curves = TRUE)
##D 
##D ## Plot average ROC and Precision-Recall curves
##D plot(smcurves, raw_curves = FALSE)
##D 
##D ## Hide confidence bounds
##D plot(smcurves, raw_curves = FALSE, show_cb = FALSE)
##D 
##D ## Plot raw ROC and Precision-Recall curves
##D plot(smcurves, raw_curves = TRUE, show_cb = FALSE)
##D 
##D ## Generate an smpoints object that contains basic evaluation measures
##D smpoints <- evalmod(mdat, mode = "basic")
##D 
##D ## Plot normalized ranks vs. average basic evaluation measures
##D plot(smpoints)
##D 
##D 
##D ##################################################
##D ### Multiple models & multiple test datasets
##D ###
##D 
##D ## Create sample datasets with 100 positives and 100 negatives
##D samps <- create_sim_samples(10, 100, 100, "all")
##D mdat <- mmdata(samps[["scores"]], samps[["labels"]],
##D                modnames = samps[["modnames"]],
##D                dsids = samps[["dsids"]])
##D 
##D ## Generate an mscurve object that contains ROC and Precision-Recall curves
##D mmcurves <- evalmod(mdat, raw_curves = TRUE)
##D 
##D ## Plot average ROC and Precision-Recall curves
##D plot(mmcurves, raw_curves = FALSE)
##D 
##D ## Show confidence bounds
##D plot(mmcurves, raw_curves = FALSE, show_cb = TRUE)
##D 
##D ## Plot raw ROC and Precision-Recall curves
##D plot(mmcurves, raw_curves = TRUE)
##D 
##D ## Generate an mmpoints object that contains basic evaluation measures
##D mmpoints <- evalmod(mdat, mode = "basic")
##D 
##D ## Plot normalized ranks vs. average basic evaluation measures
##D plot(mmpoints)
##D 
##D 
##D ##################################################
##D ### N-fold cross validation datasets
##D ###
##D 
##D ## Load test data
##D data(M2N50F5)
##D 
##D ## Speficy nessesary columns to create mdat
##D cvdat <- mmdata(nfold_df = M2N50F5, score_cols = c(1, 2),
##D                 lab_col = 3, fold_col = 4,
##D                 modnames = c("m1", "m2"), dsids = 1:5)
##D 
##D ## Generate an mmcurve object that contains ROC and Precision-Recall curves
##D cvcurves <- evalmod(cvdat)
##D 
##D ## Average ROC and Precision-Recall curves
##D plot(cvcurves)
##D 
##D ## Show confidence bounds
##D plot(cvcurves, show_cb = TRUE)
##D 
##D ## Generate an mmpoints object that contains basic evaluation measures
##D cvpoints <- evalmod(cvdat, mode = "basic")
##D 
##D ## Normalized ranks vs. average basic evaluation measures
##D plot(cvpoints)
##D 
## End(Not run)




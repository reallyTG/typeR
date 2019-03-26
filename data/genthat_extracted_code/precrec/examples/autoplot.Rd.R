library(precrec)


### Name: autoplot
### Title: Plot performance evaluation measures with ggplot2
### Aliases: autoplot autoplot.sscurves autoplot.mscurves autoplot.smcurves
###   autoplot.mmcurves autoplot.sspoints autoplot.mspoints
###   autoplot.smpoints autoplot.mmpoints

### ** Examples

## Not run: 
##D 
##D ## Load libraries
##D library(ggplot2)
##D library(grid)
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
##D ## Plot both ROC and Precision-Recall curves
##D autoplot(sscurves)
##D 
##D ## Reduced/Full supporting points
##D sampss <- create_sim_samples(1, 50000, 50000)
##D evalss <- evalmod(scores = sampss$scores, labels = sampss$labels)
##D 
##D # Reduced supporting point
##D system.time(autoplot(evalss))
##D 
##D # Full supporting points
##D system.time(autoplot(evalss, reduce_points = FALSE))
##D 
##D ## Get a grob object for multiple plots
##D pp1 <- autoplot(sscurves, ret_grob = TRUE)
##D plot.new()
##D grid.draw(pp1)
##D 
##D ## A ROC curve
##D autoplot(sscurves, curvetype = "ROC")
##D 
##D ## A Precision-Recall curve
##D autoplot(sscurves, curvetype = "PRC")
##D 
##D ## Generate an sspoints object that contains basic evaluation measures
##D sspoints <- evalmod(mode = "basic", scores = P10N10$scores,
##D                     labels = P10N10$labels)
##D 
##D ## Normalized ranks vs. basic evaluation measures
##D autoplot(sspoints)
##D 
##D ## Normalized ranks vs. precision
##D autoplot(sspoints, curvetype = "precision")
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
##D ## ROC and Precision-Recall curves
##D autoplot(mscurves)
##D 
##D ## Reduced/Full supporting points
##D sampms <- create_sim_samples(5, 50000, 50000)
##D evalms <- evalmod(scores = sampms$scores, labels = sampms$labels)
##D 
##D # Reduced supporting point
##D system.time(autoplot(evalms))
##D 
##D # Full supporting points
##D system.time(autoplot(evalms, reduce_points = FALSE))
##D 
##D ## Hide the legend
##D autoplot(mscurves, show_legend = FALSE)
##D 
##D ## Generate an mspoints object that contains basic evaluation measures
##D mspoints <- evalmod(mdat, mode = "basic")
##D 
##D ## Normalized ranks vs. basic evaluation measures
##D autoplot(mspoints)
##D 
##D ## Hide the legend
##D autoplot(mspoints, show_legend = FALSE)
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
##D ## Average ROC and Precision-Recall curves
##D autoplot(smcurves, raw_curves = FALSE)
##D 
##D ## Hide confidence bounds
##D autoplot(smcurves, raw_curves = FALSE, show_cb = FALSE)
##D 
##D ## Raw ROC and Precision-Recall curves
##D autoplot(smcurves, raw_curves = TRUE, show_cb = FALSE)
##D 
##D ## Reduced/Full supporting points
##D sampsm <- create_sim_samples(4, 5000, 5000)
##D mdatsm <- mmdata(sampsm$scores, sampsm$labels, expd_first = "dsids")
##D evalsm <- evalmod(mdatsm, raw_curves = TRUE)
##D 
##D # Reduced supporting point
##D system.time(autoplot(evalsm, raw_curves = TRUE))
##D 
##D # Full supporting points
##D system.time(autoplot(evalsm, raw_curves = TRUE, reduce_points = FALSE))
##D 
##D ## Generate an smpoints object that contains basic evaluation measures
##D smpoints <- evalmod(mdat, mode = "basic")
##D 
##D ## Normalized ranks vs. average basic evaluation measures
##D autoplot(smpoints)
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
##D ## Average ROC and Precision-Recall curves
##D autoplot(mmcurves, raw_curves = FALSE)
##D 
##D ## Show confidence bounds
##D autoplot(mmcurves, raw_curves = FALSE, show_cb = TRUE)
##D 
##D ## Raw ROC and Precision-Recall curves
##D autoplot(mmcurves, raw_curves = TRUE)
##D 
##D ## Reduced/Full supporting points
##D sampmm <- create_sim_samples(4, 5000, 5000)
##D mdatmm <- mmdata(sampmm$scores, sampmm$labels, modnames = c("m1", "m2"),
##D                  dsids = c(1, 2), expd_first = "modnames")
##D evalmm <- evalmod(mdatmm, raw_curves = TRUE)
##D 
##D # Reduced supporting point
##D system.time(autoplot(evalmm, raw_curves = TRUE))
##D 
##D # Full supporting points
##D system.time(autoplot(evalmm, raw_curves = TRUE, reduce_points = FALSE))
##D 
##D ## Generate an mmpoints object that contains basic evaluation measures
##D mmpoints <- evalmod(mdat, mode = "basic")
##D 
##D ## Normalized ranks vs. average basic evaluation measures
##D autoplot(mmpoints)
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
##D autoplot(cvcurves)
##D 
##D ## Show confidence bounds
##D autoplot(cvcurves, show_cb = TRUE)
##D 
##D ## Generate an mmpoints object that contains basic evaluation measures
##D cvpoints <- evalmod(cvdat, mode = "basic")
##D 
##D ## Normalized ranks vs. average basic evaluation measures
##D autoplot(cvpoints)
##D 
## End(Not run)





library(precrec)


### Name: as.data.frame
### Title: Convert a curves and points object to a data frame
### Aliases: as.data.frame as.data.frame.sscurves as.data.frame.mscurves
###   as.data.frame.smcurves as.data.frame.mmcurves as.data.frame.sspoints
###   as.data.frame.mspoints as.data.frame.smpoints as.data.frame.mmpoints
###   as.data.frame.aucroc

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
##D ## Convert sscurves to a data frame
##D sscurves.df <- as.data.frame(sscurves)
##D 
##D ## Show data frame
##D head(sscurves.df)
##D 
##D ## Generate an sspoints object that contains basic evaluation measures
##D sspoints <- evalmod(mode = "basic", scores = P10N10$scores,
##D                     labels = P10N10$labels)
##D ## Convert sspoints to a data frame
##D sspoints.df <- as.data.frame(sspoints)
##D 
##D ## Show data frame
##D head(sspoints.df)
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
##D ## Convert mscurves to a data frame
##D mscurves.df <- as.data.frame(mscurves)
##D 
##D ## Show data frame
##D head(mscurves.df)
##D 
##D ## Generate an mspoints object that contains basic evaluation measures
##D mspoints <- evalmod(mdat, mode = "basic")
##D 
##D ## Convert mspoints to a data frame
##D mspoints.df <- as.data.frame(mspoints)
##D 
##D ## Show data frame
##D head(mspoints.df)
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
##D ## Convert smcurves to a data frame
##D smcurves.df <- as.data.frame(smcurves)
##D 
##D ## Show data frame
##D head(smcurves.df)
##D 
##D ## Generate an smpoints object that contains basic evaluation measures
##D smpoints <- evalmod(mdat, mode = "basic")
##D 
##D ## Convert smpoints to a data frame
##D smpoints.df <- as.data.frame(smpoints)
##D 
##D ## Show data frame
##D head(smpoints.df)
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
##D ## Convert mmcurves to a data frame
##D mmcurves.df <- as.data.frame(mmcurves)
##D 
##D ## Show data frame
##D head(mmcurves.df)
##D 
##D ## Generate an mmpoints object that contains basic evaluation measures
##D mmpoints <- evalmod(mdat, mode = "basic")
##D 
##D ## Convert mmpoints to a data frame
##D mmpoints.df <- as.data.frame(mmpoints)
##D 
##D ## Show data frame
##D head(mmpoints.df)
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
##D ## Convert mmcurves to a data frame
##D cvcurves.df <- as.data.frame(cvcurves)
##D 
##D ## Show data frame
##D head(cvcurves.df)
##D 
##D ## Generate an mmpoints object that contains basic evaluation measures
##D cvpoints <- evalmod(cvdat, mode = "basic")
##D 
##D ## Convert mmpoints to a data frame
##D cvpoints.df <- as.data.frame(cvpoints)
##D 
##D ## Show data frame
##D head(cvpoints.df)
##D 
##D 
##D ##################################################
##D ### AUC with the U statistic
##D ###
##D 
##D ## mode = "aucroc"
##D data(P10N10)
##D uauc1 <- evalmod(scores = P10N10$scores, labels = P10N10$labels,
##D                  mode="aucroc")
##D 
##D # as.data.frame 'aucroc'
##D as.data.frame(uauc1)
##D 
##D ## mode = "aucroc"
##D samps <- create_sim_samples(10, 100, 100, "all")
##D mdat <- mmdata(samps[["scores"]], samps[["labels"]],
##D                modnames = samps[["modnames"]],
##D                dsids = samps[["dsids"]])
##D uauc2 <- evalmod(mdat, mode="aucroc")
##D 
##D # as.data.frame 'aucroc'
##D head(as.data.frame(uauc2))
## End(Not run)





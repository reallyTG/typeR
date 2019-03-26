library(precrec)


### Name: fortify
### Title: Convert a curves and points object to a data frame for ggplot2
### Aliases: fortify fortify.sscurves fortify.mscurves fortify.smcurves
###   fortify.mmcurves fortify.sspoints fortify.mspoints fortify.smpoints
###   fortify.mmpoints

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
##D ## Let ggplot internally call fortify
##D p_rocprc <- ggplot(sscurves, aes(x = x, y = y))
##D p_rocprc <- p_rocprc + geom_line()
##D p_rocprc <- p_rocprc + facet_wrap(~curvetype)
##D p_rocprc
##D 
##D ## Explicitly fortify sscurves
##D ssdf <- fortify(sscurves)
##D 
##D ## Plot a ROC curve
##D p_roc <- ggplot(subset(ssdf, curvetype == "ROC"), aes(x = x, y = y))
##D p_roc <- p_roc + geom_line()
##D p_roc
##D 
##D ## Plot a Precision-Recall curve
##D p_prc <- ggplot(subset(ssdf, curvetype == "PRC"), aes(x = x, y = y))
##D p_prc <- p_prc + geom_line()
##D p_prc
##D 
##D ## Generate an sspoints object that contains basic evaluation measures
##D sspoints <- evalmod(mode = "basic", scores = P10N10$scores,
##D                     labels = P10N10$labels)
##D ## Fortify sspoints
##D ssdf <- fortify(sspoints)
##D 
##D ## Plot normalized ranks vs. precision
##D p_prec <- ggplot(subset(ssdf, curvetype == "precision"), aes(x = x, y = y))
##D p_prec <- p_prec + geom_point()
##D p_prec
##D 
##D 
##D ##################################################
##D ### Multiple models & single test dataset
##D ###
##D 
##D ## Create sample datasets with 10 positives and 10 negatives
##D samps <- create_sim_samples(1, 10, 10, "all")
##D mdat <- mmdata(samps[["scores"]], samps[["labels"]],
##D                modnames = samps[["modnames"]])
##D 
##D ## Generate an mscurve object that contains ROC and Precision-Recall curves
##D mscurves <- evalmod(mdat)
##D 
##D ## Let ggplot internally call fortify
##D p_rocprc <- ggplot(mscurves, aes(x = x, y = y, color = modname))
##D p_rocprc <- p_rocprc + geom_line()
##D p_rocprc <- p_rocprc + facet_wrap(~curvetype)
##D p_rocprc
##D 
##D ## Explicitly fortify mscurves
##D msdf <- fortify(mscurves)
##D 
##D ## Plot ROC curve
##D df_roc <- subset(msdf, curvetype == "ROC")
##D p_roc <- ggplot(df_roc, aes(x = x, y = y, color = modname))
##D p_roc <- p_roc + geom_line()
##D p_roc
##D 
##D ## Fortified data frame can be used for plotting a Precision-Recall curve
##D df_prc <- subset(msdf, curvetype == "PRC")
##D p_prc <- ggplot(df_prc, aes(x = x, y = y, color = modname))
##D p_prc <- p_prc + geom_line()
##D p_prc
##D 
##D ## Generate an mspoints object that contains basic evaluation measures
##D mspoints <- evalmod(mdat, mode = "basic")
##D 
##D ## Fortify mspoints
##D msdf <- fortify(mspoints)
##D 
##D ## Plot normalized ranks vs. precision
##D df_prec <- subset(msdf, curvetype == "precision")
##D p_prec <- ggplot(df_prec, aes(x = x, y = y, color = modname))
##D p_prec <- p_prec + geom_point()
##D p_prec
##D 
##D 
##D ##################################################
##D ### Single model & multiple test datasets
##D ###
##D 
##D ## Create sample datasets with 10 positives and 10 negatives
##D samps <- create_sim_samples(5, 10, 10, "good_er")
##D mdat <- mmdata(samps[["scores"]], samps[["labels"]],
##D                modnames = samps[["modnames"]],
##D                dsids = samps[["dsids"]])
##D 
##D ## Generate an smcurve object that contains ROC and Precision-Recall curves
##D smcurves <- evalmod(mdat, raw_curves = TRUE)
##D 
##D ## Let ggplot internally call fortify
##D p_rocprc <- ggplot(smcurves, aes(x = x, y = y, group = dsid))
##D p_rocprc <- p_rocprc + geom_smooth(stat = "identity")
##D p_rocprc <- p_rocprc + facet_wrap(~curvetype)
##D p_rocprc
##D 
##D ## Explicitly fortify smcurves
##D smdf <- fortify(smcurves, raw_curves = FALSE)
##D 
##D ## Plot average ROC curve
##D df_roc <- subset(smdf, curvetype == "ROC")
##D p_roc <- ggplot(df_roc, aes(x = x, y = y, ymin = ymin, ymax = ymax))
##D p_roc <- p_roc + geom_smooth(stat = "identity")
##D p_roc
##D 
##D ## Plot average Precision-Recall curve
##D df_prc <- subset(smdf, curvetype == "PRC")
##D p_prc <- ggplot(df_prc, aes(x = x, y = y, ymin = ymin, ymax = ymax))
##D p_prc <- p_prc + geom_smooth(stat = "identity")
##D p_prc
##D 
##D ## Generate an smpoints object that contains basic evaluation measures
##D smpoints <- evalmod(mdat, mode = "basic")
##D 
##D ## Fortify smpoints
##D smdf <- fortify(smpoints)
##D 
##D ## Plot normalized ranks vs. precision
##D df_prec <- subset(smdf, curvetype == "precision")
##D p_prec <- ggplot(df_prec, aes(x = x, y = y, ymin = ymin, ymax = ymax))
##D p_prec <- p_prec + geom_ribbon(aes(min = ymin, ymax = ymax),
##D                                stat = "identity", alpha = 0.25,
##D                                fill = "grey25")
##D p_prec <- p_prec + geom_point(aes(x = x, y = y))
##D p_prec
##D 
##D 
##D ##################################################
##D ### Multiple models & multiple test datasets
##D ###
##D 
##D ## Create sample datasets with 10 positives and 10 negatives
##D samps <- create_sim_samples(5, 10, 10, "all")
##D mdat <- mmdata(samps[["scores"]], samps[["labels"]],
##D                modnames = samps[["modnames"]],
##D                dsids = samps[["dsids"]])
##D 
##D ## Generate an mscurve object that contains ROC and Precision-Recall curves
##D mmcurves <- evalmod(mdat, raw_curves = TRUE)
##D 
##D ## Let ggplot internally call fortify
##D p_rocprc <- ggplot(mmcurves, aes(x = x, y = y, group = dsid))
##D p_rocprc <- p_rocprc + geom_smooth(aes(color = modname), stat = "identity")
##D p_rocprc <- p_rocprc + facet_wrap(~curvetype)
##D p_rocprc
##D 
##D ## Explicitly fortify mmcurves
##D mmdf <- fortify(mmcurves, raw_curves = FALSE)
##D 
##D ## Plot average ROC curve
##D df_roc <- subset(mmdf, curvetype == "ROC")
##D p_roc <- ggplot(df_roc, aes(x = x, y = y, ymin = ymin, ymax = ymax))
##D p_roc <- p_roc + geom_smooth(aes(color = modname), stat = "identity")
##D p_roc
##D 
##D ## Plot average Precision-Recall curve
##D df_prc <- subset(mmdf, curvetype == "PRC")
##D p_prc <- ggplot(df_prc, aes(x = x, y = y, ymin = ymin, ymax = ymax))
##D p_prc <- p_prc + geom_smooth(aes(color = modname), stat = "identity")
##D p_prc
##D 
##D ## Generate an mmpoints object that contains basic evaluation measures
##D mmpoints <- evalmod(mdat, mode = "basic")
##D 
##D ## Fortify mmpoints
##D mmdf <- fortify(mmpoints)
##D 
##D ## Plot normalized ranks vs. precision
##D df_prec <- subset(mmdf, curvetype == "precision")
##D p_prec <- ggplot(df_prec, aes(x = x, y = y, ymin = ymin, ymax = ymax))
##D p_prec <- p_prec + geom_ribbon(aes(min = ymin, ymax = ymax, group = modname),
##D                                stat = "identity", alpha = 0.25,
##D                                fill = "grey25")
##D p_prec <- p_prec + geom_point(aes(x = x, y = y, color = modname))
##D p_prec
## End(Not run)





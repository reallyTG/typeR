## ------------------------------------------------------------------------
library(precrec)

# Load a test dataset
data(P10N10)

# Calculate ROC and Precision-Recall curves
sscurves <- evalmod(scores = P10N10$scores, labels = P10N10$labels)

## ---- fig.width=7, fig.show='hold'---------------------------------------
# Show ROC and Precision-Recall plots
plot(sscurves)

# Show a Precision-Recall plot
plot(sscurves, "PRC")

## ---- fig.width=7, fig.show='hold'---------------------------------------
# The ggplot2 package is required 
library(ggplot2)

# Show ROC and Precision-Recall plots
autoplot(sscurves)

# Show a Precision-Recall plot
autoplot(sscurves, "PRC")

## ---- fig.show = 'hide', results = 'hold'--------------------------------

# 5 data sets with 50000 positives and 50000 negatives
samp1 <- create_sim_samples(5, 50000, 50000)

# Calculate curves
eval1 <- evalmod(scores = samp1$scores, labels = samp1$labels)

# Reduced supporting points
system.time(autoplot(eval1))

# Full supporting points
system.time(autoplot(eval1, reduce_points = FALSE))

## ------------------------------------------------------------------------
# Get a data frame with AUC scores
aucs <- auc(sscurves)

# Use knitr::kable to display the result in a table format
knitr::kable(aucs)

# Get AUCs of Precision-Recall
aucs_prc <- subset(aucs, curvetypes == "PRC")
knitr::kable(aucs_prc)


## ------------------------------------------------------------------------
# Convert sscurves to a data frame
sscurves.df <- as.data.frame(sscurves)

# Use knitr::kable to display the result in a table format
knitr::kable(head(sscurves.df))


## ------------------------------------------------------------------------
s1 <- c(1, 2, 3, 4)
s2 <- c(5, 6, 7, 8)
s3 <- matrix(1:8, 4, 2)

# Join two score vectors
scores1 <- join_scores(s1, s2)

# Join two vectors and a matrix
scores2 <- join_scores(s1, s2, s3)

## ------------------------------------------------------------------------
l1 <- c(1, 0, 1, 1)
l2 <- c(1, 0, 1, 1)
l3 <- c(1, 0, 1, 0)

# Join two label vectors
labels1 <- join_labels(l1, l2)
labels2 <- join_labels(l1, l3)

## ------------------------------------------------------------------------
# Create an input dataset with two score vectors and one label vector
msmdat <- mmdata(scores1, labels1)

# Specify dataset IDs
smmdat <- mmdata(scores1, labels2, dsids = c(1, 2))

# Specify model names and dataset IDs
mmmdat <- mmdata(scores1, labels2, modnames = c("mod1", "mod2"), dsids = c(1, 2))

## ------------------------------------------------------------------------
# A dataset with 10 positives and 10 negatives for the random performance level
samps1 <- create_sim_samples(1, 10, 10, "random")

#  A dataset for five different performance levels
samps2 <- create_sim_samples(1, 10, 10, "all")

# A dataset with 20 samples for the good early retrieval performance level
samps3 <- create_sim_samples(20, 10, 10, "good_er")

# A dataset with 20 samples for five different performance levels
samps4 <- create_sim_samples(20, 10, 10, "all")

## ------------------------------------------------------------------------
# Use a list with multiple score vectors and a list with a single label vector
msmdat1 <- mmdata(scores1, labels1)

# Explicitly specify model names
msmdat2 <- mmdata(scores1, labels1, modnames = c("mod1", "mod2"))

# Use a sample dataset created by the create_sim_samples function
msmdat3 <- mmdata(samps2[["scores"]], samps2[["labels"]], modnames = samps2[["modnames"]])

## ------------------------------------------------------------------------
# Calculate ROC and Precision-Recall curves for multiple models
mscurves <- evalmod(msmdat3)

## ---- fig.width=7, fig.show='hold'---------------------------------------
# Show ROC and Precision-Recall curves with the ggplot2 package
autoplot(mscurves)

## ------------------------------------------------------------------------
# Convert mscurves to a data frame
mscurves.df <- as.data.frame(mscurves)

# Use knitr::kable to display the result in a table format
knitr::kable(head(mscurves.df))


## ------------------------------------------------------------------------
# Specify test dataset IDs names
smmdat1 <- mmdata(scores1, labels2, dsids = c(1,2))

# Use a sample dataset created by the create_sim_samples function
smmdat2 <- mmdata(samps3[["scores"]], samps3[["labels"]], dsids = samps3[["dsids"]])

## ------------------------------------------------------------------------
# Calculate curves for multiple test datasets and keep all the curves
smcurves <- evalmod(smmdat2, raw_curves = TRUE)

## ---- fig.width=7, fig.show='hold'---------------------------------------
# Show an average Precision-Recall curve with the 95% confidence bounds
autoplot(smcurves, "PRC", show_cb = TRUE)

# Show raw Precision-Recall curves
autoplot(smcurves, "PRC", show_cb = FALSE)

## ------------------------------------------------------------------------
# Convert smcurves to a data frame
smcurves.df <- as.data.frame(smcurves)

# Use knitr::kable to display the result in a table format
knitr::kable(head(smcurves.df))


## ------------------------------------------------------------------------
# Specify model names and test dataset IDs names
mmmdat1 <- mmdata(scores1, labels2, modnames= c("mod1", "mod2"), dsids = c(1, 2))

# Use a sample dataset created by the create_sim_samples function
mmmdat2 <- mmdata(samps4[["scores"]], samps4[["labels"]], 
                  modnames = samps4[["modnames"]], dsids = samps4[["dsids"]])

## ------------------------------------------------------------------------
# Calculate curves for multiple models and multiple test datasets
mmcurves <- evalmod(mmmdat2)

## ---- fig.width=7, fig.show='hold'---------------------------------------
# Show average Precision-Recall curves
autoplot(mmcurves, "PRC")

# Show average Precision-Recall curves with the 95% confidence bounds
autoplot(mmcurves, "PRC", show_cb = TRUE)

## ------------------------------------------------------------------------
# Convert smcurves to a data frame
mmcurves.df <- as.data.frame(mmcurves)

# Use knitr::kable to display the result in a table format
knitr::kable(head(mmcurves.df))


## ---- fig.width=7, fig.show='hold'---------------------------------------
# Show all curves
smcurves_all <- evalmod(smmdat2, raw_curves = TRUE)
autoplot(smcurves_all)

## ---- fig.width=7, fig.show='hold'---------------------------------------
# x_bins: 2
smcurves_xb2 <- evalmod(smmdat2, x_bins = 2)
autoplot(smcurves_xb2)

## ---- fig.width=7, fig.show='hold'---------------------------------------
# x_bins: 10
smcurves_xb10 <- evalmod(smmdat2, x_bins = 10)
autoplot(smcurves_xb10)

## ---- fig.width=7, fig.show='hold'---------------------------------------
# cb_alpha: 0.1 for 90% confidence band
smcurves_cb1 <- evalmod(smmdat2, x_bins = 10, cb_alpha = 0.1)
autoplot(smcurves_cb1)

# cb_alpha: 0.01 for 99% confidence band
smcurves_cb2 <- evalmod(smmdat2, x_bins = 10, cb_alpha = 0.01)
autoplot(smcurves_cb2)

## ------------------------------------------------------------------------
# Load data
data(M2N50F5)

# Use knitr::kable to display the result in a table format
knitr::kable(head(M2N50F5))

## ---- fig.width=7, fig.show='hold'---------------------------------------
# Convert data frame to list
nfold_list1 = format_nfold(nfold_df = M2N50F5,  score_cols = c(1, 2), 
                           lab_col = 3, fold_col = 4)

# Use column names
nfold_list2 = format_nfold(nfold_df = M2N50F5, score_cols = c("score1", "score2"),
                           lab_col = "label", fold_col = "fold")

# Use the result for evalmod
cvcurves <- evalmod(scores = nfold_list2$scores, labels = nfold_list2$labels,
                    modnames = rep(c("m1", "m2"), each = 5), dsids = rep(1:5, 2))
autoplot(cvcurves)

## ---- fig.width=7, fig.show='hold'---------------------------------------
# mmdata
cvcurves2 <- mmdata(nfold_df = M2N50F5, score_cols = c(1, 2), lab_col = 3, fold_col = 4, 
                    modnames = c("m1", "m2"), dsids = 1:5)

# evalmod
cvcurves3 <- evalmod(nfold_df = M2N50F5, score_cols = c(1, 2), lab_col = 3, fold_col = 4, 
                     modnames = c("m1", "m2"), dsids = 1:5)
autoplot(cvcurves3)

## ------------------------------------------------------------------------
# Calculate basic evaluation measures
mmpoins <- evalmod(mmmdat2, mode = "basic")

## ---- fig.width=7, fig.show='hold'---------------------------------------
# Show normalized ranks vs. error rate and accuracy
autoplot(mmpoins, c("error", "accuracy"))

# Show normalized ranks vs. specificity, sensitivity, and precision
autoplot(mmpoins, c("specificity", "sensitivity", "precision"))

# Show normalized ranks vs. Matthews correlation coefficient and F-score
autoplot(mmpoins, c("mcc", "fscore"))

## ---- fig.width=7, fig.show='hold'---------------------------------------
# Show normalized ranks vs. scores and labels
autoplot(mmpoins, c("score", "label"))

## ------------------------------------------------------------------------
# Convert mmpoins to a data frame
mmpoins.df <- as.data.frame(mmpoins)

# Use knitr::kable to display the result in a table format
knitr::kable(head(mmpoins.df))


## ------------------------------------------------------------------------
# Calculate ROC and Precision-Recall curves
curves <- evalmod(scores = P10N10$scores, labels = P10N10$labels)

# Calculate partial AUCs
curves.part <- part(curves, xlim = c(0.0, 0.25))

# Retrieve a dataframe of pAUCs
paucs.df <- pauc(curves.part)

# Use knitr::kable to display the result in a table format
knitr::kable(paucs.df)

## ---- fig.width=7, fig.show='hold'---------------------------------------
# Show ROC and Precision-Recall curves
autoplot(curves.part)

## ------------------------------------------------------------------------
# Calculate AUC (ROC)
aucs <- evalmod(scores = P10N10$scores, labels = P10N10$labels, mode = 'aucroc')

# Convert to data.frame
aucs.df <- as.data.frame(aucs)

# Use knitr::kable to display the result in a table format
knitr::kable(aucs.df)

## ------------------------------------------------------------------------
# Balanced dataset
samps5 <- create_sim_samples(100, 100, 100, "all")
simmdat1 <- mmdata(samps5[["scores"]], samps5[["labels"]], 
                   modnames = samps5[["modnames"]], dsids = samps5[["dsids"]])

# Imbalanced dataset
samps6 <- create_sim_samples(100, 25, 100, "all")
simmdat2 <- mmdata(samps6[["scores"]], samps6[["labels"]], 
                   modnames = samps6[["modnames"]], dsids = samps6[["dsids"]])


## ------------------------------------------------------------------------
# Balanced dataset
simcurves1 <- evalmod(simmdat1)

# Imbalanced dataset
simcurves2 <- evalmod(simmdat2)

## ---- fig.width=7, fig.show='hold'---------------------------------------
# Balanced dataset
autoplot(simcurves1)

# Imbalanced dataset
autoplot(simcurves2)


library(precrec)


### Name: mmdata
### Title: Reformat input data for performance evaluation calculation
### Aliases: mmdata

### ** Examples


##################################################
### Single model & single test dataset
###

## Load a dataset with 10 positives and 10 negatives
data(P10N10)

## Generate mdat object
ssmdat1 <- mmdata(P10N10$scores, P10N10$labels)
ssmdat1
ssmdat2 <- mmdata(1:8, sample(c(0, 1), 8, replace = TRUE))
ssmdat2


##################################################
### Multiple models & single test dataset
###

## Create sample datasets with 100 positives and 100 negatives
samps <- create_sim_samples(1, 100, 100, "all")

## Multiple models & single test dataset
msmdat1 <- mmdata(samps[["scores"]], samps[["labels"]],
                  modnames = samps[["modnames"]])
msmdat1

## Use join_scores and join_labels
s1 <- c(1, 2, 3, 4)
s2 <- c(5, 6, 7, 8)
scores <- join_scores(s1, s2)

l1 <- c(1, 0, 1, 1)
l2 <- c(1, 0, 1, 1)
labels <- join_labels(l1, l2)

msmdat2 <- mmdata(scores, labels, modnames = c("ms1", "ms2"))
msmdat2


##################################################
### Single model & multiple test datasets
###

## Create sample datasets with 100 positives and 100 negatives
samps <- create_sim_samples(10, 100, 100, "good_er")

## Single model & multiple test datasets
smmdat <- mmdata(samps[["scores"]], samps[["labels"]],
                 modnames = samps[["modnames"]],
                 dsids = samps[["dsids"]])
smmdat


##################################################
### Multiple models & multiple test datasets
###

## Create sample datasets with 100 positives and 100 negatives
samps <- create_sim_samples(10, 100, 100, "all")

## Multiple models & multiple test datasets
mmmdat <- mmdata(samps[["scores"]], samps[["labels"]],
                 modnames = samps[["modnames"]],
                 dsids = samps[["dsids"]])
mmmdat


##################################################
### N-fold cross validation datasets
###

## Load test data
data(M2N50F5)
head(M2N50F5)

## Speficy nessesary columns to create mdat
cvdat1 <- mmdata(nfold_df = M2N50F5, score_cols = c(1, 2),
                 lab_col = 3, fold_col = 4,
                 modnames = c("m1", "m2"), dsids = 1:5)
cvdat1

## Use column names
cvdat2 <- mmdata(nfold_df = M2N50F5, score_cols = c("score1", "score2"),
                 lab_col = "label", fold_col = "fold",
                 modnames = c("m1", "m2"), dsids = 1:5)
cvdat2





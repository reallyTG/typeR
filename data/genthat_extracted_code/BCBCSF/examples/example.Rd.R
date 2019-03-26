library(BCBCSF)


### Name: d1:bcbcsfexamples
### Title: Examples of fitting models, predicting class labels, evaluating
###   prediction, and analyzing fitting results
### Aliases: bcbcsfexamples

### ** Examples


##\dontrun{
## load lymphoma microarray data
data (lymphoma)

## select some cases as testing data set
ts <- c (sort(sample (1:42,5)), 43:44, 61:62)

## training data
X_tr <- lymph.X[-ts,] 
y_tr <- lymph.y[-ts]
## test data 
X_ts <- lymph.X[ts,] 
y_ts <- lymph.y[ts] 

##########################################################################
######################## training and prediction #########################
##########################################################################
## fitting training data with top features selected by F-statistic 
out_fit <- bcbcsf_fitpred (X_tr = X_tr, y_tr = y_tr, nos_fsel = c(20, 50),
                           no_rmc = 100)
## note 1: if 'X_ts' is given above, prediction is made after fitting
## note 2: no_rmc = 100 is too small, omit it and use the default

## predicting class labels of test cases 
out_pred <- bcbcsf_pred (X_ts = X_ts, out_fit = out_fit)

## evaluate prediction given true labels
eval_pred (out_pred = out_pred, y_ts = y_ts)

##########################################################################
####################### visualizing prediction results ###################
##########################################################################
## reload one bcbcsf fit result from hardrive
fit_bcbcsf <- reload_fit_bcbcsf (out_fit$fitfiles[1])
## the fitting result for no_fsel = 50 can be retrieved directly from
## out_fit:
fit_bcbcsf_fsel50 <- out_fit$fit_bcbcsf
## summarize the fitting result
sum_fit <- bcbcsf_sumfit (fit_bcbcsf)

## visualize fitting result
bcbcsf_plotsumfit (sum_fit)

##########################################################################
############################ cross validation ############################
##########################################################################
## doing cross validation with bcbcsf_fitpred on lymphoma data 
cv_pred <- cross_vld (
       ##################### classifier, data, and fold ###################
       fitpred_func = bcbcsf_fitpred, X = lymph.X, y = lymph.y, nfold = 2,
       ################ all other arguments passed classifier ############
       nos_fsel = c(20,50), no_rmc = 100 )
## note: no_rmc = 100 is too small, omit it and use the default in practice

## evaluate prediction given true labels            
eval_pred (out_pred = cv_pred, y_ts = lymph.y)   

## warning: this function is slow if nfold is large; if you have a 
## computer cluster, you better parallel the cross validation folds.
##}




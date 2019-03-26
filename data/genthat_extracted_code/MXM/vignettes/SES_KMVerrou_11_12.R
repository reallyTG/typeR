## ---- warning =  FALSE, message = FALSE----------------------------------

### ~ ~ ~ Load Packages ~ ~ ~ ###
library(MXM) 
library(dplyr)

## ------------------------------------------------------------------------

### ~ ~ ~ Load The Dataset ~ ~ ~ ###
wine.url <- "ftp://ftp.ics.uci.edu/pub/machine-learning-databases/wine/wine.data"
wine <- read.csv(wine.url,
                 check.names = FALSE,
                 header = FALSE) 
head(wine)
str(wine)
colnames(wine) <- c('Type', 'Alcohol', 'Malic', 'Ash', 
                    'Alcalinity', 'Magnesium', 'Phenols', 
                    'Flavanoids', 'Nonflavanoids',
                    'Proanthocyanins', 'Color', 'Hue', 
                    'Dilution', 'Proline')

## ------------------------------------------------------------------------
### ~ ~ ~ Removing The Categorical ('Type') and The Target ('Nonflavanoids') Variables ~ ~ ~ ###

wine_dataset <- dplyr::select(wine,
                              -contains("Type"),
                              -contains("Nonflavanoids")) 
head(wine_dataset)

## ------------------------------------------------------------------------
wine_target <- wine$Nonflavanoids
head(wine_target)

## ------------------------------------------------------------------------
### ~ ~ ~ Running SES For First Time ~ ~ ~ ###
ses_default_1st <- MXM::SES(target = wine_target,
                          dataset   = wine_dataset, 
                          max_k      = 3, 
                          threshold  = 0.05, 
                          test       = "testIndFisher",
                          ini        = NULL, 
                          wei        = NULL,
                          user_test  = NULL, 
                          hash       = TRUE, 
                          hashObject = NULL, 
                          ncores     = 1)

## ------------------------------------------------------------------------
ses_default_1st@selectedVars
SelectedVars_names<-colnames(wine_dataset[ses_default_1st@selectedVars])
SelectedVars_names

## ------------------------------------------------------------------------
SelectedVars_indecies_Ordered<- ses_default_1st@selectedVarsOrder
SelectedVars_indecies_Ordered

## ------------------------------------------------------------------------
ses_default_1st@signatures

## ------------------------------------------------------------------------
ses_default_1st@queues

## ------------------------------------------------------------------------
ses_default_1st@stats  

## ------------------------------------------------------------------------
ses_default_1st@pvalues

## ------------------------------------------------------------------------
ses_default_1st@max_k     # max_k option used in the current run
ses_default_1st@threshold # threshold option used in the current run
ses_default_1st@test      # character name of the statistic test used

## ------------------------------------------------------------------------
ses_default_1st@n.tests 

## ------------------------------------------------------------------------
ses_default_1st@univ

## ------------------------------------------------------------------------
ses_default_1st@runtime 

## ------------------------------------------------------------------------
### ~ ~ ~ Running SES For First Time ~ ~ ~ ###
ses_default_2nd <- MXM::SES(target = wine_target,
                          dataset   = wine_dataset, 
                          max_k      = 4, 
                          threshold  = 0.1, 
                          test       = "testIndFisher",
                          ini        = ses_default_1st@univ, 
                          wei        = NULL,
                          user_test  = NULL, 
                          hash       = TRUE, 
                          hashObject = ses_default_1st@hashObject, 
                          ncores     = 1)

## ------------------------------------------------------------------------
### ~ ~ ~ glm() Model Estimates Using SES Feature Subset As Predictor Variables ~ ~ ~ ###

first_sign_ses<- ses.model(target = wine_target, 
                             dataset = as.matrix(wine_dataset),
                             wei = NULL, 
                             sesObject = ses_default_1st, # 
                             test = 'testIndFisher')


## ------------------------------------------------------------------------

ses_model_summary <- first_sign_ses$mod
signature          <- first_sign_ses$signature
signature


## ------------------------------------------------------------------------
### ~ ~ ~ Taking The Whole Dataset ~ ~ ~ ###

wine_dataset <- wine
head(wine_dataset)

## ---- message=FALSE------------------------------------------------------
### ~ ~ ~ Running SES For Categorical Variable ~ ~ ~ ###
wine[, 1] <- as.factor(wine[, 1])
ses_default_1st <- MXM::SES(target = 1, ## Defining as target the 1st column
                          dataset   = wine, 
                          max_k      = 3, 
                          threshold  = 0.05, 
                          test       = "testIndMultinom",
                          ini        = NULL, 
                          wei        = NULL,
                          user_test  = NULL, 
                          hash       = TRUE, 
                          hashObject = NULL, 
                          ncores     = 1)

## ------------------------------------------------------------------------
ses_default_1st@selectedVars
SelectedVars_names<-colnames(wine_dataset[ses_default_1st@selectedVars])
SelectedVars_names

## ------------------------------------------------------------------------
SelectedVars_indecies_Ordered<- ses_default_1st@selectedVarsOrder
SelectedVars_indecies_Ordered

## ------------------------------------------------------------------------
ses_default_1st@signatures

## ------------------------------------------------------------------------
ses_default_1st@runtime 

## ------------------------------------------------------------------------
### ~ ~ ~ glm() Model Estimates Using SES Feature Subset As Predictor Variables ~ ~ ~ ###

second_sign_ses<- ses.model(target = as.matrix(wine_target), 
                             dataset = as.matrix(wine_dataset),
                             wei = NULL, 
                             sesObject = ses_default_2nd, # 
                             test = 'testIndFisher')


## ------------------------------------------------------------------------

ses_model_summary <- second_sign_ses$mod
signature          <- second_sign_ses$signature
signature


## ------------------------------------------------------------------------
str(signature)

## ------------------------------------------------------------------------
### ~ ~ ~ Permutations ~ ~ ~ ###
library('MXM')
permutation_ses_model <- MXM::perm.ses(wine_target,
                                         wine_dataset,  
                                         R = 999, # The number of permutations to use. The default value is 999
                                         max_k      = 3, 
                                         threshold  = 0.05, 
                                         test       = NULL, 
                                         ini        = NULL, 
                                         wei        = NULL,
                                         user_test  = NULL, 
                                         hash       = FALSE, 
                                         hashObject = NULL, 
                                         ncores     = 1)

## ---- collapse=FALSE-----------------------------------------------------
### ~ ~ ~ Cross-Validation ~ ~ ~ ### 
library('MXM')
cv_ses_model <- MXM::cv.ses(target   = wine[, 1], # Using the 1st column as target
                            dataset  = wine[, -1],  
                            wei      = NULL,
                            kfolds   = 5, 
                            folds    = NULL, 
                            alphas   = c(0.1, 0.05, 0.01), 
                            max_ks   = c(3, 4, 5), 
                            task     = "C", 
                            metric   = acc_multinom.mxm, # Note that we are passing it as a function and not as a character
                            modeler  = multinom.mxm,  # Note that we are passing it as a function and not as a character
                            ses_test = "testIndMultinom",
                            ncores = 1)

## ------------------------------------------------------------------------
cv_ses_model$best_configuration
cv_ses_model$best_performance

## ------------------------------------------------------------------------
cv_ses_model$cv_results_all[[1]]$configuration #this configuration we are examining
cv_ses_model$cv_results_all[[1]]$performances # those are the performances.
cv_ses_model$cv_results_all[[1]]$signatures # signatures created by this configuration

## ------------------------------------------------------------------------
cv_ses_model$best_performance
index<-cv_ses_model$best_configuration$id
cv_ses_model$cv_results_all[[index]]$performances
mean(cv_ses_model$cv_results_all[[index]]$performances)  

## ------------------------------------------------------------------------
#
N = dim(wine_dataset)[1]
suggested_max_k = floor(N/10)
N
suggested_max_k

## ------------------------------------------------------------------------
sessionInfo()


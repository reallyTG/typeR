## ---- eval = FALSE-------------------------------------------------------
#  
#  # Overview the MXM::`MMPC()` function
#  
#  mmpc <- MXM::MMPC(
#  
#         target,           # The target variable vector
#         dataset,          # The dataset with the target column removed
#         max_k = 3,        # The maximum size of the conditioning set to use
#         threshold = 0.05, # level of alpha for statistical  significance
#         test = 'testIndFisher',
#         ini = NULL,        # if TRUE, the calculated univariate associations
#                            # are stored for runtime efficiency in subsequent
#                            # MMPC runs with diferent hyper-parameters.
#         hash =  TRUE,      # if TRUE, the calculated statistics are stored.
#         hashObject = NULL, # the mmpc_object from a previous run
#  
#         ncores = 1,        # number of cores for parallel execution.
#                            # Recommended for thousands of variables.
#  
#         backward = TRUE)   # If TRUE, the backward phase
#                            # (or symmetry correction) is implemented.
#                            # Falsely included variables,
#                            # in the MMPC output signature are removed.
#  

## ---- warning = FALSE, message = FALSE-----------------------------------

# 0. INSTALL and LOAD the MXM R Package:
#install.packages('MXM', dependencies = TRUE )
library(MXM)

# 1. DOWNLOAD the wine dataset from UCI:
URL  <- "ftp://ftp.ics.uci.edu/pub/machine-learning-databases/wine/wine.data"
wine <-  read.csv(URL, header = FALSE) 


# 2. SET variables' names as header:
colnames(wine) <- c('Type', 'Alcohol', 'Malic', 'Ash', 
                    'Alcalinity', 'Magnesium', 'Phenols', 
                    'Flavanoids', 'Nonflavanoids', 'Proanthocyanins',
                    'Color', 'Hue', 'Dilution', 'Proline')

# 3. REMOVE the 1st attribute, which is the class information:
wine <- wine[,-1] 

# 4. PREVIEW UCI's wine dataset:
head(wine, 2)

# The header should include the wine attributes sans the class labels, 
# in the following order:

# Alcohol | Malic | Ash | Alcalinity | Magnesium | Phenols | Flavanoids 
# Nonflavanoids | Proanthocyanins | Color | Hue | Dilution | Proline 

## ---- warning = FALSE, message = FALSE-----------------------------------
# 5. CHECK for missing or non-numeric values in the dataframe:

sum(is.na(as.matrix(wine[,])))
sum(is.nan(as.matrix(wine[,])))  #if 0, then No NAs, none NaNs, good to go!
 

## ---- warning = FALSE, message = FALSE-----------------------------------

# 6. CHECK `wine` object's data type, dimensions:
str(wine)

# The output should be a datarame: 
#'data.frame':	178 obs. of  13 variables

## ---- warning = FALSE, message = FALSE-----------------------------------

# 0. Exclude target variable column
targetVariable <- wine$Nonflavanoids
targetVariable <- NULL


# 1. Convert dataframe to matrix:
wine_dataset <- as.matrix(wine)
head(wine_dataset, 2)


## ---- warning = FALSE, message = FALSE-----------------------------------

# 2. Check dimensions of the wine_dataset
# REMINDER: We need it as N x f    // N for instances, f or features

dim(wine_dataset)

# The output should be 178 x 12, 
#178 instances and 12 features; if so, we're good to go

## ---- warning = FALSE, message = FALSE-----------------------------------
# 3. Select the target variable (`Nonflavanoids`) and store as a matrix:
target_NonFlav <- as.vector(wine$Nonflavanoids)
str(target_NonFlav,2)

## ---- warning = FALSE, message = FALSE-----------------------------------

# MMPC on the wine dataset: 

library('MXM')
mmpc_object_wine_NonFlav <- MXM::MMPC( target  = target_NonFlav,            
                                       dataset = wine_dataset,            
                                       max_k = 3,          
                                       threshold = 0.05,                                         
                                       test = 'testIndFisher',   
                                       ini = NULL,                                                
                                       hash =  TRUE,      
                                       hashObject = NULL,                                        
                                       ncores = 1,         
                                       backward = TRUE)   
                                                        

## ------------------------------------------------------------------------
# Cache of the stats calculated in the MMPC run
str(mmpc_object_wine_NonFlav@hashObject) 

# a list with the univariate associations
str(mmpc_object_wine_NonFlav@univ)        

## ------------------------------------------------------------------------
execution_time_1st_MMPC_run <- mmpc_object_wine_NonFlav@runtime
execution_time_1st_MMPC_run

## ---- warning = FALSE, message = FALSE-----------------------------------

# MMPC on the wine dataset: 

library('MXM')
mmpc_object_2nd_run <- MXM::MMPC(target  = target_NonFlav,            
                                 dataset = wine_dataset  ,            
                           
                           # it was set to 3 in the 1st run 
                           max_k = 5, 
                           
                           # it was set to 0.05 in the 1st run
                           threshold = 0.01, 
                           
                           test = 'testIndFisher',
                           
                           #the cached univariate tests
                           ini = mmpc_object_wine_NonFlav@univ,
                           
                           # cached stats, p-values
                           hashObject = mmpc_object_wine_NonFlav@hashObject)  


## ---- warning = FALSE, message = FALSE-----------------------------------
execution_time_2nd_MMPC_run <- mmpc_object_2nd_run@runtime


execution_time_1st_MMPC_run
execution_time_2nd_MMPC_run

## ---- warning = FALSE, message = FALSE-----------------------------------

# Grid Search for MMPC hyper-parameter tuning 

library('MXM')
mmpc_GridSearch <- MXM::mmpc.path(
                  
                  target  = target_NonFlav,            
                  dataset = wine_dataset,            
                 
                  max_ks = c(3,4,5,6),  # a vector of k to try
                  
                  alphas = NULL,   # a vector of thresholds; 
                                        # If NULL, 0.1, 0.05 and 0.01 
                                        # will be tested.
                  
                  test = 'testIndFisher',   
                  ncores = 1)

## ---- warning = FALSE, message = FALSE-----------------------------------
BIC_results <- as.data.frame(mmpc_GridSearch$bic)
head(BIC_results, 4)

# We can retrieve the indices of the minimum BIC values:
which(BIC_results == min(BIC_results), arr.ind = TRUE)

## ---- warning = FALSE, message = FALSE-----------------------------------
size_of_signature_results <- as.data.frame(mmpc_GridSearch$size)
head(size_of_signature_results, 4)

# We can retrieve the indices of the maximum subset:
which(size_of_signature_results == max(size_of_signature_results), arr.ind = TRUE)

## ---- warning = FALSE, message = FALSE-----------------------------------
head(mmpc_GridSearch$variables, 4)


## ---- warning = FALSE, message = FALSE-----------------------------------
summary(mmpc_object_wine_NonFlav)

## ---- warning = FALSE, message = FALSE-----------------------------------
mmpc_object_wine_NonFlav@selectedVarsOrder

# The signature should include the variables with indices 7, 4, 5

## ---- warning = FALSE, message = FALSE-----------------------------------
colnames(wine_dataset)[7]
colnames(wine_dataset)[4]
colnames(wine_dataset)[5]

## ---- warning = FALSE, message = FALSE-----------------------------------

# MODEL ESTIMATES USING MMPC'S FEATURE SUBSET AS PrEDICTORs 

mmpc_model_wine_NonFlav<- mmpc.model(
                                   target = target_NonFlav, 
                                   dataset = wine_dataset,
                                   wei = NULL, 
                                   mmpcObject = mmpc_object_wine_NonFlav, 
                                   test = 'testIndFisher')


summary(mmpc_model_wine_NonFlav) ; 
mmpc_model_wine_NonFlav$ypografi

## ---- warning = FALSE, message = FALSE-----------------------------------
mmpc_model_wine_NonFlav$mod

## ---- warning = FALSE, message = FALSE-----------------------------------
sessionInfo()


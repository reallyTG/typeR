library(CBDA)


### Name: CBDA
### Title: Main Compressive Big Data Analytics - CBDA function
### Aliases: CBDA

### ** Examples

# Installation
# Please upload the Windows binary and/or source CBDA_1.0.0 files from
# the CBDA Github repository https://github.com/SOCR/CBDA/releases
## Not run: 
##D # Installation from the Windows binary (recommended for Windows systems)
##D install.packages("/filepath/CBDA_1.0.0_binary_Windows.zip", repos = NULL, type = "win.binary")
##D 
##D # Installation from the source (recommended for Macs and Linux systems)
##D install.packages("/filepath/CBDA_1.0.0_source_.tar.gz", repos = NULL, type = "source")
##D 
##D # Initialization
##D # This function call installs (if needed) and attaches all the necessary packages to run
##D # the CBDA package v1.0.0. It should be run before any production run or test.
##D # The output shows a table where for each package a TRUE or FALSE is displayed.
##D # Thus the necessary steps can be pursued in case some package has a FALSE.
##D CBDA_initialization()
##D 
##D # Set the specs for the synthetic dataset to be tested
##D n = 300          # number of observations
##D p = 100          # number of variables
##D 
##D # Generate a nxp matrix of IID variables (e.g., ~N(0,1))
##D X1 = matrix(rnorm(n*p), nrow=n, ncol=p)
##D 
##D # Setting the nonzero variables - signal variables
##D nonzero=c(1,100,200,300,400,500,600,700,800,900)
##D 
##D # Set the signal amplitude (for noise level = 1)
##D amplitude = 10
##D 
##D # Allocate the nonzero coefficients in the correct places
##D beta = amplitude * (1:p %in% nonzero)
##D 
##D # Generate a linear model with a bias (e.g., white  noise ~N(0,1))
##D ztemp <- function() X1 %*% beta + rnorm(n)
##D z = ztemp()
##D 
##D # Pass it through an inv-logit function to
##D # generate the Bernoulli response variable Ytemp
##D pr = 1/(1+exp(-z))
##D Ytemp = rbinom(n,1,pr)
##D X2 <- cbind(Ytemp,X1)
##D 
##D dataset_file ="Binomial_dataset_3.txt"
##D 
##D # Save the synthetic dataset
##D a <- tempdir()
##D write.table(X2, file = paste0(file.path(a),'/',dataset_file), sep=",")
##D 
##D # The file is now stored in the directory a
##D a
##D list.files(a)
##D 
##D # Load the Synthetic dataset
##D Data = read.csv(paste0(file.path(a),'/',dataset_file),header = TRUE)
##D Ytemp <- Data[,1] # set the outcome
##D original_names_Data <- names(Data)
##D cols_to_eliminate=1
##D Xtemp <- Data[-cols_to_eliminate] # set the matrix X of features/covariates
##D original_names_Xtemp <- names(Xtemp)
##D 
##D # Add more wrappers/algorithms to the SuperLearner ensemble predictor
##D # It can be commented out if only the default set of algorithms are used,
##D # e.g., algorithm_list = c("SL.glm","SL.xgboost","SL.glmnet","SL.svm",
##D #                          "SL.randomForest","SL.bartMachine")
##D # This defines a "new" wrapper, based on the default SL.glmnet
##D  SL.glmnet.0.75 <- function(..., alpha = 0.75,family="binomial"){
##D                  SL.glmnet(..., alpha = alpha, family = family)}
##D 
##D  test_example <- c("SL.glmnet","SL.glmnet.0.75")
##D 
##D # Call the Main CBDA function
##D # Multicore functionality NOT enabled
##D CBDA_object <- CBDA(Ytemp , Xtemp , M = 12 , Nrow_min = 50, Nrow_max = 70,
##D               top = 10, max_covs = 8 , min_covs = 3,algorithm_list = test_example ,
##D               workspace_directory = a)
##D 
##D # Multicore functionality enabled
##D test_example <- c("SL.xgboost","SL.svm")
##D CBDA_test <- CBDA(Ytemp , Xtemp , M = 40 , Nrow_min = 50, Nrow_max = 70,
##D                N_cores = 2 , top = 30, max_covs = 20 ,
##D                 min_covs = 5 , algorithm_list = test_example ,
##D               workspace_directory = a)
##D                 
## End(Not run)





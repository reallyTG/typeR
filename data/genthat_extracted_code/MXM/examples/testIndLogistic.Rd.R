library(MXM)


### Name: Conditional independence test for binary, categorical or ordinal data
### Title: Conditional independence test for binary, categorical or ordinal
###   class variables
### Aliases: testIndLogistic testIndMultinom testIndOrdinal testIndQBinom
###   permLogistic permMultinom permOrdinal waldLogistic waldQBinom
###   waldOrdinal
### Keywords: Binary logistic regression Multinomial logistic regression
###   Ordinal logistic regression Conditional independence test

### ** Examples

#require(nnet)
#require(ordinal)

#simulate a dataset with categorical data 
dataset_m <- matrix( sample(c(0, 1, 2), 50 * 100, replace = TRUE), ncol = 50)
#initialize categorical target
target_m <- dataset_m[, 50]
#remove target from the dataset
dataset_m <- dataset_m[, -50]

  #run the conditional independence test for the nominal class variable
  results_m <- testIndMultinom(target_m, dataset_m, xIndex = 44, csIndex = c(10, 20) )
  results_m

  #run the SES algorithm using the testIndLogistic conditional independence test 
  #for the nominal class variable
  sesObject <- SES(as.factor(target_m), dataset_m, max_k = 3, threshold = 0.05, 
  test = "testIndMultinom");
  #print summary of the SES output
  summary(sesObject);
  # plot the SES output
  # plot(sesObject, mode = "all");


########################################################################
  #run the conditional independence test for the ordinal class variable
  results_o <- testIndOrdinal( factor(target_m, ordered = TRUE), dataset_m, 
  xIndex = 44, csIndex = c(10, 20) )
  results_o
  
  #run the SES algorithm using the testIndLogistic conditional independence test 
  #for the ordinal class variable
  sesObject <- SES(factor(target_m, ordered=TRUE), dataset_m, max_k = 3 , 
  threshold = 0.05, test = "testIndOrdinal");
  #print summary of the SES output
  summary(sesObject);
  # plot the SES output
  # plot(sesObject, mode = "all");


########################################################################

#simulate a dataset with binary data
dataset_b <- matrix(sample(c(0,1),50 * 60, replace = TRUE), ncol = 50)
#initialize binary target
target_b <- dataset_b[, 50]
#remove target from the dataset
dataset_b <- dataset_b[, -50]

  #run the conditional independence test for the binary class variable
  results_b <- testIndLogistic( target_b, dataset_b, xIndex = 44, csIndex = c(10, 20) )
  results_b
  
  #run the SES algorithm using the testIndLogistic conditional independence test
  #for the binary class variable
  sesObject <- SES(target_b, dataset_b, max_k = 3, threshold = 0.05, 
  test = "testIndLogistic");
  #print summary of the SES output
  summary(sesObject);




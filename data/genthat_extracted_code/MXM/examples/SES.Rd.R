library(MXM)


### Name: Constraint based feature selection algorithms
### Title: SES: Feature selection algorithm for identifying multiple
###   minimal, statistically-equivalent and equally-predictive feature
###   signatures MMPC: Feature selection algorithm for identifying minimal
###   feature subsets
### Aliases: SES MMPC wald.ses wald.mmpc perm.ses perm.mmpc
### Keywords: SES Multiple Feature Signatures Feature Selection Variable
###   Selection

### ** Examples

set.seed(123)

#simulate a dataset with continuous data
dataset <- matrix(runif(1000 * 200, 1, 100), ncol = 200)

#define a simulated class variable 
target <- 3 * dataset[, 10] + 2 * dataset[, 100] + 3 * dataset[, 20] + rnorm(1000, 0, 5)

# define some simulated equivalences
dataset[, 15] <- dataset[, 10] + rnorm(1000, 0, 2)
dataset[, 150] <- dataset[, 100] + rnorm(1000, 0, 2) 
dataset[, 130] <- dataset[, 100] + rnorm(1000, 0, 2)

# run the SES algorithm
sesObject <- SES(target , dataset, max_k = 5, threshold = 0.05, test = "testIndFisher", 
hash = TRUE, hashObject = NULL);

# print summary of the SES output
summary(sesObject);
# plot the SES output
# plot(sesObject, mode = "all");
# get the queues with the equivalences for each selected variable
sesObject@queues
#get the generated signatures
sesObject@signatures;

# re-run the SES algorithm with the same or different configuration 
# under the hash-based implementation of retrieving the statistics
# in the SAME dataset (!important)
hashObj <- sesObject@hashObject;
sesObject2 <- SES(target, dataset, max_k = 2, threshold = 0.01, test = "testIndFisher", 
hash = TRUE, hashObject = hashObj);

sesObject3 <- SES(target, dataset, max_k = 2, threshold = 0.01, test = "testIndFisher", 
ini = sesObject@univ, hash = TRUE, hashObject = hashObj);

# retrieve the results: summary, plot, sesObject2@...)
summary(sesObject2)
# get the run time
sesObject@runtime;
sesObject2@runtime;
sesObject3@runtime;


# MMPC algorithm 
mmpcObject <- MMPC(target, dataset, max_k = 3, threshold = 0.05, test="testIndFisher");
mmpcObject@selectedVars
mmpcObject@runtime




library(SparseMDC)


### Name: sdc_mpar
### Title: SparseDC Multi Parallel
### Aliases: sdc_mpar

### ** Examples

set.seed(10)
# Select small dataset for example
data_test <- data_biase[1:100,]
# Split data into condition A and B
data_A <- data_test[ , which(condition_biase == "A")]
data_B <- data_test[ , which(condition_biase == "B")]
data_C <- data_test[ , which(condition_biase == "C")]
# Store data as list
dat_l <- list(data_A, data_B, data_C)
# Pre-process the data
pdat <- pre_proc_data(dat_l, dim=3, norm = FALSE, log = TRUE,
center = TRUE)
# Calculate lambda1
lambda1 <- lambda1_calculator(pdat, dim = 3, nclust = 3)
# Calcualte lambda2
lambda2 <- lambda2_calculator(pdat, dim = 3, nclust = 3, lambda1 = lambda1)
# Prepare parallel enviornment
library(doParallel) # Load package
library(foreach)  # Load the package
library(doRNG)
# Apply SparseMDC
smdc_res <- sdc_mpar(pdat, nclust = 3, dim = 3, lambda1 = lambda1,
lambda2 = lambda2, par_starts = 2, cores = 2)




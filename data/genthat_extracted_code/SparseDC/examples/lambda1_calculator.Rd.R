library(SparseDC)


### Name: lambda1_calculator
### Title: Lambda 1 Calculator.
### Aliases: lambda1_calculator

### ** Examples

set.seed(10)
# Select small dataset for example
data_test <- data_biase[1:100,]
# Split data into conditions A and B
data_A <- data_test[ , which(condition_biase == "A")]
data_B <- data_test[ , which(condition_biase == "B")]
# Pre-process the data
pre_data <- pre_proc_data(data_A, data_B, norm = FALSE, log = TRUE,
center = TRUE)
# Calculate the lambda 1 value
lambda1_calculator(pdat1 = pre_data[[1]], pdat2 = pre_data[[2]], ncluster=3,
 alpha1 = 0.5, nboot1 = 1000)

# Can also run

# Pre-process the data
pre_data <- pre_proc_data(data_A, data_B, norm = FALSE, log = TRUE,
center = TRUE)
pdata_A <- pre_data[[1]]
pdata_B <- pre_data[[2]]
# Calculate the lambda 1 value
lambda1_calculator(pdat1 = pdata_A, pdat2 = pdata_B , ncluster=3,
 alpha1 = 0.5, nboot1 = 1000)





library(SparseMDC)


### Name: lambda1_calculator
### Title: Lambda 1 Calcualtor
### Aliases: lambda1_calculator

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
lambda1 <- lambda1_calculator(pdat, dim = 3, nclust = 3 )





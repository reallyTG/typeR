library(COSINE)


### Name: diff_gen
### Title: Calculate the F-statistics and ECF-statistics
### Aliases: diff_gen

### ** Examples


#Load two of the simualted datasets

data(simulated_data)

set1_data <- simulated_data[[1]]
control_data <- simulated_data[[7]]

#Compute the F-statistics and ECF-statistics for the first 10 genes

diff_gen_test <- diff_gen(set1_data[,1:10],control_data[,1:10])





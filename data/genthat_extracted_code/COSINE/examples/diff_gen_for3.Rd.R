library(COSINE)


### Name: diff_gen_for3
### Title: Generate the F-statistics and ECF-statistics for the comparison
###   of three datasets
### Aliases: diff_gen_for3

### ** Examples


#Load the simulated datasets

data(simulated_data)

set1_data<-simulated_data[[1]]

set2_data<-simulated_data[[2]]

control_data<-simulated_data[[7]]

#Calculate the F-statistics and ECF-statistics 
#for the first five genes

diff_gen_for3_test <- diff_gen_for3(set1_data[,1:5],
set2_data[,1:5],control_data[,1:5])





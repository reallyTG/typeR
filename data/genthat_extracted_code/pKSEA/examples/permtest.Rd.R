library(pKSEA)


### Name: permtest
### Title: Perform permutation test
### Aliases: permtest
### Keywords: internal

### ** Examples

#Read in example summary statistics dataset from csv
summarydata_ex <- read.csv(system.file("extdata", "example_data1.csv", package="pKSEA"))

#Get matched data using predictions from NetworKIN
matched_data_ex <- get_matched_data(summarydata_ex, NetworKINPred_db)

#Calculate contributions
calc_ex <- calc_contribution(matched_data_ex)

#Perform 5 permutations
perm_ex <- permtest(calc_ex, perms= 5, seed= 123)




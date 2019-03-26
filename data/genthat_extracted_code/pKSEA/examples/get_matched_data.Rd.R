library(pKSEA)


### Name: get_matched_data
### Title: Filtering data to matched predictions
### Aliases: get_matched_data

### ** Examples

#Read in example summary statistics dataset from csv
summarydata_ex <- read.csv(system.file("extdata", "example_data1.csv", package="pKSEA"))

#Get matched data using predictions from NetworKIN
matched_data_ex <- get_matched_data(summarydata_ex, NetworKINPred_db)




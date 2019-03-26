library(pKSEA)


### Name: calc_contribution
### Title: Calculate score contributions by phosphorylation site
### Aliases: calc_contribution
### Keywords: internal

### ** Examples

#Read in example summary statistics dataset from csv
summarydata_ex <- read.csv(system.file("extdata", "example_data1.csv", package="pKSEA"))

#Get matched data using predictions from NetworKIN
matched_data_ex <- get_matched_data(summarydata_ex, NetworKINPred_db)

#Calculate contributions
calc_ex <- calc_contribution(matched_data_ex)




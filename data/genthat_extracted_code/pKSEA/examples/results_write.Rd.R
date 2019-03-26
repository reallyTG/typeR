library(pKSEA)


### Name: results_write
### Title: Output writing of pKSEA compare() results
### Aliases: results_write
### Keywords: internal

### ** Examples

#Read in example summary statistics dataset from csv
summarydata_ex <- read.csv(system.file("extdata", "example_data1.csv", package="pKSEA"))

#Get matched data using predictions from NetworKIN
matched_data_ex <- get_matched_data(summarydata_ex, NetworKINPred_db)

#Perform single run of pKSEA analysis
single_run_results_ex <- run_on_matched(matched_data_ex, n_permutations = 10)

#Export results to R session temporary directory
## Not run: 
##D results_write(single_run_results_ex, outputpath= tempdir(), outputname= "example")
## End(Not run)




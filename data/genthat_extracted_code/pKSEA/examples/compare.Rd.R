library(pKSEA)


### Name: compare
### Title: Running analysis runs on known substrates, predicted substrates,
###   and both.
### Aliases: compare

### ** Examples

#Read in example summary statistics dataset from csv
summarydata_ex <- read.csv(system.file("extdata", "example_data1.csv", package="pKSEA"))

#Get matched data using predictions from NetworKIN
matched_data_ex <- get_matched_data(summarydata_ex, NetworKINPred_db)

#Perform comparative analysis using provided KSEAdb as filter
## Not run: 
##D compare_results_ex <- compare(matched_data_ex, kseadb = KSEAdb, n_permutations = 10)
## End(Not run)




library(diveRsity)


### Name: diffCalc
### Title: A faster function for calculating genetic differentiation
###   statistics
### Aliases: diffCalc

### ** Examples

## Not run: 
##D # simply use the following format to run the function
##D library(diveRsity)
##D data(Test_data)
##D Test_data[is.na(Test_data)] <- ""
##D 
##D test_result <- diffCalc(infile = Test_data, outfile = "myresults",
##D                         fst = TRUE, pairwise = TRUE, bs_locus = TRUE,
##D                         bs_pairwise = TRUE, boots = 1000, para = TRUE)
## End(Not run)




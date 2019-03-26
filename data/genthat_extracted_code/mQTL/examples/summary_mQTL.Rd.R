library(mQTL)


### Name: summary_mQTL
### Title: Function to summarize the results of a all the runs and their
###   differences
### Aliases: summary_mQTL
### Keywords: methods

### ** Examples

  ## Not run: 
##D 
##D ## Pre-process data 
##D 
##D     infile<-"ReducedData.dat" ## Reduced data by SRV
##D     cleangen<-"CleanGenoFile.dat" ## Genotype data file in csvs format
##D     nperm <- 0 ## Number of permutations
##D     MQTL_results<-process_mQTL(infile, cleangen, nperm))
##D     
##D     T=10 ## LOD threshold
##D     summary_mQTL(results,T=8)## summarizes mQTL results in a table
##D 
## End(Not run)




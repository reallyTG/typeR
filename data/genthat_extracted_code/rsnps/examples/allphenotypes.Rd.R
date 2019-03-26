library(rsnps)


### Name: allphenotypes
### Title: Get all openSNP phenotypes, their variations, and how many users
###   have data available for a given phenotype.
### Aliases: allphenotypes

### ** Examples

## Not run: 
##D # Get all data
##D allphenotypes(df = TRUE)
##D 
##D # Output a list, then call the characterisitc of interest by 'id' or
##D # 'characteristic'
##D datalist <- allphenotypes()
##D names(datalist) # get list of all characteristics you can call
##D datalist[["ADHD"]] # get data.frame for 'ADHD'
##D datalist[c("mouth size","SAT Writing")] # get data.frame for 'ADHD'
## End(Not run)




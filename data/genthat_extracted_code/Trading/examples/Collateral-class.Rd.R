library(Trading)


### Name: Collateral-class
### Title: Collateral Class
### Aliases: Collateral

### ** Examples



colls = list()
coll_raw = read.csv(system.file("extdata", "coll.csv", package = "Trading"),header=TRUE,
stringsAsFactors = FALSE)

for(i in 1:nrow(coll_raw))
{
 colls[[i]] = Collateral()
 colls[[i]]$PopulateViaCSV(coll_raw[i,])
}




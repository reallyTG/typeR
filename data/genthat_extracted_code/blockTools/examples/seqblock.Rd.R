library(blockTools)


### Name: seqblock
### Title: Sequential assignment of unit(s) into experimental conditions
###   using covariates
### Aliases: seqblock

### ** Examples

## Assign first unit (assume a 25 year old member of the Republican Party) to a treatment group.
## Save the results in file "sdata.RData":
## seqblock(query = FALSE, id.vars = "ID", id.vals = 001, exact.vars = "party", 
##   exact.vals = "Republican", covar.vars = "age", covar.vals = 25, file.name = "sdata.RData")

## Assign next unit (age 30, Democratic Party):
## seqblock(query = FALSE, object = "sdata.RData", id.vals = 002, exact.vals = "Democrat", 
##   covar.vars = "age", covar.vals = 30, file.name = "sdata.RData")




library(R2MLwiN)


### Name: wage1
### Title: Simulated dataset of office workers' salary and other employment
###   details.
### Aliases: wage1
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data(wage1, package = "R2MLwiN")
##D 
##D (mymodel <- runMLwiN(logearn ~ 1 + age_40 + numjobs + (1 | company) + (1 | id), 
##D   estoptions = list(EstM = 1, 
##D   mm = list(list(mmvar = list("company", "company2", "company3", "company4"),
##D   weights = list("weight1", "weight2", "weight3", "weight4")), NA)),
##D   data = wage1))
##D 
## End(Not run)




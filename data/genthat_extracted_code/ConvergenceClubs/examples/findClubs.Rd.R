library(ConvergenceClubs)


### Name: findClubs
### Title: Finds convergence clubs
### Aliases: findClubs

### ** Examples

data("filteredGDP")

## Not run: 
##D # Cluster Countries using GDP from year 1970 to year 2003
##D clubs <- findClubs(filteredGDP,  dataCols=2:35, unit_names = 1, refCol=35,
##D                    time_trim = 1/3, cstar = 0, HACmethod = "AQSB")
## End(Not run)

clubs <- findClubs(filteredGDP, dataCols=2:35, unit_names = 1, refCol=35,
                   time_trim = 1/3, cstar = 0, HACmethod = "FQSB")
summary(clubs)






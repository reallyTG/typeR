library(gimme)


### Name: gimmeSEM
### Title: Group iterative multiple model estimation.
### Aliases: gimmeSEM gimme
### Keywords: gimmeSEM

### ** Examples

 ## Not run: 
##D paths <- 'V2 ~ V1
##D           V3 ~ V4lag'
##D 
##D fit <- gimmeSEM(data     = simData,
##D                 out      = "C:/simData_out",
##D                 subgroup = TRUE, 
##D                 paths    = paths)
##D 
##D print(fit, mean = TRUE)
##D print(fit, subgroup = 1, mean = TRUE)
##D print(fit, file = "group_1_1", estimates = TRUE)
##D print(fit, subgroup = 2, fitMeasures = TRUE)
##D plot(fit, file = "group_1_1")
##D  
## End(Not run)




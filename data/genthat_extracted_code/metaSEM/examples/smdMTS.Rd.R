library(metaSEM)


### Name: smdMTS
### Title: Compute Effect Sizes for Multiple Treatment Studies
### Aliases: smdMTS
### Keywords: meta-analysis

### ** Examples

## Not run: 
##D   
##D ## Sample means for groups 1 to 3
##D m <- c(5,7,9)
##D 
##D ## Sample variances
##D v <- c(10,11,12)
##D 
##D ## Sample sizes
##D n <- c(50,52,53)
##D 
##D ## Assuming homogeneity of variances
##D smdMTS(m, v, n, homogeneity = "var", bias.adjust=TRUE, all.comparisons=FALSE,
##D        lavaan.output=FALSE)
##D 
##D ## Not assuming homogeneity of variances and comparing all pairwise groups
##D ## Please note that the SD of the first group is used as the standardizer    
##D smdMTS(m, v, n, homogeneity = "none", bias.adjust=TRUE, all.comparisons=TRUE,
##D        lavaan.output=FALSE)
##D 
##D ## Output the fitted lavaan model
##D ## It provides a likelihood ratio test to test the null hypothesis of
##D ## homogeneity of variances.    
##D fit <- smdMTS(m, v, n, homogeneity = "var", bias.adjust=FALSE, all.comparisons=FALSE,
##D               lavaan.output=TRUE)
##D 
##D lavaan::summary(fit)
##D     
##D lavaan::parameterestimates(fit)
## End(Not run)




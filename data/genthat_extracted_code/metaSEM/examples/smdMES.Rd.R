library(metaSEM)


### Name: smdMES
### Title: Compute Effect Sizes for Multiple End-point Studies
### Aliases: smdMES
### Keywords: meta-analysis

### ** Examples

## Not run: 
##D     
##D ## Sample means for the two constructs in Group 1  
##D m1 <- c(2.5, 4.5)
##D 
##D ## Sample means for the two constructs in Group 2     
##D m2 <- c(3, 5)
##D 
##D ## Sample covariance matrix in Group 1    
##D V1 <- matrix(c(3,2,2,3), ncol=2)
##D 
##D ## Sample covariance matrix in Group 2
##D V2 <- matrix(c(3.5,2.1,2.1,3.5), ncol=2)
##D 
##D ## Sample size in Group 1
##D n1 <- 20
##D 
##D ## Sample size in Group 2    
##D n2 <- 25
##D 
##D ## SMD with the assumption of homogeneity of covariance matrix    
##D smdMES(m1, m2, V1, V2, n1, n2, homogeneity="cov", bias.adjust=TRUE,
##D        lavaan.output=FALSE)
##D 
##D ## SMD with the assumption of homogeneity of correlation matrix 
##D smdMES(m1, m2, V1, V2, n1, n2, homogeneity="cor", bias.adjust=TRUE,
##D        lavaan.output=FALSE)
##D 
##D ## SMD without any assumption of homogeneity
##D smdMES(m1, m2, V1, V2, n1, n2, homogeneity="none", bias.adjust=TRUE,
##D        lavaan.output=FALSE)
##D 
##D ## Output the fitted lavaan model
##D ## It provides a likelihood ratio test to test the null hypothesis of
##D ## homogeneity of variances.     
##D fit <- smdMES(m1, m2, V1, V2, n1, n2, homogeneity="cov", bias.adjust=TRUE,
##D               lavaan.output=TRUE)
##D 
##D lavaan::summary(fit)
##D 
##D lavaan::parameterestimates(fit)
## End(Not run)




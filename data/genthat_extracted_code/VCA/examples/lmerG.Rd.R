library(VCA)


### Name: lmerG
### Title: Construct Variance-Covariance Matrix of Random Effects for
###   Models Fitted by Function 'lmer'.
### Aliases: lmerG

### ** Examples

## Not run: 
##D data(Orthodont)
##D Ortho <- Orthodont
##D Ortho$age2 <- Ortho$age - 11
##D Ortho$Subject <- factor(as.character(Ortho$Subject))
##D fit <-lmer(distance~Sex+Sex:age2+(age2|Subject), Ortho) 
##D G1 <- VCA:::lmerG(fit, cov=FALSE)
##D G2 <- VCA:::lmerG(fit, cov=TRUE)
##D G1[1:10,1:10]
##D G2[1:10,1:10]
## End(Not run)




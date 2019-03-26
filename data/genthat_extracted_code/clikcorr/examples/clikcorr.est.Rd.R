library(clikcorr)


### Name: est
### Title: censoring data and likelihood-based correlation estimation
### Aliases: est

### ** Examples


data(ND)
logND <- log(ND)
logND1 <- logND[51:90,]

est(logND1, "t1_OCDD", "t2_OCDD", "t1_HxCDF_234678", "t2_HxCDF_234678")

## Not run: 
##D est(logND, "t1_TCDD", "t2_TCDD", "t1_PeCDD", "t2_PeCDD")
##D 
##D est(logND, "t1_TCDD", "t2_TCDD", "t1_PeCDD", "t2_PeCDD", dist="t",
##D  nlm=TRUE)
## End(Not run)




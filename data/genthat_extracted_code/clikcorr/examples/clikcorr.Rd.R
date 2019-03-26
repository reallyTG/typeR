library(clikcorr)


### Name: clikcorr
### Title: Censoring data and LIKelihood-based CORRelation estimation and
###   inference
### Aliases: clikcorr clikcorr.default print.clikcorr summary.clikcorr

### ** Examples


data(ND)
logND <- log(ND)
logND1 <- logND[51:90,]

obj <- clikcorr(logND1, "t1_OCDD", "t2_OCDD", "t1_HxCDF_234678", "t2_HxCDF_234678")

## Not run: 
##D clikcorr(logND, "t1_OCDD", "t2_OCDD", "t1_HxCDF_234678", "t2_HxCDF_234678")
##D 
##D clikcorr(logND, "t1_OCDD", "t2_OCDD", "t1_HxCDF_234678", "t2_HxCDF_234678",
##D  nlm=TRUE)
##D 
##D clikcorr(logND, "t1_OCDD", "t2_OCDD", "t1_HxCDF_234678", "t2_HxCDF_234678",
##D  method="BFGS")
##D 
##D clikcorr(logND, "t1_OCDD", "t2_OCDD", "t1_HxCDF_234678", "t2_HxCDF_234678",
##D  sv=c(5,-0.5,0.6,0.5,0.6))
##D 
##D clikcorr(logND, "t1_OCDD", "t2_OCDD", "t1_HxCDF_234678", "t2_HxCDF_234678",
##D  dist="t", df=10, nlm=TRUE)
## End(Not run)

print(obj)
summary(obj)





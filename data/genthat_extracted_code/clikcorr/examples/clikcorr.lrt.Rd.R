library(clikcorr)


### Name: lrt
### Title: censoring data and likelihood-based correlation estimation
###   inference
### Aliases: lrt

### ** Examples


data(ND)
logND <- log(ND)

lrt(logND, "t1_TCDD", "t2_TCDD", "t1_PeCDD", "t2_PeCDD")

## Not run: 
##D lrt(logND, "t1_TCDD", "t2_TCDD", "t1_PeCDD", "t2_PeCDD", dist="t")
## End(Not run)




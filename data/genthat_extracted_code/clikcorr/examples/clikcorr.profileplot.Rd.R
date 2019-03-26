library(clikcorr)


### Name: plot.clikcorr
### Title: Graphical function for visualizing bivariate profile likelihood.
### Aliases: plot.clikcorr

### ** Examples


data(ND)
logND <- log(ND)
logND1 <- logND[51:90,]

obj <- clikcorr(logND1, "t1_OCDD", "t2_OCDD", "t1_HxCDF_234678", "t2_HxCDF_234678")
plot(obj, type="o")

## Not run: 
##D obj <- clikcorr(logND, "t1_OCDD", "t2_OCDD", "t1_HxCDF_234678", "t2_HxCDF_234678")
##D plot(obj, type="o", col="blue", lwd=1)
## End(Not run)




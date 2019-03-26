library(rddtools)


### Name: vcovCluster
### Title: Cluster Heteroskedasticity-consistent estimation of the
###   covariance matrix.
### Aliases: vcovCluster vcovCluster2

### ** Examples

data(STAR_MHE)
if(all(c(require(sandwich), require(lmtest)))){

# Run simple regression:
reg_krug <- lm(pscore~cs, data=STAR_MHE)

# Row 1 of Table 8.2.1, inference with standard vcovHC:
coeftest(reg_krug,vcov.=vcovHC(reg_krug, 'HC1'))[2,2]

# Row 4 of Table 8.2.1, inference with cluster vcovHC:
coeftest(reg_krug,vcov.=vcovCluster(reg_krug, clusterVar=STAR_MHE$classid))[2,2]
}




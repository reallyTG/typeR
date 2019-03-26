library(xpose4)


### Name: absval.wres.vs.cov.bw
### Title: Absolute weighted residuals vs covariates for Xpose 4
### Aliases: absval.wres.vs.cov.bw
### Keywords: methods

### ** Examples


## Not run: 
##D ## We expect to find the required NONMEM run and table files for run
##D ## 5 in the current working directory
##D xpdb5 <- xpose.data(5)
##D 
##D ## Here we load the example xpose database 
##D data(simpraz.xpdb)
##D xpdb <- simpraz.xpdb
##D 
##D ## A vanilla plot
##D absval.wres.vs.cov.bw(xpdb)
##D 
##D ## A custom plot
##D absval.wres.vs.cov.bw(xpdb, bwdotcol="white", 
##D   bwdotpch=15,
##D   bwreccol="red",
##D   bwrecfill="red",
##D   bwumbcol="red",
##D   bwoutpch=5,
##D   bwoutcol="black")
##D 
##D ## A vanilla plot using IWRES
##D absval.iwres.vs.cov.bw(xpdb)
## End(Not run)





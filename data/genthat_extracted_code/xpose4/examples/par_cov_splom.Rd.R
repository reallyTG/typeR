library(xpose4)


### Name: cov.splom
### Title: Plot scatterplot matrices of parameters, random parameters or
###   covariates
### Aliases: cov.splom par_cov_splom parm.splom ranpar.splom

### ** Examples


## Here we load the example xpose database 
xpdb <- simpraz.xpdb

## A scatterplot matrix of parameters, grouped by sex
parm.splom(xpdb, groups="SEX")

## A scatterplot matrix of ETAs, grouped by sex
ranpar.splom(xpdb, groups="SEX")

## Covariate scatterplots, with text customization
cov.splom(xpdb, varname.cex=0.4, axis.text.cex=0.4, smooth=NULL, cex=0.4)





library(RandomFields)


### Name: Trend Modelling
### Title: Trend Modelling
### Aliases: RMmodelsTrend 'trend modelling'
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample();if (!interactive()) RFoptions(modus="careless")
## End(Don't show) 
require(geoR)

data(ca20) ## data set from geoR
ca20.df <- as.data.frame(ca20)
head(ca20.df)
RFoptions(coordnames=c("east", "north"), varnames="data") 

## covariance model with variance, scale and nugget to be estimated;
## just to abbreviate later on
M <- RMexp(var=NA, scale=NA) + RMnugget(var=NA)
## Don't show: 
if (!interactive()) M <- RMexp(var=NA, scale=NA)
## End(Don't show) 

## short definition of a trend using the fact that ca20.df is a
## data.frame
ca20.RFmod02 <- ~ 1 + altitude + M
(ca20.fit02.RF <- RFfit(ca20.RFmod02, data=ca20.df, M=M))

## long definition which also allows for more general constructions
ca20.RFmod02 <- NA + NA*RMcovariate(ca20.df$altitude) + M 
(ca20.fit02.RF <- RFfit(ca20.RFmod02, data=ca20.df))


## Note that the following also works.
## Here, the covariance model must be the first summand
ca20.RFmod02 <- M + NA + ca20.df$altitude 
print(ca20.fit02.RF <- RFfit(ca20.RFmod02, data=ca20.df))

### The following does NOT work, as R assumes (NA + ca20.df$altitude) + M
### In particular, the model definition gives a warning, and the
### RFfit call gives an error: 
(ca20.RFmod02 <- NA + ca20.df$altitude + M) 
try(ca20.fit02.RF <- RFfit(ca20.RFmod02, data=ca20.df)) ### error ...

## factors:
ca20.RFmod03 <- ~ 1 + area + M ### 
(ca20.fit03.RF <- RFfit(ca20.RFmod03, data=ca20.df, M=M))

## Don't show: 
FinalizeExample(); RFoptions(coordnames=NULL, varnames=NULL)
## End(Don't show)




library(RMRAINGEN)


### Name: generate.YuleWalkerCoefficientBlockmatrices
### Title: generate
### Aliases: generate generate.CCGammaObject
###   generate.CCGammaObjectListPerEachMonth
###   generate.YuleWalkerCoefficientBlockmatrices
###   generate.YuleWalkerCoefficientBlockmatricesPerEachMonth

### ** Examples

library(RMRAINGEN)

set.seed(125)
data(trentino)

year_min <- 1961
year_max <- 1990

period <- PRECIPITATION$year>=year_min & PRECIPITATION$year<=year_max
station <- names(PRECIPITATION)[!(names(PRECIPITATION) %in% c("day","month","year"))]
prec_mes <- PRECIPITATION[period,station]

## removing nonworking stations (e.g. time series with NA)
accepted <- array(TRUE,length(names(prec_mes)))
names(accepted) <- names(prec_mes)
for (it in names(prec_mes)) {
		 accepted[it]  <- (length(which(!is.na(prec_mes[,it])))==length(prec_mes[,it]))
}

prec_mes <- prec_mes[,accepted]
## the dateset is reduced!!!
prec_mes <- prec_mes[,1:2]

## Not Run in the examples, uncomment to run the following lines
# coeff <- CoeffYWeq(data=prec_mes,p=1,tolerance=0.001)

# generation <- generate(coeff,n=10,names=names(prec_mes))


## Not Run in the examples, uncomment to run the following lines
# origin <- paste(year_min,1,1,sep="-")


# coeff_monthly <- CoeffYWeq(data=prec_mes,p=1,tolerance=0.001,sample="monthly",origin=origin)


# generation_monthly <- generate(coeff_monthly,year_min=year_min,year_max=year_max,
#					names=names(prec_mes))


###  generation with CCGammaObject

# CCGamma <- CCGamma(data=prec_mes,lag=0,tolerance=0.001,only.matrix=FALSE)

# generation_CCGamma <- generate(x=CCGamma,n=100,names=names(prec_mes))

# CCGamma_monthly <- CCGamma(data=prec_mes,lag=0,tolerance=0.001,only.matrix=FALSE,
#                            sample="monthly",origin=origin)
## generation_CCGamma <- generate(x=CCGamma_monthly,year_min=year_min,year_max=year_max,
##                                names=names(prec_mes))




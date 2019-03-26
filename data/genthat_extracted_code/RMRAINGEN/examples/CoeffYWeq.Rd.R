library(RMRAINGEN)


### Name: CoeffYWeq
### Title: This function calculates ...
### Aliases: CoeffYWeq

### ** Examples

library(RMRAINGEN)


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

# ## Not Run in the examples, uncomment to run the following line
# coeff <- CoeffYWeq(data=prec_mes,p=1,tolerance=0.001)

#
#
# Alternatively the coefficients of Vector Auto-Regressive Model
# can be separately calculated for each month

# ## Not Run in the examples, uncomment to run the following line
#origin <- paste(year_min,1,1,sep="-")
#
#

#coeff_monthly <- CoeffYWeq(data=prec_mes,p=1,tolerance=0.001,sample="monthly",origin=origin)




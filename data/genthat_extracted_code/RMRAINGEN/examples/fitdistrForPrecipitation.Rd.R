library(RMRAINGEN)


### Name: fitdistrForPrecipitation
### Title: This function calculates the parameters of a parametric
###   probability distribution by fitting daily precipitation data for each
###   station and each month. It is a wrapper function for 'fitdistr'
### Aliases: fitdistrForPrecipitation

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
prec_mes <- prec_mes[,1:3]

fit  <- fitdistrForPrecipitation(data=prec_mes,dname="exp",start=NULL,sample=NULL)

origin <- paste(year_min,1,1,sep="-")


fit_monthly  <- fitdistrForPrecipitation(data=prec_mes,dname="exp",
					start=NULL,sample="monthly",origin=origin)
fit_monthly_gamma  <- fitdistrForPrecipitation(data=prec_mes,dname="gamma",
						 start=NULL,sample="monthly",origin=origin)




library(RMAWGEN)


### Name: continuity_ratio
### Title: Calculates the continuity ratio of a set of precipitation
###   measured or generated data in several sites as defined by Wilks, 1998
###   (see reference link)
### Aliases: continuity_ratio

### ** Examples


data(trentino)

year_min <- 1961
year_max <- 1990
origin <- paste(year_min,1,1,sep="-")

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

continuity_ratio <-continuity_ratio(data=prec_mes,lag=0,valmin=0.5)
continuity_ratio1 <-continuity_ratio(data=prec_mes,lag=-1,valmin=0.5)






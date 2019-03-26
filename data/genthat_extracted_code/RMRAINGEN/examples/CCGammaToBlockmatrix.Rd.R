library(RMRAINGEN)


### Name: CCGammaToBlockmatrix
### Title: This return a 'blockmatrix' object containing the gaussian
###   cross-correlation matrices.
### Aliases: CCGammaToBlockmatrix

### ** Examples

library(RMAWGEN)
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

p <- 1 ## try p <- 2 !!!
CCGamma <- CCGammaToBlockmatrix(data=prec_mes,lag=0,p=p,tolerance=0.001)

## Not Run in the examples, uncomment to run the following line
# CCGamma_1 <- CCGammaToBlockmatrix(data=prec_mes,lag=1,p=p,tolerance=0.001)


### Alternatively, recommended .....
## Not Run in the examples, uncomment to run the following line
# CCGamma <- CCGammaToBlockmatrix(data=prec_mes,lag=0,p=p+1,tolerance=0.001)

# CCGamma0 <- CCGamma[1:p,1:p]
# CCGamma1 <- CCGamma[(1:p),(1:p)+1]

# CCGamma0_inv <- solve(CCGamma0)


## Not Run in the examples, uncomment to run the following line
#a1 <- blockmatmult(CCGamma0,CCGamma0_inv)
# a2 <- blockmatmult(CCGamma1,CCGamma0_inv)



# CCGamma_1t <- t(CCGamma1)
#CCGamma_0t <- t(CCGamma0)

# A <- t(solve(CCGamma_0t,CCGamma_1t))




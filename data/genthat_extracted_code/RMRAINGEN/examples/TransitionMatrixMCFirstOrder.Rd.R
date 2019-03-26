library(RMRAINGEN)


### Name: TransitionMatrixMCFirstOrder
### Title: Transition Matrix for a 1st order Markov Chain
### Aliases: TransitionMatrixMCFirstOrder

### ** Examples

## # Not Run in the examples, uncomment to run the following lines

#library(RMAWGEN)
#data(trentino)
#
#year_min <- 1961
#year_max <- 1990
#
#period <- PRECIPITATION$year>=year_min & PRECIPITATION$year<=year_max
#station <- names(PRECIPITATION)[!(names(PRECIPITATION) %in% c("day","month","year"))]
#prec_mes <- PRECIPITATION[period,station]
#
### removing nonworking stations (e.g. time series with NA)
#accepted <- array(TRUE,length(names(prec_mes)))
#names(accepted) <- names(prec_mes)
#for (it in names(prec_mes)) {
#		 accepted[it]  <- (length(which(!is.na(prec_mes[,it])))==length(prec_mes[,it]))
#}

#prec_mes <- prec_mes[,accepted]
### the dateset is reduced!!!
#prec_mes <- prec_mes[,1:2]
#valmin <- 0.5
#
#mt <- TransitionMatrixMCFirstOrder(data=prec_mes>valmin,rc.names=c("dry","wet"))
#
#CCGamma <- CCGamma(data=prec_mes,lag=0,tolerance=0.001,valmin=valmin,only.matrix=FALSE)
#
#i <- 1
#pd <- CCGamma$p0_v1[i]
#pdv <- mt[[i]]
#pdcalc <- pd*pdv["dry","dry"]+(1-pd)*pdv["wet","dry"]
#
#pw <- 1-pd
#pwcalc <- pd*pdv["dry","wet"]+(1-pd)*pdv["wet","wet"]
#
## verify
#pd-pdcalc
#pw-pwcalc
#




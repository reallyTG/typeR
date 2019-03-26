library(RGENERATEPREC)


### Name: PrecipitationAmountModel
### Title: ....
### Aliases: PrecipitationAmountModel

### ** Examples

library(RGENERATEPREC)

set.seed(1245)

data(trentino)

year_min <- 1961
year_max <- 1990

origin <- paste(year_min,1,1,sep="-")
end <- paste(year_max,12,31,sep="-")

period <- PRECIPITATION$year>=year_min & PRECIPITATION$year<=year_max
period_temp <- TEMPERATURE_MAX$year>=year_min & TEMPERATURE_MAX$year<=year_max

prec_mes <- PRECIPITATION[period,]
Tx_mes <- TEMPERATURE_MAX[period_temp,]
Tn_mes <- TEMPERATURE_MIN[period_temp,]
accepted <- array(TRUE,length(names(prec_mes)))
names(accepted) <- names(prec_mes)
for (it in names(prec_mes)) {
	acc <- TRUE
	acc <- (length(which(!is.na(Tx_mes[,it])))==length(Tx_mes[,it]))
	acc <- (length(which(!is.na(Tn_mes[,it])))==length(Tn_mes[,it])) & acc
	accepted[it]  <- (length(which(!is.na(prec_mes[,it])))==length(prec_mes[,it])) & acc
	
}

valmin <- 1.0
prec_mes <- prec_mes[,accepted]



Tx_mes <- Tx_mes[,accepted]
Tn_mes <- Tn_mes[,accepted]
prec_occurence_mes <- prec_mes>=valmin

station <- names(prec_mes)[!(names(prec_mes) %in% c("day","month","year"))]

precamount <- PrecipitationAmountModel(prec_mes,station=station,origin=origin)

val <- predict(precamount)

prec_gen <- generate(precamount)  




month <- adddate(as.data.frame(residuals(precamount$T0090)),origin=origin)$month
#####plot(month,residuals(precamount$T0090))
plot(factor(month),residuals(precamount$T0090))

qqplot(prec_mes$T0083,prec_gen$T0083)
abline(0,1)








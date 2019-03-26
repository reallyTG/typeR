library(RGENERATEPREC)


### Name: predict.PrecipitationOccurenceModel
### Title: Prediction of a 'PrecipitationOccurenceModel' model object
### Aliases: predict predict.PrecipitationAmountModel
###   predict.PrecipitationOccurenceModel
###   predict.PrecipitationOccurenceMultiSiteModel

### ** Examples


library(RGENERATEPREC)

data(trentino)

year_min <- 1961
year_max <- 1990

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
origin <- paste(year_min,1,1,sep="-")


prec_occurence_mes <- prec_mes>=valmin

station <- names(prec_mes)[!(names(prec_mes) %in% c("day","month","year"))]
it <- station[2]
vect <- Tx_mes[,it]-Tn_mes[,it]
months <- factor(prec_mes$month)
model <- PrecipitationOccurenceModel(x=prec_mes[,it],exogen=vect,monthly.factor=months)

probs <- predict(model)

nday <- 3.0
vect_new <- array(1.0,nday)
months_new <- array(1,nday)
row_test <- 2000:2007
newdata <- model$predictor[row_test,]
probs2 <- predict(model,newdata=newdata)

probs[row_test]==probs2
###





prec_occurence_mes <- prec_mes>=valmin

station <- names(prec_mes)[!(names(prec_mes) %in% c("day","month","year"))]

station <- station[1:4] ## reduced the dataset!!! 
Tx_mes <- Tx_mes[,station]
Tn_mes <- Tn_mes[,station]

prec_mes <- prec_mes[,station]
exogen <- Tx_mes-Tn_mes
months <- factor(prec_mes$month)


### Not Run 
### Please uncomment the following lines to run them 


#model_multisite <- PrecipitationOccurenceMultiSiteModel(x=prec_mes,
#exogen=exogen,origin=origin,multisite_type="wilks")
#
#
#model_multisite_logit <- PrecipitationOccurenceMultiSiteModel(x=prec_mes,
#exogen=exogen,origin=origin,multisite_type="logit")
#
#
#probs_multimodel  <- predict(model_multisite_logit)






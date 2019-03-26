library(RGENERATEPREC)


### Name: PrecipitationOccurenceModel
### Title: Precipitation Occurence Model
### Aliases: PrecipitationOccurenceModel

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
prec_occurence_mes <- prec_mes>=valmin

station <- names(prec_mes)[!(names(prec_mes) %in% c("day","month","year"))]
it <- station[2]
vect <- Tx_mes[,it]-Tn_mes[,it]
months <- factor(prec_mes$month)
model <- PrecipitationOccurenceModel(x=prec_mes[,it],exogen=vect,monthly.factor=months)

probs <- predict(model$glm,type="response")





plot(months[-1],probs)

newdata <- model$predictor[2000:2007,]
probs0 <- predict(model,newdata=newdata)







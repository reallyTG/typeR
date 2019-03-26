library(mvmeta)


### Name: predict.mvmeta
### Title: Predicted Values from mvmeta Models
### Aliases: predict.mvmeta
### Keywords: models regression multivariate methods

### ** Examples

# RUN THE MODEL
model <- mvmeta(cbind(PD,AL)~pubyear,S=berkey98[5:7],data=berkey98)

# PREDICTED FROM YEAR 1985 TO 1987, WITH LABELS
newdata <- data.frame(pubyear=1985:1987,row.names=1985:1987)

# AVERAGED OUTOCOMES AND SE
predict(model,newdata,se=TRUE)

# SAME AS ABOVE, AGGREGATED BY OUTCOME
predict(model,newdata,se=TRUE,aggregate="y")

# SAME AS ABOVE, WITH PREDICTION INTERVALS
predict(model,newdata,se=TRUE,aggregate="y",interval="prediction")

# WITH VCOV, FORCED TO A LIST
predict(model,newdata,se=TRUE,vcov=TRUE,aggregate="y")




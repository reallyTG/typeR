library(sptemExp)


### Name: fillNASVDSer
### Title: SVD to Interpolate the Missing Values in the Time Series Data
### Aliases: fillNASVDSer
### Keywords: ~kwd1 ~kwd2

### ** Examples


#Using the 2014 PM2.5 time series as an example
data("shdSeries2014")
n=nrow(shdSeries2014)
p=0.1 # Set the proportion of missing values
np=as.integer(n*p)
index=sample(n,np)
shdSeries2014missed=shdSeries2014
shdSeries2014missed[index,"obs"]=NA
shdSeries2014filled=fillNASVDSer(shdSeries2014missed,"siteid","date","obs",k=1)

#Exmine the accuracy:
cor(shdSeries2014filled[index,"obs"],shdSeries2014[index,"obs"])
rmse(shdSeries2014filled[index,"obs"],shdSeries2014[index,"obs"])





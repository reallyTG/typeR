library(McSpatial)


### Name: qregspiv 
### Title: IV Estimator for the Spatial AR Quantile Model
### Aliases: 'qregspiv '
### Keywords: Quantile Regression Spatial AR Model

### ** Examples

data(matchdata)
set.seed(4849189)
mdata <- matchdata[matchdata$year==2005,]
obs <- sample(seq(1,nrow(mdata)),400)
mdata <- mdata[obs,]
mdata$age <- 2005 - mdata$yrbuilt
lmat <- cbind(mdata$longitude,mdata$latitude)

fit <- makew(coormat=lmat,method="ring",ringdist=.50)
wmat <- fit$wmat
form <- lnprice~lnland+lnbldg
fit <- qregspiv(form,wmat=wmat,data=mdata,tau=.5)




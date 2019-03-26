library(McSpatial)


### Name: matchdata
### Title: Matched samples of house sales in Chicago for 1995 and 2005
### Aliases: matchdata
### Keywords: datasets

### ** Examples

data(matchdata)
matchdata$year05 <- matchdata$year==2005
matchdata$age <- matchdata$year - matchdata$yrbuilt 
fit <- lm(lnprice~lnland+lnbldg+rooms+bedrooms+bathrooms+centair+fireplace+brick+
  garage1+garage2+dcbd+rr+age+year05+factor(carea), data=matchdata)
summary(fit)




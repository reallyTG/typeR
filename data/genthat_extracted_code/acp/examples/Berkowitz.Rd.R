library(acp)


### Name: Berkowitz
### Title: Berkowitz test
### Aliases: Berkowitz
### Keywords: Berkowitz

### ** Examples


data(polio)

#Create time trend and seasonality variables
trend=(1:168/168)
cos12=cos((2*pi*(1:168))/12)
sin12=sin((2*pi*(1:168))/12)
cos6=cos((2*pi*(1:168))/6)
sin6=sin((2*pi*(1:168))/6)

polio_data<-data.frame(polio, trend , cos12, sin12, cos6, sin6)
mod1 <- acp(polio~-1+trend+cos12+sin12+cos6+sin6,data=polio_data, p = 1 ,q = 2)
summary(mod1)
Berkowitz(polio_data[[1]],fitted(mod1),50)




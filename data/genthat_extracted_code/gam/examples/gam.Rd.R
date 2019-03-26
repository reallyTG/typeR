library(gam)


### Name: gam
### Title: Fitting Generalized Additive Models
### Aliases: gam gam.fit
### Keywords: models regression nonparametric smooth

### ** Examples

data(kyphosis)
gam(Kyphosis ~ s(Age,4) + Number, family = binomial, data=kyphosis,
trace=TRUE)
data(airquality)
gam(Ozone^(1/3) ~ lo(Solar.R) + lo(Wind, Temp), data=airquality, na=na.gam.replace)
gam(Kyphosis ~ poly(Age,2) + s(Start), data=kyphosis, family=binomial, subset=Number>2)
data(gam.data)
Gam.object <- gam(y ~ s(x,6) + z,data=gam.data)
summary(Gam.object)
plot(Gam.object,se=TRUE)
data(gam.newdata)
predict(Gam.object,type="terms",newdata=gam.newdata)




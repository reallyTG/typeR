library(gamlss)


### Name: predict.gamlss
### Title: Extract Predictor Values and Standard Errors For New Data In a
###   GAMLSS Model
### Aliases: predict.gamlss predictAll
### Keywords: regression

### ** Examples

data(aids)
a<-gamlss(y~poly(x,3)+qrt, family=PO, data=aids) # 
newaids<-data.frame(x=c(45,46,47), qrt=c(2,3,4))
ap <- predict(a, newdata=newaids, type = "response")
ap
# now getting all the parameters
predictAll(a, newdata=newaids)
rm(a, ap)
data(abdom)
# transform x 
aa<-gamlss(y~cs(x^.5),data=abdom)
# predict at old values
predict(aa)[610]
# predict at new values 
predict(aa,newdata=data.frame(x=42.43))
# now transform x first 
nx<-abdom$x^.5
aaa<-gamlss(y~cs(nx),data=abdom)
# create a new data frame 
newd<-data.frame( abdom, nx=abdom$x^0.5)
# predict at old values
predict(aaa)[610]
# predict at new values 
predict(aaa,newdata=data.frame(nx=42.43^.5), data=newd)




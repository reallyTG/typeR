library(TreatmentSelection)


### Name: trtsel
### Title: create a trtsel object
### Aliases: trtsel

### ** Examples



data(tsdata)

###########################
## Create trtsel objects 
###########################

trtsel.Y1 <- trtsel(event ~ Y1*trt, 
                   treatment.name = "trt", 
                   data = tsdata, 
                   study.design = "RCT",
                   family = binomial("logit"), 
                   default.trt = "trt all")

trtsel.Y1

trtsel.Y2 <- trtsel(event ~ Y2*trt, 
                   treatment.name = "trt", 
                   data = tsdata, 
                   default.trt = "trt all")
trtsel.Y2


# calculate fitted risks using a logistic model 
#(one can use any model here, the point is that the fitted risks are provided )
mymod <- glm(event~trt*Y2, data= tsdata, family = binomial("logit"))

tsdata$fitted.t0 <- predict(mymod, newdata=data.frame(trt = 0, Y2 = tsdata$Y2), type = "response")
tsdata$fitted.t1 <- predict(mymod, newdata=data.frame(trt = 1, Y2 = tsdata$Y2), type = "response")

#all bootstrapping done using this object will be conditional on the model fit. 

myfitted.trtsel <- trtsel( event~trt, treatment.name = "trt", 
                           data = tsdata,
                           fittedrisk.t0 = "fitted.t0",
                           fittedrisk.t1 = "fitted.t1",
                           default.trt = "trt all")







library(TreatmentSelection)


### Name: trtsel_measures
### Title: a simple function to estimate performance measures for a rule
###   used to select treatment.
### Aliases: trtsel_measures

### ** Examples

data(tsdata)
#The user must specify a vector of clinical outcomes, 
#a vector of treatment assigments, and a vector of 
#marker-based treatment recommendations based on the pre-specified rule.

#Here we let Y1_disc represent a user-specified treatment 
#rule and evaluate its performance.

trtsel_measures(event = tsdata$event, trt = tsdata$trt, trt.rule = 1- tsdata$Y1_disc )

#We can also fit our own risk model using GLM, use this model
#to develop a marker-based treatment recommendation, and evaluate its performance. 
#This allows us to obtain model-based estimates of performance:

mod <- glm(event~trt*Y1_disc,  data = tsdata, family = binomial())

tsdata.0 <- tsdata; 
tsdata.0$trt = 0 
tsdata.1 <- tsdata;
tsdata.1$trt = 1
delta.hat <- predict(mod, 
                    newdata= tsdata.0,
                    type = "response") - 
            predict(mod,
                    newdata= tsdata.1, 
                    type = "response")

trtsel_measures(event = tsdata$event, trt = tsdata$trt, 
               trt.rule = 1- tsdata$Y1_disc, trt.effect = delta.hat )





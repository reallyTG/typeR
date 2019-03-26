library(TreatmentSelection)


### Name: evaluate.trtsel
### Title: evaluate the performance of one or more biomarkers for their
###   ability to guide patient treatment recommendations.
### Aliases: evaluate.trtsel

### ** Examples

data(tsdata)

###########################
## Create trtsel objects 
###########################

trtsel.Y1 <- trtsel(event ~ Y1*trt, 
                   treatment.name = "trt", 
                   data = tsdata, 
                   study.design = "RCT",
                   family = binomial(link = "logit"), 
                   default.trt = "trt all")
trtsel.Y1

#################################
## Evaluate marker performance
#################################

# Marker Y1
estimates.Y1 <- evaluate(trtsel.Y1, bootstraps = 50)
estimates.Y1





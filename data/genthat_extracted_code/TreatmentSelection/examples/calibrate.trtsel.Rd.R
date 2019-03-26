library(TreatmentSelection)


### Name: calibrate.trtsel
### Title: assess model calibration of a trtsel object
### Aliases: calibrate.trtsel

### ** Examples


data(tsdata)

###########################
## Create trtsel objects 
###########################
trtsel.Y1 <- trtsel(event ~ Y1*trt, 
                   treatment.name = "trt", 
                   data = tsdata, 
                   study.design = "RCT",
                   default.trt = "trt all")

trtsel.Y1

##############################
## Assess model calibration
##############################

 
cali.Y1 <- calibrate(trtsel.Y1, plot.type = "calibration")
cali.Y1

# A "treatment effect" plot 
calibrate(trtsel.Y1, line.color = "coral", plot.type = "treatment effect")






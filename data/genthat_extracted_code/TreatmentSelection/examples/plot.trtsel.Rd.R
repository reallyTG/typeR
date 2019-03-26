library(TreatmentSelection)


### Name: plot.trtsel
### Title: plot risk curves, treatment effect curves or cdf of risk for a
###   trtsel object.
### Aliases: plot.trtsel plot

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




##########################
## Use the plot function 
##########################

# Plot risk curves
plot(trtsel.Y1, main = "Marker Y1", 
     plot.type = "risk", bootstraps = 10, #set higher in practice
     trt.names=c("trt","no trt"))
     
# Now with confidence intervals around fixed.values 
 plot(trtsel.Y1, main = "Marker Y1",
                        plot.type = "risk", ci = "horizontal", 
                        fixed.values = c(.2, .5), 
                        offset = .01, bootstraps = 10,
                        trt.names=c("trt","no trt"))
                        
# Plot treatment effect curves
#with confidence intervals around fixed.values
plot(trtsel.Y1, main = "Marker Y1", 
                       plot.type = "treatment effect",
                       ci = "vertical", conf.bands = FALSE,
                       fixed.values = c(10, 20), bootstraps = 10)





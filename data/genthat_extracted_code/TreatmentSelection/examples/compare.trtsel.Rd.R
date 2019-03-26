library(TreatmentSelection)


### Name: compare.trtsel
### Title: compare the performance of two treatment selection markers
### Aliases: compare.trtsel

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

trtsel.Y2 <- trtsel(event ~ Y2*trt, 
                   treatment.name = "trt", 
                   data = tsdata, 
                   default.trt = "trt all")
trtsel.Y2
                          

###############################
## Compare marker performance
###############################


# Plot treatment effect curves with pointwise confidence intervals
## use more bootstraps in practice
compare(x = trtsel.Y1, x2 = trtsel.Y2,
                                bootstraps = 10, plot = TRUE,      
                                ci = "horizontal",  conf.bands = TRUE) 
                                





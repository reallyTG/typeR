library(plsr)


### Name: predict.plsr
### Title: Predict from a plsr object
### Aliases: predict.plsr

### ** Examples

plsr_obj = pls(rating_data,tracking_data,10,10)
prediction=predict(plsr_obj,runif(7,1,101),"forward")
## No test: 
#visualizing results with face tracking data specific function
plsr:::plot_frame(prediction)
## End(No test)




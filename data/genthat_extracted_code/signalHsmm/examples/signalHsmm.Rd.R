library(signalHsmm)


### Name: signalHsmm
### Title: signalHsmm - prediction of signal peptides
### Aliases: signalHsmm signalHsmm-package

### ** Examples

few_predictions <- run_signalHsmm(benchmark_dat[1:3])
#see all predictions
pred2df(few_predictions)
#summary one prediction
summary(few_predictions[[1]])
#plot one prediction
plot(few_predictions[[1]])

#have fun with GUI
## Not run: 
##D gui_signalHsmm()
## End(Not run)




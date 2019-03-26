library(mlergm)


### Name: mlergm
### Title: Multilevel Exponential-Family Random Graph Models
### Aliases: mlergm print.mlergm summary.mlergm
### Keywords: estimation

### ** Examples

## No test: 
### Load the school classes data-set 
data(classes) 

# Estimate a curved multilevel ergm model with offset parameter 
# Approximate run time (2 cores): 1.2m, Run time (3 cores): 55s 
model_est <- mlergm(classes ~ edges + mutual + nodematch("sex") +  gwesp(fixed = FALSE), 
                    seed = 123, 
                    options = set_options(number_cores = 2))

# To access a summary of the fitted model, call the 'summary' function 
summary(model_est)

# Goodness-of-fit can be run by calling the 'gof.mlergm' method 
# Approximate run time (2 cores): 48s, Run time (3 cores): 34s  
gof_res <- gof(model_est, options = set_options(number_cores = 2))
plot(gof_res, cutoff = 15)
## End(No test) 




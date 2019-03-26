library(projpred)


### Name: get-refmodel
### Title: Get reference model structure
### Aliases: get-refmodel get_refmodel get_refmodel.refmodel
###   get_refmodel.vsel get_refmodel.cvsel get_refmodel.stanreg
###   get_refmodel.brmsfit

### ** Examples

## No test: 
### Usage with stanreg objects
dat <- data.frame(y = rnorm(100), x = rnorm(100))
fit <- stan_glm(y ~ x, family = gaussian(), data = dat)
ref <- get_refmodel(fit)
print(class(ref))

# variable selection, use the already constructed reference model
vs <- varsel(ref) 
# this will first construct the reference model and then execute 
# exactly the same way as the previous command (the result is identical)
vs <- varsel(fit) 
## End(No test)





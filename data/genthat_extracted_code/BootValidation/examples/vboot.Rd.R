library(BootValidation)


### Name: vboot
### Title: Generic function for bootstrap validation
### Aliases: vboot

### ** Examples

# Create the data
set.seed(25)
x <- matrix(rnorm(80),ncol=4)
y <- x[,4]*0.8+x[,3]*0.4+rnorm(20)
# Fit glmnet model
fit_enet <- glmnet::glmnet(x, y, alpha = 0.5)
# Bootstrap validation
vboot(fit_enet, x, y, nfolds = 3, B = 2, s = 0.5, cv_replicates = 5, n_cores = 1)




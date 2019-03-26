library(logcondens)


### Name: confIntBootLogConROC_t0
### Title: Function to compute a bootstrap confidence interval for the ROC
###   curve at a given t, based on the log-concave ROC curve
### Aliases: confIntBootLogConROC_t0
### Keywords: htest

### ** Examples

## Not run: 
##D ## ROC curve for pancreas data 
##D data(pancreas)
##D status <- factor(pancreas[, "status"], levels = 0:1, labels = c("healthy", "diseased"))
##D var <- log(pancreas[, "ca199"])
##D cases <- var[status == "diseased"]
##D controls <- var[status == "healthy"]
##D 
##D ## compute confidence intervals
##D res <- confIntBootLogConROC_t0(controls, cases, grid = c(0.2, 0.8), conf.level = 0.95, 
##D     M = 1000, smooth = TRUE, output = TRUE)
##D res
## End(Not run)




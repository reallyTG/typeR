library(utiml)


### Name: scut_threshold
### Title: SCut Score-based method
### Aliases: scut_threshold scut_threshold.default scut_threshold.mlresult

### ** Examples

names <- list(1:10, c("a", "b", "c"))
prediction <- matrix(runif(30), ncol = 3, dimnames = names)
classes <- matrix(sample(0:1, 30, rep = TRUE), ncol = 3, dimnames = names)
thresholds <- scut_threshold(prediction, classes)
fixed_threshold(prediction, thresholds)

## Not run: 
##D # Penalizes only FP predictions
##D mylossfunc <- function (real, predicted) {
##D    mean(predicted - real * predicted)
##D }
##D prediction <- predict(br(toyml, "RANDOM"), toyml)
##D scut_threshold(prediction, toyml, loss.function = mylossfunc, cores = 5)
## End(Not run)




library(h2o)


### Name: h2o.std_coef_plot
### Title: Plot Standardized Coefficient Magnitudes
### Aliases: h2o.std_coef_plot

### ** Examples

## No test: 
library(h2o)
h2o.init()

prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.importFile(prostate_path)
prostate[,2] <- as.factor(prostate[,2])
prostate_glm <- h2o.glm(y = "CAPSULE", x = c("AGE","RACE","PSA","DCAPS"),
                         training_frame = prostate, family = "binomial",
                         nfolds = 0, alpha = 0.5, lambda_search = FALSE)
h2o.std_coef_plot(prostate_glm)
## End(No test)




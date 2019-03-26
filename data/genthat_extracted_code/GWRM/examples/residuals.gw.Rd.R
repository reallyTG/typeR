library(GWRM)


### Name: residuals.gw
### Title: Extract and Visualize GWRM Model Residuals
### Aliases: residuals.gw

### ** Examples

data(goals)
set.seed(1)
fit0 <- gw(goals ~ position, data = goals[sample(1:nrow(goals), 75), ])
residuals(fit0, type = "pearson", rep = 19, envelope = TRUE, trace = FALSE, ncores = 2)




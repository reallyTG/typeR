library(mcglm)


### Name: soil
### Title: Soil Chemistry Properties Data
### Aliases: soil
### Keywords: datasets

### ** Examples

## No test: 
data(soil, package="mcglm")
neigh <- tri2nb(soil[,1:2])
Z1 <- mc_car(neigh)
# Linear predictor
form.ca <- CA ~ COORD.X*COORD.Y + SAND + SILT + CLAY + PHWATER
fit.ca <- mcglm(linear_pred = c(form.ca), matrix_pred = list(Z1),
               link = "log", variance = "tweedie", covariance = "inverse",
               power_fixed = FALSE, data = soil,
               control_algorith = list(max_iter = 500, tuning = 0.1))
summary(fit.ca)
# Conditional hypothesis test
mc_conditional_test(fit.ca, parameters = c("power11","tau11","tau12"),
                   test = 2:3, fixed = 1)
# Spatial autocorrelation
mc_compute_rho(fit.ca)
## End(No test)





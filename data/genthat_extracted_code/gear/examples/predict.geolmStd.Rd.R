library(gear)


### Name: predict.geolmStd
### Title: Predict method for geostatistical models
### Aliases: predict.geolmStd

### ** Examples


# generate response
y = rnorm(10)
# generate coordinates
x1 = runif(10); x2 = runif(10)

# data frame for observed data
data = data.frame(y, x1, x2)
# newdata must have columns with prediction coordinates
newdata = data.frame(x1 = runif(5), x2 = runif(5))

# specify a standard covariance model
cmod = cmod.std(model = "exponential", psill = 1, 
                r = 1)

# geolm for universal kriging
gearmod_uk = geolm(y ~ x1 + x2, data = data,
                 coordnames = c("x1", "x2"),
                 cmod = cmod)
# prediction for universal kriging, with conditional simulation
pred_uk = predict(gearmod_uk, newdata, nsim = 2)

# geolm for ordinary kriging
gearmod_ok = geolm(y ~ 1, data = data,
                 coordnames = c("x1", "x2"),
                 cmod = cmod)
# prediction for ordinary kriging
pred_ok = predict(gearmod_ok, newdata)

# geolm for simple kriging
gearmod_ok = geolm(y ~ 1, data = data,
                 coordnames = c("x1", "x2"),
                 cmod = cmod, mu = 1)
# prediction for simple kriging
pred_sk = predict(gearmod_ok, newdata)





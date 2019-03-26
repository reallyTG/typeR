library(semTools)


### Name: partialInvariance
### Title: Partial Measurement Invariance Testing Across Groups
### Aliases: partialInvariance partialInvarianceCat

### ** Examples


## Conduct weak invariance testing manually by using fixed-factor
## method of scale identification

library(lavaan)

conf <- "
f1 =~ NA*x1 + x2 + x3
f2 =~ NA*x4 + x5 + x6
f1 ~~ c(1, 1)*f1
f2 ~~ c(1, 1)*f2
"

weak <- "
f1 =~ NA*x1 + x2 + x3
f2 =~ NA*x4 + x5 + x6
f1 ~~ c(1, NA)*f1
f2 ~~ c(1, NA)*f2
"

configural <- cfa(conf, data = HolzingerSwineford1939, std.lv = TRUE, group="school")
weak <- cfa(weak, data = HolzingerSwineford1939, group="school", group.equal="loadings")
models <- list(fit.configural = configural, fit.loadings = weak)
partialInvariance(models, "metric")

## Not run: 
##D partialInvariance(models, "metric", free = "x5") # "x5" is free across groups in advance
##D partialInvariance(models, "metric", fix = "x4") # "x4" is fixed across groups in advance
##D 
##D ## Use the result from the measurementInvariance function
##D HW.model <- ' visual =~ x1 + x2 + x3
##D               textual =~ x4 + x5 + x6
##D               speed =~ x7 + x8 + x9 '
##D 
##D models2 <- measurementInvariance(model = HW.model, data=HolzingerSwineford1939,
##D                                  group="school")
##D partialInvariance(models2, "scalar")
##D 
##D ## Conduct weak invariance testing manually by using fixed-factor
##D ## method of scale identification for dichotomous variables
##D 
##D f <- rnorm(1000, 0, 1)
##D u1 <- 0.9*f + rnorm(1000, 1, sqrt(0.19))
##D u2 <- 0.8*f + rnorm(1000, 1, sqrt(0.36))
##D u3 <- 0.6*f + rnorm(1000, 1, sqrt(0.64))
##D u4 <- 0.7*f + rnorm(1000, 1, sqrt(0.51))
##D u1 <- as.numeric(cut(u1, breaks = c(-Inf, 0, Inf)))
##D u2 <- as.numeric(cut(u2, breaks = c(-Inf, 0.5, Inf)))
##D u3 <- as.numeric(cut(u3, breaks = c(-Inf, 0, Inf)))
##D u4 <- as.numeric(cut(u4, breaks = c(-Inf, -0.5, Inf)))
##D g <- rep(c(1, 2), 500)
##D dat2 <- data.frame(u1, u2, u3, u4, g)
##D 
##D configural2 <- "
##D f1 =~ NA*u1 + u2 + u3 + u4
##D u1 | c(t11, t11)*t1
##D u2 | c(t21, t21)*t1
##D u3 | c(t31, t31)*t1
##D u4 | c(t41, t41)*t1
##D f1 ~~ c(1, 1)*f1
##D f1 ~ c(0, NA)*1
##D u1 ~~ c(1, 1)*u1
##D u2 ~~ c(1, NA)*u2
##D u3 ~~ c(1, NA)*u3
##D u4 ~~ c(1, NA)*u4
##D "
##D 
##D outConfigural2 <- cfa(configural2, data = dat2, group = "g",
##D                       parameterization = "theta", estimator = "wlsmv",
##D                       ordered = c("u1", "u2", "u3", "u4"))
##D 
##D weak2 <- "
##D f1 =~ NA*u1 + c(f11, f11)*u1 + c(f21, f21)*u2 + c(f31, f31)*u3 + c(f41, f41)*u4
##D u1 | c(t11, t11)*t1
##D u2 | c(t21, t21)*t1
##D u3 | c(t31, t31)*t1
##D u4 | c(t41, t41)*t1
##D f1 ~~ c(1, NA)*f1
##D f1 ~ c(0, NA)*1
##D u1 ~~ c(1, 1)*u1
##D u2 ~~ c(1, NA)*u2
##D u3 ~~ c(1, NA)*u3
##D u4 ~~ c(1, NA)*u4
##D "
##D 
##D outWeak2 <- cfa(weak2, data = dat2, group = "g", parameterization = "theta",
##D                 estimator = "wlsmv", ordered = c("u1", "u2", "u3", "u4"))
##D modelsCat <- list(fit.configural = outConfigural2, fit.loadings = outWeak2)
##D 
##D partialInvarianceCat(modelsCat, type = "metric")
##D 
##D partialInvarianceCat(modelsCat, type = "metric", free = "u2")
##D partialInvarianceCat(modelsCat, type = "metric", fix = "u3")
##D 
##D ## Use the result from the measurementInvarianceCat function
##D 
##D model <- ' f1 =~ u1 + u2 + u3 + u4
##D            f2 =~ u5 + u6 + u7 + u8'
##D 
##D modelsCat2 <- measurementInvarianceCat(model = model, data = datCat, group = "g",
##D 	                                      parameterization = "theta",
##D 	                                      estimator = "wlsmv", strict = TRUE)
##D 
##D partialInvarianceCat(modelsCat2, type = "scalar")
## End(Not run)





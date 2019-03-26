library(VGAM)


### Name: Qvar
### Title: Quasi-variances Preprocessing Function
### Aliases: Qvar
### Keywords: models regression

### ** Examples

# Example 1
data("ships", package = "MASS")

Shipmodel <- vglm(incidents ~ type + year + period,
                  poissonff, offset = log(service),
#                 trace = TRUE, model = TRUE,
                  data = ships, subset = (service > 0))

# Easiest form of input
fit1 <- rcim(Qvar(Shipmodel, "type"), uninormal("explink"), maxit = 99)
qvar(fit1)              # Easy method to get the quasi-variances
qvar(fit1, se = TRUE)   # Easy method to get the quasi-standard errors

(quasiVar <- exp(diag(fitted(fit1))) / 2)                 # Version 1
(quasiVar <- diag(predict(fit1)[, c(TRUE, FALSE)]) / 2)   # Version 2
(quasiSE  <- sqrt(quasiVar))

# Another form of input
fit2 <- rcim(Qvar(Shipmodel, coef.ind = c(0, 2:5), reference.name = "typeA"),
             uninormal("explink"), maxit = 99)
## Not run:  qvplot(fit2, col = "green", lwd = 3, scol = "blue", slwd = 2, las = 1) 

# The variance-covariance matrix is another form of input (not recommended)
fit3 <- rcim(Qvar(cbind(0, rbind(0, vcov(Shipmodel)[2:5, 2:5])),
                  labels = c("typeA", "typeB", "typeC", "typeD", "typeE"),
                  estimates = c(typeA = 0, coef(Shipmodel)[2:5])),
             uninormal("explink"), maxit = 99)
(QuasiVar <- exp(diag(fitted(fit3))) / 2)                 # Version 1
(QuasiVar <- diag(predict(fit3)[, c(TRUE, FALSE)]) / 2)   # Version 2
(QuasiSE  <- sqrt(quasiVar))
## Not run:  qvplot(fit3) 


# Example 2: a model with M > 1 linear predictors
## Not run: 
##D  require("VGAMdata")
##D xs.nz.f <- subset(xs.nz, sex == "F")
##D xs.nz.f <- subset(xs.nz.f, !is.na(babies)  & !is.na(age) & !is.na(ethnicity))
##D xs.nz.f <- subset(xs.nz.f, ethnicity != "Other")
##D 
##D clist <- list("sm.bs(age, df = 4)" = rbind(1, 0),
##D               "sm.bs(age, df = 3)" = rbind(0, 1),
##D               "ethnicity"          = diag(2),
##D               "(Intercept)"        = diag(2))
##D fit1 <- vglm(babies ~ sm.bs(age, df = 4) + sm.bs(age, df = 3) + ethnicity,
##D             zipoissonff(zero = NULL), xs.nz.f,
##D             constraints = clist, trace = TRUE)
##D Fit1 <- rcim(Qvar(fit1, "ethnicity", which.linpred = 1),
##D              uninormal("explink", imethod = 1), maxit = 99, trace = TRUE)
##D Fit2 <- rcim(Qvar(fit1, "ethnicity", which.linpred = 2),
##D              uninormal("explink", imethod = 1), maxit = 99, trace = TRUE)
## End(Not run)
## Not run: 
##D  par(mfrow = c(1, 2))
##D qvplot(Fit1, scol = "blue", pch = 16, main = expression(eta[1]),
##D        slwd = 1.5, las = 1, length.arrows = 0.07)
##D qvplot(Fit2, scol = "blue", pch = 16, main = expression(eta[2]),
##D        slwd = 1.5, las = 1, length.arrows = 0.07)
## End(Not run)




library(hrIPW)


### Name: hrIPW
### Title: Hazard ratio estimation using Cox model weighted by the
###   propensity score
### Aliases: hrIPW

### ** Examples

## Using a simulated cohort
data(hrData, package = "hrIPW")
hrIPW(hrData, time = "time", status = "status", exposure = "Trt",
      variables = paste("X", 1:9, sep = ""), wtype = "ATE-stab")

# Standard error could be compared with the (robust) Lin's standard error
# which does not take into account the propensity score estimation step:
modT <- glm(Trt ~ X1 + X2 + X3 + X4 + X5 + X6 + X7 + X8 + X9, data = hrData, family = "binomial")
probT <- predict(modT, type = "response")
hrData$w <- 1/ifelse(hrData$Trt == 1, probT, 1 - probT)
library(survival)
coxph(Surv(time, status) ~ Trt + cluster(id), data = hrData, method = "breslow", weights = w)

# or with the bootstrap-based standard-error (see Austin 2016):
## Not run: 
##D f.boot <- function(data, i, wtype) {
##D     df <- data[i, ]
##D     modT <- glm(Trt ~ X1 + X2 + X3 + X4 + X5 + X6 + X7 + X8 + X9, data = df, family = "binomial")
##D     probT <- predict(modT, type = "response")
##D     df$w <- 1/ifelse(df$Trt == 1, probT, 1 - probT)
##D 
##D     return(coxph(Surv(time, status) ~ Trt, data = df, weights = w)$coef)
##D }
##D 
##D library(boot); set.seed(1234)
##D rcoefs <- boot(data = hrData, statistic = f.boot, R = 500)$t
##D sd(rcoefs)
## End(Not run)

## Using the DIVAT data base (package IPWsurvival, to be installed)
data(DIVAT, package = "IPWsurvival")
hrIPW(data = DIVAT, time = "times", status = "failures", exposure = "ecd",
      variables = c("age", "hla", "retransplant"), wtype = "ATE-unstab")

# Standard error could be compared with the (robust) Lin's standard error
# which does not take into account the propensity score estimation step:
modT <- glm(ecd ~ age + hla + retransplant, data = DIVAT, family = "binomial")
probT <- predict(modT, type = "response")
DIVAT$w <- 1/ifelse(DIVAT$ecd == 1, probT, 1 - probT)
DIVAT$id <- 1:nrow(DIVAT)
coxph(Surv(times, failures) ~ ecd + cluster(id), data = DIVAT, method = "breslow", weights = w)

# or with the bootstrap-based estimation (see Austin 2016):
## Not run: 
##D f.boot2 <- function(data, i, wtype) {
##D     df <- data[i, ]
##D     modT <- glm(ecd ~ age + hla + retransplant, data = df, family = "binomial")
##D     probT <- predict(modT, type = "response")
##D     df$w <- 1/ifelse(df$ecd == 1, probT, 1 - probT)
##D 
##D     return(coxph(Surv(times, failures) ~ ecd, data = df, weights = w)$coef)
##D }
##D 
##D set.seed(1234)
##D rcoefs2 <- boot(data = DIVAT, statistic = f.boot2, R = 500)$t
##D sd(rcoefs2)
## End(Not run)




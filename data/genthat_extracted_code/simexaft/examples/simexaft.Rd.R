library(simexaft)


### Name: simexaft
### Title: SIMEX Algorithm for Accelerated Failure Time Model with
###   Covariates Subject to Measurement Error
### Aliases: simexaft

### ** Examples

library("simexaft")
library("survival")
data("BHS")

dataset <- BHS

dataset$SBP <- log(dataset$SBP - 50)

###Naive AFT approach
formula <- Surv(SURVTIME,DTHCENS) ~ SBP + CHOL + AGE + BMI + SMOKE1 + SMOKE2

out1 <- survreg(formula = formula, data = dataset, dist = "weibull")

summary(out1)


###fit a AFT model with quadratic extrapolation
set.seed(120)

ind <- c("SBP", "CHOL")

err.mat <- diag(rep(0.5625, 2))

out2 <- simexaft(formula = formula, data = dataset, SIMEXvariable = ind, 
        repeated = FALSE, repind = list(), err.mat = err.mat, B = 50,
        lambda = seq(0, 2, 0.1),extrapolation = "quadratic", dist = "weibull")

summary(out2)






## No test: 
    #################### repeated measurements #################################
    data("rhDNase")

    ###true model
    rhDNase$fev.ave <- (rhDNase$fev + rhDNase$fev2)/2

    output1 <- survreg(Surv(time2, status) ~ trt + fev.ave, data = rhDNase, 
                    dist = "weibull")

    summary(output1)


    ####sensitive analysis#####
    set.seed(120)

    fev.error <- rhDNase$fev + rnorm(length(rhDNase$fev), mean = 0, 
                                    sd = 0.15 * sd(rhDNase$fev))

    fev.error2 <- rhDNase$fev2 + rnorm(length(rhDNase$fev2),mean = 0, 
                                    sd = 0.15 * sd(rhDNase$fev2))

    dataset2 <- cbind(rhDNase[, c("time2", "status", "trt")], fev.error, fev.error2)

    formula <- Surv(time2, status) ~ trt + fev.error

    ind <- "fev.error"


    ########naive model using the average FEV value####################
    fev.error.c <- (fev.error + fev.error2)/2

    output2 <- survreg(Surv(time2, status) ~ trt + fev.error.c, data = rhDNase, 
                    dist = "weibull")

    summary(output2)


    ######use simexaft and apply the quadratic extrapolation######
    formula <- Surv(time2, status) ~ trt + fev.error

    output3 <- simexaft(formula = formula, data = dataset2, SIMEXvariable = ind, 
            repeated=TRUE,repind=list(c("fev.error", "fev.error2")), err.mat=NULL, 
            B=50, lambda=seq(0,2, 0.1), extrapolation="quadratic", dist="weibull")
            
    summary(output3)
## End(No test)





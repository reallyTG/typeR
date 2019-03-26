library(shrink)


### Name: shrink
### Title: Global, Parameterwise and Joint Shrinkage of Regression
###   Coefficients
### Aliases: shrink

### ** Examples

## Example with mfp (family = cox)
data("GBSG")
library("mfp")
fit1 <- mfp(Surv(rfst, cens) ~ fp(age, df = 4, select = 0.05) +
              fp(prm, df = 4, select = 0.05), family = cox, data = GBSG)

shrink(fit1, type = "global", method = "dfbeta")

dfbeta.pw <- shrink(fit1, type = "parameterwise", method = "dfbeta")
dfbeta.pw
dfbeta.pw$postfit

# correlations between shrinkage factors and standard errors of shrinkage factors
cov2cor(dfbeta.pw$ShrinkageFactorsVCOV)
sqrt(diag(dfbeta.pw$ShrinkageFactorsVCOV))

shrink(fit1, type = "parameterwise", method = "dfbeta",
       join = list(c("age.1", "age.2")))

#shrink(fit1, type = "global", method = "jackknife")
#shrink(fit1, type = "parameterwise", method = "jackknife")
#shrink(fit1, type = "parameterwise", method = "jackknife",
#       join = list(c("age.1", "age.2")))

# obtain global, parameterwise and joint shrinkage with one call to 'shrink'
shrink(fit1, type = "all", method = "dfbeta",
       join = list(c("age.1", "age.2")))

## Example with rcs
library("rms")
fit2 <- coxph(Surv(rfst, cens) ~ rcs(age) + log(prm + 1), data = GBSG, x = TRUE)

shrink(fit2, type = "global", method = "dfbeta")
shrink(fit2, type = "parameterwise", method = "dfbeta")
shrink(fit2, type = "parameterwise", method = "dfbeta",
       join = list(c("rcs(age)")))
shrink(fit2, type = "parameterwise", method = "dfbeta",
       join = list(c("rcs(age)"), c("log(prm + 1)")))


## Examples with glm & mfp (family = binomial)
set.seed(888)
intercept <- 1
beta <- c(0.5, 1.2)
n <- 1000
x1 <- rnorm(n, mean = 1, sd = 1)
x2 <- rbinom(n, size = 1, prob = 0.3)
linpred <- intercept + x1 * beta[1] + x2 * beta[2]
prob <- exp(linpred) / (1 + exp(linpred))
runis <- runif(n, 0, 1)
ytest <- ifelse(test = runis < prob, yes = 1, no = 0)
simdat <- data.frame(cbind(y = ifelse(runis < prob, 1, 0), x1, x2))

fit3 <- glm(y ~ x1 + x2, family = binomial, data = simdat, x = TRUE)
summary(fit3)

shrink(fit3, type = "global", method = "dfbeta")
shrink(fit3, type = "parameterwise", method = "dfbeta")
shrink(fit3, type = "parameterwise", method = "dfbeta", join = list(c("x1", "x2")))


utils::data("Pima.te", package="MASS")
utils::data("Pima.tr", package="MASS")
Pima <- rbind(Pima.te, Pima.tr)
fit4 <- mfp(type ~ npreg + glu + bmi + ped + fp(age, select = 0.05),
            family = binomial, data = Pima)
summary(fit4)

shrink(fit4, type = "global", method = "dfbeta")
shrink(fit4, type = "parameterwise", method = "dfbeta")
# fit objects of class mfp: for 'join' use variable names as given in 'names(coef(fit4))'
shrink(fit4, type = "parameterwise", method = "dfbeta", join = list(c("age.1")))


## Examples with glm & mfp (family = gaussian) and lm
utils::data("anorexia", package = "MASS")
contrasts(anorexia$Treat) <- contr.treatment(n = 3, base = 2)
fit5 <- glm(Postwt ~ Prewt + Treat, family = gaussian, data = anorexia, x = TRUE)
fit5

shrink(fit5, type = "global", method = "dfbeta")
# which is identical to the more time-consuming jackknife approach:
# shrink(fit5, type = "global", method = "jackknife")

shrink(fit5, type = "parameterwise", method = "dfbeta")
shrink(fit5, type = "parameterwise", method = "dfbeta",
       join = list(c("Treat1", "Treat3")))


fit6 <- lm(Postwt ~ Prewt + Treat, data = anorexia, x = TRUE, y = TRUE)
fit6

shrink(fit6, type = "global", method = "dfbeta")
shrink(fit6, type = "parameterwise", method = "dfbeta")
shrink(fit6, type = "parameterwise", method = "dfbeta",
       join=list(c("Treat1", "Treat3")))


utils::data("GAGurine", package = "MASS")
fit7 <- mfp(Age ~ fp(GAG, select = 0.05), family = gaussian, data = GAGurine)
summary(fit7)

shrink(fit7, type = "global", method = "dfbeta")
shrink(fit7, type = "parameterwise", method = "dfbeta")
# fit objects of class mfp: for 'join' use variable names as given in 'names(coef(fit7))'
shrink(fit7, type = "parameterwise", method = "dfbeta",
       join = list(c("GAG.1", "GAG.2")))




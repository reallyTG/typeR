library(SurvRegCensCov)


### Name: SurvRegCens
### Title: Weibull Survival Regression Model with a censored covariate
### Aliases: SurvRegCens
### Keywords: methods survival regression

### ** Examples

## Not run: 
##D ## --------------------------------------------------------------
##D ## 1 censored-covariate and 2 non-censored covariates 
##D ## no censoring, to compare result with survival::survreg
##D ## modify prop.cens to introduce left-censoring of covariate
##D ## --------------------------------------------------------------
##D 
##D set.seed(158)
##D n <- 100
##D lambda <- exp(-2)
##D gamma <- 1.5
##D 
##D ## vector of regression parameters: the last entry is the one for the censored covariate
##D beta <- c(0.3, -0.2, 0.25) 
##D true <- c(lambda, gamma, beta)
##D 
##D ## non-censored covariates
##D var1 <- rnorm(n, mean = 4, sd = 0.5)
##D var2 <- rnorm(n, mean = 4, sd = 0.5)
##D 
##D ## Generate censored covariate. 
##D ## For generation of Weibull survival times, do not left-censor it yet.
##D var3 <- rnorm(n, mean = 5, sd = 0.5)
##D 
##D ## simulate from a Weibull regression model
##D time <- TimeSampleWeibull(covariate_noncens = data.frame(var1, var2), 
##D           covariate_cens = var3, lambda = lambda, gamma = gamma, beta = beta) 
##D 
##D ## left-censor covariate
##D ## prop.cens specifies the proportion of observations that should be left-censored
##D prop.cens <- 0
##D LOD <- qnorm(prop.cens, mean = 5, sd = 0.5)
##D var3.cens <- censorContVar(var3, LLOD = LOD)
##D 
##D ## censor survival time
##D event <- matrix(1, nrow = n, ncol = 1)
##D time.cens <- rexp(n, rate = 0.5)
##D ind.time <- (event >= time.cens)
##D event[ind.time] <- 0
##D time[ind.time] <- time.cens[ind.time]
##D 
##D ## specify the density for the censored covariate:
##D ## For simplicity, we take here the "true" density we simulate from. In an application,
##D ## you might want to use a density with parameters estimated from the censored covariate,
##D ## e.g. using the function ParamSampleCens. See example in Hubeaux & Rufibach (2014).
##D DensityCens <- function(value){return(dnorm(value, mean = 5, sd = 0.5))}
##D 
##D ## use Weibull regression where each censored covariate value is set 
##D ## to LOD ("naive" method)
##D naive <- survreg(Surv(time, event) ~ var1 + var2 + var3.cens[, 2], dist = "weibull")
##D initial <- as.vector(ConvertWeibull(naive)$vars[, 1])
##D 
##D ## use new method that takes into account the left-censoring of one covariate
##D data <- data.frame(time, event, var3.cens, var1, var2)
##D formula <- formula(Surv(time, event) ~  Surv(time = var3.cens[, 1], time2 = var3.cens[, 2], 
##D                       type = "interval2") + var1 + var2)
##D cens1 <- SurvRegCens(formula = formula, data = data, Density = DensityCens, initial = initial, 
##D                       namCens = "biomarker")
##D summary(cens1)
##D coef(cens1)
##D logLik(cens1)
##D 
##D ## compare estimates
##D tab <- data.frame(cbind(true, initial, cens1$coeff[, 1]))
##D colnames(tab) <- c("true", "naive", "Weibull MLE")
##D rownames(tab) <- rownames(cens1$coeff)
##D tab
##D 
##D ## compare confidence intervals
##D ConvertWeibull(naive)$HR[, 2:3]
##D cens1$coeff[, 7:8]
##D 
##D 
##D ## --------------------------------------------------------------
##D ## model without the non-censored covariates
##D ## --------------------------------------------------------------
##D naive2 <- survreg(Surv(time, event) ~ var3.cens[, 2], dist = "weibull")
##D initial2 <- as.vector(ConvertWeibull(naive2)$vars[, 1])
##D 
##D ## use new method that takes into account the left-censoring of one covariate
##D formula <- formula(Surv(time, event) ~ Surv(time = var3.cens[, 1], time2 = var3.cens[, 2], 
##D                       type = "interval2"))
##D cens2 <- SurvRegCens(formula = formula, data = data, Density = DensityCens, initial = initial2, 
##D                       namCens = "biomarker")
##D summary(cens2)
##D 
##D ## compare estimates
##D tab <- data.frame(cbind(true[c(1, 2, 5)], initial2, cens2$coeff[, 1]))
##D colnames(tab) <- c("true", "naive", "Weibull MLE")
##D rownames(tab) <- rownames(cens2$coeff)
##D tab
##D 
##D ## compare confidence intervals
##D ConvertWeibull(naive2)$HR[, 2:3]
##D cens2$coeff[, 7:8]
## End(Not run)




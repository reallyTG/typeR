library(brms)


### Name: hypothesis.brmsfit
### Title: Non-Linear Hypothesis Testing
### Aliases: hypothesis.brmsfit hypothesis hypothesis.default

### ** Examples

## Not run: 
##D ## define priors
##D prior <- c(set_prior("normal(0,2)", class = "b"),
##D            set_prior("student_t(10,0,1)", class = "sigma"),
##D            set_prior("student_t(10,0,1)", class = "sd"))
##D 
##D ## fit a linear mixed effects models
##D fit <- brm(time ~ age + sex + disease + (1 + age|patient),
##D            data = kidney, family = lognormal(),
##D            prior = prior, sample_prior = TRUE, 
##D            control = list(adapt_delta = 0.95))
##D 
##D ## perform two-sided hypothesis testing
##D (hyp1 <- hypothesis(fit, "sexfemale = age + diseasePKD"))
##D plot(hyp1)
##D hypothesis(fit, "exp(age) - 3 = 0", alpha = 0.01)
##D 
##D ## perform one-sided hypothesis testing
##D hypothesis(fit, "diseasePKD + diseaseGN - 3 < 0")
##D 
##D hypothesis(fit, "age < Intercept", 
##D            class = "sd", group  = "patient")
##D 
##D ## test the amount of random intercept variance on all variance
##D h <- paste("sd_patient__Intercept^2 / (sd_patient__Intercept^2 +",
##D            "sd_patient__age^2 + sigma^2) = 0")
##D (hyp2 <- hypothesis(fit, h, class = NULL))
##D plot(hyp2)
##D 
##D ## test more than one hypothesis at once
##D h <- c("diseaseGN = diseaseAN", "2 * diseaseGN - diseasePKD = 0")
##D (hyp3 <- hypothesis(fit, h))
##D plot(hyp3, ignore_prior = TRUE)
##D 
##D ## compute hypotheses for all levels of a grouping factor
##D hypothesis(fit, "age = 0", scope = "coef", group = "patient")
##D 
##D ## use the default method
##D dat <- as.data.frame(fit)
##D hypothesis(dat, "b_age > 0")
## End(Not run)





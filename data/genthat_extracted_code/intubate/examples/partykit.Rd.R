library(intubate)


### Name: partykit
### Title: Interfaces for partykit package for data science pipelines.
### Aliases: ntbt_glmtree ntbt_lmtree ntbt_palmtree
### Keywords: intubate magrittr partykit cforest ctree glmtree lmtree mob
###   palmtree

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(partykit)
##D 
##D 
##D ## ntbt_cforest: Conditional Random Forests
##D 
##D ## Original function to interface
##D cf <- cforest(dist ~ speed, data = cars)
##D 
##D ## The interface puts data as first parameter
##D cf <- ntbt_cforest(cars, dist ~ speed)
##D 
##D ## so it can be used easily in a pipeline.
##D cf <- cars %>%
##D   ntbt_cforest(dist ~ speed)
##D 
##D 
##D ## ntbt_ctree: Conditional Inference Trees
##D airq <- subset(airquality, !is.na(Ozone))
##D 
##D ## Original function to interface
##D airct <- ctree(Ozone ~ ., data = airq)
##D plot(airct)
##D 
##D ## The interface puts data as first parameter
##D airct <- ntbt_ctree(airq, Ozone ~ .)
##D plot(airct)
##D 
##D ## so it can be used easily in a pipeline.
##D airq %>%
##D   ntbt_ctree(Ozone ~ .) %>%
##D   plot()
##D 
##D 
##D ## ntbt_glmtree: Generalized Linear Model Trees
##D data("PimaIndiansDiabetes", package = "mlbench")
##D 
##D ## Original function to interface
##D pid_tree2 <- glmtree(diabetes ~ glucose | pregnant +
##D                        pressure + triceps + insulin + mass + pedigree + age,
##D                      data = PimaIndiansDiabetes, family = binomial)
##D plot(pid_tree2)
##D 
##D ## The interface puts data as first parameter
##D pid_tree2 <- ntbt_glmtree(PimaIndiansDiabetes, diabetes ~ glucose | pregnant +
##D                             pressure + triceps + insulin + mass + pedigree + age,
##D                           family = binomial)
##D plot(pid_tree2)
##D 
##D ## so it can be used easily in a pipeline.
##D PimaIndiansDiabetes %>%
##D   ntbt_glmtree(diabetes ~ glucose | pregnant +
##D                  pressure + triceps + insulin + mass + pedigree + age,
##D                family = binomial) %>%
##D   plot()
##D 
##D 
##D ## ntbt_lmtree: Linear Model Trees
##D data("BostonHousing", package = "mlbench")
##D BostonHousing <- 
##D   transform(BostonHousing,
##D             chas = factor(chas, levels = 0:1, labels = c("no", "yes")),
##D             rad = factor(rad, ordered = TRUE))
##D 
##D ## Original function to interface
##D bh_tree <- lmtree(medv ~ log(lstat) + I(rm^2) | zn + indus + chas +
##D                     nox + age + dis + rad + tax + crim + b + ptratio,
##D                   data = BostonHousing, minsize = 40)
##D plot(bh_tree)
##D 
##D ## The interface puts data as first parameter
##D bh_tree <- ntbt_lmtree(BostonHousing,
##D                        medv ~ log(lstat) + I(rm^2) | zn + indus + chas +
##D                          nox + age + dis + rad + tax + crim + b + ptratio,
##D                        minsize = 40)
##D plot(bh_tree)
##D 
##D ## so it can be used easily in a pipeline.
##D BostonHousing %>%
##D   ntbt_lmtree(medv ~ log(lstat) + I(rm^2) | zn + indus + chas +
##D                 nox + age + dis + rad + tax + crim + b + ptratio,
##D               minsize = 40) %>%
##D   plot()
##D 
##D 
##D ## ntbt_mob: Model-based Recursive Partitioning
##D data("PimaIndiansDiabetes", package = "mlbench")
##D 
##D logit <- function(y, x, start = NULL, weights = NULL, offset = NULL, ...) {
##D   glm(y ~ 0 + x, family = binomial, start = start, ...)
##D }
##D 
##D ## Original function to interface
##D pid_tree <- mob(diabetes ~ glucose | pregnant + pressure + triceps + insulin +
##D                   mass + pedigree + age, data = PimaIndiansDiabetes, fit = logit)
##D plot(pid_tree)
##D 
##D ## The interface puts data as first parameter
##D pid_tree <- ntbt_mob(PimaIndiansDiabetes, diabetes ~ glucose | pregnant + pressure +
##D                        triceps + insulin + mass + pedigree + age, fit = logit)
##D plot(pid_tree)
##D 
##D ## so it can be used easily in a pipeline.
##D PimaIndiansDiabetes %>%
##D   ntbt_mob(diabetes ~ glucose | pregnant + pressure +
##D              triceps + insulin + mass + pedigree + age, fit = logit) %>%
##D   plot()
##D 
##D 
##D ## ntbt_palmtree: Partially Additive (Generalized) Linear Model Trees
##D dgp <- function(nobs = 1000, nreg = 5, creg = 0.4, ptreat = 0.5, sd = 1,
##D   coef = c(1, 0.25, 0.25, 0, 0, -0.25), eff = 1)
##D {
##D   d <- mvtnorm::rmvnorm(nobs,
##D     mean = rep(0, nreg),
##D     sigma = diag(1 - creg, nreg) + creg)
##D   colnames(d) <- paste0("x", 1:nreg)
##D   d <- as.data.frame(d)
##D   d$a <- rbinom(nobs, size = 1, prob = ptreat)
##D   d$err <- rnorm(nobs, mean = 0, sd = sd)
##D 
##D   gopt <- function(d) {
##D     as.numeric(d$x1 > -0.545) * as.numeric(d$x2 < 0.545)
##D   }
##D   d$y <- coef[1] + drop(as.matrix(d[, paste0("x", 1:5)]) %*% coef[-1]) -
##D     eff * (d$a - gopt(d))^2 + d$err
##D   d$a <- factor(d$a)
##D   return(d)
##D }
##D set.seed(1)
##D d <- dgp()
##D 
##D ## Original function to interface
##D palm <- palmtree(y ~ a | x1 + x2 + x5 | x1 + x2 + x3 + x4 + x5, data = d)
##D plot(palm)
##D 
##D ## The interface puts data as first parameter
##D palm <- ntbt_palmtree(d, y ~ a | x1 + x2 + x5 | x1 + x2 + x3 + x4 + x5)
##D plot(palm)
##D 
##D ## so it can be used easily in a pipeline.
##D d %>%
##D   ntbt_palmtree(y ~ a | x1 + x2 + x5 | x1 + x2 + x3 + x4 + x5) %>%
##D   plot()
## End(Not run)




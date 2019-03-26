library(trtf)


### Name: traforest
### Title: Transformation Forests
### Aliases: traforest predict.traforest logLik.traforest
### Keywords: trees

### ** Examples


### Example: Personalised Medicine Using Partitioned and Aggregated Cox-Models
### A combination of <DOI:10.1177/0962280217693034> and <arXiv:1701.02110>
### based on infrastructure in the mlt R add-on package described in
### https://cran.r-project.org/web/packages/mlt.docreg/vignettes/mlt.pdf

library("trtf")
library("survival")
### German Breast Cancer Study Group 2 data set
data("GBSG2", package = "TH.data")

### set-up Cox model with overall treatment effect in hormonal therapy
yvar <- numeric_var("y", support = c(100, 2000), bounds = c(0, Inf))
By <- Bernstein_basis(yvar, order = 5, ui = "incre")
m <- ctm(response = By, shifting = ~ horTh, todistr = "MinExt", data = GBSG2)
GBSG2$y <- with(GBSG2, Surv(time, cens))

### overall log-hazard ratio
coef(cmod <- mlt(m, data = GBSG2))["horThyes"]
### roughly the same as 
coef(coxph(y ~ horTh, data = GBSG2))

## Not run: 
##D 
##D ### estimate age-dependent Cox models (here ignoring all other covariates)
##D ctrl <- ctree_control(minsplit = 50, minbucket = 20, mincriterion = 0)
##D set.seed(290875)
##D tf_cmod <- traforest(m, formula = y ~ horTh | age, control = ctrl, 
##D                      ntree = 50, mtry = 1, trace = TRUE, data = GBSG2)
##D 
##D ### plot age-dependent treatment effects vs. overall treatment effect
##D nd <- data.frame(age = 30:70)
##D cf <- predict(tf_cmod, newdata = nd, type = "coef")
##D nd$logHR <- sapply(cf, function(x) x["horThyes"])
##D plot(logHR ~ age, data = nd, pch = 19, xlab = "Age", ylab = "log-Hazard Ratio")
##D abline(h = coef(cmod <- mlt(m, data = GBSG2))["horThyes"])
##D ### treatment most beneficial in very young patients
##D ### NOTE: scale of log-hazard ratios depends on
##D ### corresponding baseline hazard function which  _differs_
##D ### across age; interpretation of positive / negative treatment effect is,
##D ### however, save.
##D 
##D ### mclapply doesn't work in Windows
##D if (.Platform$OS.type != "windows") {
##D 
##D   ### computing predictions: predicted coefficients
##D   cf1 <- predict(tf_cmod, newdata = nd, type = "coef")
##D   ### speedup with plenty of RAM and 4 cores
##D   cf2 <- predict(tf_cmod, newdata = nd, cores = 4, type = "coef")
##D   ### memory-efficient with low RAM and _one_ core
##D   cf3 <- predict(tf_cmod, newdata = nd, cores = 4, applyfun = lapply, type = "coef")
##D   all.equal(cf1, cf2)
##D   all.equal(cf1, cf3)
##D 
##D }
##D 
## End(Not run)





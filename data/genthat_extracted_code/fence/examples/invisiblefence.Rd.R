library(fence)


### Name: invisiblefence
### Title: Invisible Fence model selection
### Aliases: invisiblefence

### ** Examples

## Not run: 
##D data("X.lmer")
##D data = data.frame(X.lmer)
##D beta = matrix(c(0, 1, 1, 1, 1, 0, 0.1, 0.05, 0.25, 0), ncol = 1)
##D set.seed(1234)
##D alpha = rep(rnorm(100), each = 3)
##D mu = alpha + as.matrix(data[,-1]) %*% beta
##D data$id = as.factor(data$id)
##D data$y = mu + rnorm(300)
##D raw = "y ~ (1|id)+I.col.2+I.col.3a+I.col.3b"
##D for (i in 5:10) {
##D     raw = paste0(raw, "+V", i)
##D }
##D full = as.formula(raw)
##D obj1.lmer = IF.lmer(full = full, data = data, B = 100, method="conditional",lftype = "abscoef")
##D obj1.lmer$model$coefficients
##D obj2.lmer = IF.lmer(full = full, data = data, B = 100, method="conditional",lftype = "tvalue")
##D obj2.lmer$model$coefficients
##D obj1.lm = IF.lmer(full = full, data = data, B = 100, method="marginal", lftype = "abscoef")
##D obj1.lm$model$coefficients
##D obj2.lm = IF.lmer(full = full, data = data, B = 100, method="marginal", lftype = "tvalue")
##D obj2.lm$model$coefficients
## End(Not run)




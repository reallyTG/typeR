library(fence)


### Name: IF.lmer
### Title: Invisible Fence model selection (Linear Mixed Model)
### Aliases: IF.lmer

### ** Examples

require(fence)
library(snow)
library(MASS)
data("X.lmer")
data = data.frame(X.lmer)
# non-zero beta I.col.2, I.col.3a, I.col.3b, V5, V7, V8, V9
beta = matrix(c(0, 1, 1, 1, 1, 0, 0.1, 0.05, 0.25, 0), ncol = 1)
set.seed(1234)
alpha = rep(rnorm(100), each = 3)
mu = alpha + as.matrix(data[,-1]) %*% beta
data$id = as.factor(data$id)
data$y = mu + rnorm(300)
raw = "y ~ (1|id)+I.col.2+I.col.3a+I.col.3b"
for (i in 5:10) {
    raw = paste0(raw, "+V", i)
}
full = as.formula(raw)
# The following output takes more than 5 seconds (~70 seconds) to run. 

# obj1.lmer = IF.lmer(full = full, data = data, B = 100, method="conditional",lftype = "abscoef")
# sort(obj1.lmer$model) 

# obj2.lmer = IF.lmer(full = full, data = data, B = 100, method="conditional",lftype = "tvalue")
# sort(obj2.lmer$model)

# Similarly, the following scenarios can be run

# obj2.lmer = IF.lmer(full = full, data = data, B = 100, method="conditional",lftype = "tvalue")
# sort(obj2.lmer$model)
# obj1.lm = IF.lmer(full = full, data = data, B = 100, method="marginal", lftype = "abscoef")
# sort(names(obj1.lm$model$coefficients[-1]))
# obj2.lm = IF.lmer(full = full, data = data, B = 100, method="marginal", lftype = "tvalue")
# sort(names(obj2.lm$model$coefficients[-1]))





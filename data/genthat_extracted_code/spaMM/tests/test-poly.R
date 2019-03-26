cat("\ntest poly():\n")

set.seed(123)
d <- data.frame(x = 1:10, y = rnorm(10))

m1 <- fitme(y ~ x + I(x^2), data = d)
m2 <- fitme(y ~ poly(x, 2, raw = TRUE), data = d)
m3 <- fitme(y ~ poly(x, 2), data = d)
testthat::expect_true(diff(range(c(-11.1162027435,logLik(m1),logLik(m2),logLik(m3))))<1e-7) 

p1 <- predict(m1, newdata = data.frame(x = 2)) 
p2 <- predict(m2, newdata = data.frame(x = 2)) 
p3 <- predict(m3, newdata = data.frame(x = 2))  
testthat::expect_true(diff(range(c(0.1018852,p1,p2,p3)))<1e-7) 

## with a random effect
set.seed(123)
data_test <- data.frame(x = rnorm(100), id = as.character(1:100))
d <- data_test[rep(1:nrow(data_test), each = 10), ]
d$y <- rnorm(nrow(d))
mod <- fitme(y ~ poly(x, 2) + (1|id), data = d)
new_data <- data.frame(x = 2, id = d$id[1])
abyss <- simulate(mod, newdata = new_data[rep(1L,100),], type="residual")

## 
if (spaMM.getOption("example_maxtime")>6) {
  set.seed(123)
  data_test <- data.frame(x = factor(runif(100)>0.5), id = as.character(1:100))
  d <- data_test[rep(1:nrow(data_test), each = 10), ]
  ranef <- structure(rnorm(length(unique(d$id)),sd = 0.666),names=levels(d$id))
  d$y <- rnorm(nrow(d))+ranef[d$id]
  mod <- fitme(y ~ x + (1|id), data = d)
  new_data <- expand.grid(x = "FALSE", id = d$id[1])
  var(drop(simulate(mod, newdata = new_data, nsim = 100000, type = "residual"))) ## OK ~1.02722
  var(drop(simulate(mod, newdata = new_data, nsim = 100000, type = "marginal"))) ## OK ~1.02722+0.3396
  mean(simulate(mod, newdata = new_data, nsim = 100000, type = "marginal")) ## OK ~Intercept =0.02889 as x is FALSE
  mean(simulate(mod, newdata = new_data, nsim = 100000, type = "residual")) ## OK ~0.02889+ 0.2051344=ranef(mod)[[1L]][paste(d$id[1])]
}

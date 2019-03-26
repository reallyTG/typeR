library("model4you")
library("mvtnorm")
library("survival")
set.seed(123)

## function to simulate the data
sim_data <- function(n = 500, p = 10, beta = 3, sd = 1){

  ## treatment
  lev <- c("C", "A")
  a <- rep(factor(lev, labels = lev, levels = lev), length = n)

  ## correlated z variables
  sigma <- diag(p)
  sigma[sigma == 0] <- 0.2
  ztemp <- rmvnorm(n, sigma = sigma)
  z <- (pnorm(ztemp) * 2 * pi) - pi
  colnames(z) <- paste0("z", 1:ncol(z))
  z1 <- z[,1]

  ## outcome
  y <- 7 + 0.2 * (a %in% "A") + beta * cos(z1) * (a %in% "A") + rnorm(n, 0, sd)

  data.frame(y = y, a = a, z)
}

## simulate data
beta <- 3
ntrain <- 500
ntest <- 100
simdata <- simdata_s <- sim_data(p = 5, beta = beta, n = ntrain)
tsimdata <- tsimdata_s <- sim_data(p = 5, beta = beta, n = ntest)
simdata_s$cens <- rep(1, ntrain)
tsimdata_s$cens <- rep(1, ntest)

## base model
basemodel_lm <- lm(y ~ a, data = simdata)
basemodel_wb <- survreg(Surv(y, cens) ~ a, data = simdata_s)

## forest
frst_lm <- pmforest(basemodel_lm, ntree = 10,
                    perturb = list(replace = FALSE, fraction = 0.632),
                    control = ctree_control(mincriterion = 0, lookahead = TRUE))
frst_wb <- pmforest(basemodel_wb, ntree = 10,
                    perturb = list(replace = FALSE, fraction = 0.632),
                    control = ctree_control(mincriterion = 0, lookahead = TRUE))

## personalised models
coefs_lm <- pmodel(x = frst_lm, newdata = tsimdata)
summary(coefs_lm)


coeffun <- function(model) {
  ## model coefficients
  coefs <- c(coef(model), scale = model$scale)

  ## difference in median survival
  p = 0.5
  coefs["median_s0"] <- qweibull(p = p, shape = 1/coefs["scale"],
                                 scale = exp(coefs["(Intercept)"]))
  coefs["median_s1"] <- qweibull(p = p, shape = 1/coefs["scale"],
                                 scale = exp(coefs["(Intercept)"] + coefs["aA"]))
  coefs["median_sdiff"] <- coefs["median_s1"] - coefs["median_s0"]

  return(coefs)
}
coefs_wb <- pmodel(x = frst_wb, newdata = tsimdata_s,
                   fun = coeffun)
summary(coefs_wb)


## Variable importance
set.seed(123)
(vi_lm <- varimp(frst_lm))
(vi_wb <- varimp(frst_wb))

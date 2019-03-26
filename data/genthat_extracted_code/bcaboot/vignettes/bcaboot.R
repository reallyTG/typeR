## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(
    message = FALSE,
    warning = FALSE,
    error = FALSE,
    tidy = FALSE,
    cache = FALSE
)
library(bcaboot)

## ------------------------------------------------------------------------
data(diabetes, package = "bcaboot")
Xy <- cbind(diabetes$x, diabetes$y)
rfun <- function(Xy) {
    y <- Xy[, 11]
    X <- Xy[, 1:10]
    summary(lm(y ~ X) )$adj.r.squared
}

## ------------------------------------------------------------------------
set.seed(1234)
result <- bcajack(x = Xy, B = 2000, func = rfun, verbose = FALSE)

## ------------------------------------------------------------------------
knitr::kable(result$lims, digits = 3)

## ------------------------------------------------------------------------
knitr::kable(result$stats, digits = 3)

## ------------------------------------------------------------------------
bcaplot(result)

## ---- echo = FALSE-------------------------------------------------------
if (!requireNamespace("glmnet", quietly = TRUE)) {
    stop("Please install glmnet package for this vignette.")
}
load(system.file("extdata", "neonates.rda", package = "bcaboot"))

## ------------------------------------------------------------------------
str(neonates)

## ------------------------------------------------------------------------
weights <- with(neonates, ifelse(y == 0, 1, 4))
glm_model <- glm(formula = y ~ ., family = "binomial", weights = weights, data = neonates)
summary(glm_model)

## ------------------------------------------------------------------------
glm_boot <- function(B, glm_model, weights, var = "resp") {
    pi_hat <- glm_model$fitted.values
    n <- length(pi_hat)
    y_star <- sapply(seq_len(B), function(i) ifelse(runif(n) <= pi_hat, 1, 0))
    beta_star <- apply(y_star, 2, function(y) {
        boot_data <- glm_model$data
        boot_data$y <- y
        coef(glm(formula = y ~ ., data = boot_data, weights = weights, family = "binomial"))
    })
    list(theta = coef(glm_model)[var],
         theta_star = beta_star[var, ],
         suff_stat = t(y_star) %*% model.matrix(glm_model))
}

## ------------------------------------------------------------------------
set.seed(3891)
glm_boot_out <- glm_boot(B = 2000, glm_model = glm_model, weights = weights)
glm_bca <- bcapar(t0 = glm_boot_out$theta,
                  tt = glm_boot_out$theta_star,
                  bb = glm_boot_out$suff_stat)

## ------------------------------------------------------------------------
knitr::kable(glm_bca$lims, digits = 3)

## ------------------------------------------------------------------------
knitr::kable(glm_bca$stats, digits = 3)

## ------------------------------------------------------------------------
X <- as.matrix(neonates[, seq_len(11)]) ; Y <- neonates$y;
glmnet_model <- glmnet::cv.glmnet(x = X, y = Y, family = "binomial", weights = weights)

## ------------------------------------------------------------------------
coefs <- as.matrix(coef(glmnet_model, s = glmnet_model$lambda.min))
knitr::kable(data.frame(variable = rownames(coefs), coefficient = coefs[, 1]), row.names = FALSE, digits = 3)

## ------------------------------------------------------------------------
glmnet_boot <- function(B, X, y, glmnet_model, weights, var = "resp") {
    lambda <- glmnet_model$lambda.min
    theta <- as.matrix(coef(glmnet_model, s = lambda))
    pi_hat <- predict(glmnet_model, newx = X, s = "lambda.min", type = "response")
    n <- length(pi_hat)
    y_star <- sapply(seq_len(B), function(i) ifelse(runif(n) <= pi_hat, 1, 0))
    beta_star <- apply(y_star, 2,
                       function(y) {
                           as.matrix(coef(glmnet::glmnet(x = X, y = y, lambda = lambda, weights = weights, family = "binomial")))
                       })

    rownames(beta_star) <- rownames(theta)
    list(theta = theta[var, ],
         theta_star = beta_star[var, ],
         suff_stat = t(y_star) %*% X)
}

## ------------------------------------------------------------------------
glmnet_boot_out <- glmnet_boot(B = 2000, X, y, glmnet_model, weights)
glmnet_bca <- bcapar(t0 = glmnet_boot_out$theta,
                     tt = glmnet_boot_out$theta_star,
                     bb = glmnet_boot_out$suff_stat)

## ------------------------------------------------------------------------
knitr::kable(glmnet_bca$lims, digits = 3)

## ------------------------------------------------------------------------
knitr::kable(glmnet_bca$stats, digits = 3)

## ---- echo = FALSE-------------------------------------------------------
opar <- par(mfrow = c(1, 2))
bcaplot(glm_bca)
bcaplot(glmnet_bca)
par(opar)

## ------------------------------------------------------------------------
ratio_boot <- function(B, v1, v2) {
    s1 <- sqrt(v1) * rchisq(n = B, df = n1)  / n1
    s2 <- sqrt(v2) * rchisq(n = B, df = n2)  / n2
    theta_star <- s1 / s2
    beta_star <- cbind(s1, s2)
    list(theta = v1 / v2,
         theta_star = theta_star,
         suff_stat = beta_star)
}

funcF <- function(beta) {
    beta[1] / beta[2]
}

## ------------------------------------------------------------------------
B <- 16000; n1 <- 10; n2 <- 42
ratio_boot_out <- ratio_boot(B, 1, 1)
result <- bcapar(t0 = ratio_boot_out$theta,
                 tt = ratio_boot_out$theta_star,
                 bb = ratio_boot_out$suff_stat, func = funcF)

## ------------------------------------------------------------------------
exact <- 1 / qf(df1 = n1, df2 = n2, p = 1 - as.numeric(rownames(result$lims)))
knitr::kable(cbind(result$lims, exact = exact), digits = 3)

## ------------------------------------------------------------------------
knitr::kable(result$stats, digits = 3)

## ------------------------------------------------------------------------
knitr::kable(result$abcstats, digits = 3)

## ------------------------------------------------------------------------
knitr::kable(result$ustats, digits = 3)

## ------------------------------------------------------------------------
bcaplot(result)


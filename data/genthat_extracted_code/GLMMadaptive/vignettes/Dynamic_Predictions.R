## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library("GLMMadaptive")
library("lattice")
trellis.par.set(par.xlab.text = list(cex = 1.1),
                par.ylab.text = list(cex = 1.1),
                axis.text = list(cex = 0.8), 
                strip.border = list(cex = 0.8))

## ---- simulate_data------------------------------------------------------
set.seed(12345)
n <- 500 # number of subjects
K <- 10 # number of measurements per subject
t_max <- 4 # maximum follow-up time

# we constuct a data frame with the design: 
# everyone has a baseline measurment, and then measurements at random follow-up times
DF <- data.frame(id = rep(seq_len(n), each = K),
                 time = c(replicate(n, c(0, sort(runif(K - 1, 0, t_max))))),
                 sex = rep(gl(2, n/2, labels = c("male", "female")), each = K))

# design matrices for the fixed and random effects non-zero part
X <- model.matrix(~ sex * time, data = DF)
Z <- model.matrix(~ 1, data = DF)
# design matrices for the fixed and random effects zero part
X_zi <- model.matrix(~ sex, data = DF)
Z_zi <- model.matrix(~ 1, data = DF)

betas <- c(0.8, -0.5, 0.8, -0.5) # fixed effects coefficients non-zero part
shape <- 2 # shape/size parameter of the negative binomial distribution
gammas <- c(-2.5, 0.5) # fixed effects coefficients zero part
D11 <- 1.0 # variance of random intercepts non-zero part
D22 <- 0.8 # variance of random intercepts zero part

# we simulate random effects
b <- cbind(rnorm(n, sd = sqrt(D11)), rnorm(n, sd = sqrt(D22)))
# linear predictor non-zero part
eta_y <- as.vector(X %*% betas + rowSums(Z * b[DF$id, 1, drop = FALSE]))
# linear predictor zero part
eta_zi <- as.vector(X_zi %*% gammas + rowSums(Z_zi * b[DF$id, 2, drop = FALSE]))
# we simulate negative binomial longitudinal data
DF$y <- rnbinom(n * K, size = shape, mu = exp(eta_y))
# we set the extra zeros
DF$y[as.logical(rbinom(n * K, size = 1, prob = plogis(eta_zi)))] <- 0

## ---- train_test_datasets------------------------------------------------
ids_train <- sample(500, 250)
DF_train <- DF[DF$id %in% ids_train, ]
DF_test <- DF[!DF$id %in% ids_train, ]

## ---- fit_models---------------------------------------------------------
fm1 <- mixed_model(y ~ sex * time, random = ~ 1 | id, data = DF_train,
                   family = poisson())

fm2 <- mixed_model(y ~ sex * time, random = ~ 1 | id, data = DF_train,
                   family = zi.negative.binomial(), 
                   zi_fixed = ~ sex, zi_random = ~ 1 | id)

## ---- calculate_predictions----------------------------------------------
preds_fm1 <- predict(fm1, newdata = DF_test[DF_test$time < 2, ],
                     newdata2 = DF_test[DF_test$time >= 2, ], 
                     type = "subject_specific",
                     se.fit = TRUE, return_newdata = TRUE)

preds_fm2 <- predict(fm2, newdata = DF_test[DF_test$time < 2, ],
                     newdata2 = DF_test[DF_test$time >= 2, ], 
                     type = "subject_specific",
                     se.fit = TRUE, return_newdata = TRUE)

## ---- combine_predictions_fm2--------------------------------------------
splt_data_pre <- split(preds_fm2$newdata, preds_fm2$newdata$id)
splt_data_post <- split(preds_fm2$newdata2, preds_fm2$newdata2$id)
pred_data <- do.call("rbind", mapply(rbind, splt_data_pre, splt_data_post, 
                                     SIMPLIFY = FALSE))

## ---- dyn_preds_fig, fig.align = "center", fig.width = 8.5, fig.height = 7.5----
ids <- sample(pred_data$id, 9)

key <- list(space = "top", rep = FALSE, adj = 1,
            text = list(c("Observed Counts")),
            points = list(pch = 1, col = 1), 
            text = list(c("Expected Counts", "95% Confidence Interval")),
            lines = list(lty = c(1, 2), col = c(2, 1)),
            text = list("RE estimates\n info period"),
            lines = list(lty = 3, col = 1))

xyplot(y + pred + low + upp ~ time | factor(id), data = pred_data, 
       subset = id %in% ids, layout = c(3, 3),
       type = c("p", rep("l", 3)), distribute.type = TRUE, 
       lty = c(0, 1, 2, 2), col = c(1, 2, 1, 1), key = key,
       abline = list(v = 2, lty = 3), scales = list(y = list(relation = "free")),
       xlab = "Follow-up Time", ylab = "Counts")

## ---- qzinbinom----------------------------------------------------------
qzinbinom <- function (p, mu, shape, zi_probs) {
    pnew <- (p - zi_probs) / (1 - zi_probs)
    qnbinom(pmax(pnew, 0), mu = mu, size = shape)
}

## ----zi_probs------------------------------------------------------------
zi_probs_data <- data.frame(zi_probs = attr(preds_fm2$newdata$pred, "zi_probs"),
                            zi_probs_low = attr(preds_fm2$newdata$low, "zi_probs"),
                            zi_probs_upp = attr(preds_fm2$newdata$upp, "zi_probs"))

zi_probs_data2 <- data.frame(zi_probs = attr(preds_fm2$newdata2$pred, "zi_probs"),
                            zi_probs_low = attr(preds_fm2$newdata2$low, "zi_probs"),
                            zi_probs_upp = attr(preds_fm2$newdata2$upp, "zi_probs"))

splt_data_pre <- split(zi_probs_data, preds_fm2$newdata$id)
splt_data_post <- split(zi_probs_data2, preds_fm2$newdata2$id)
zi_probs <- do.call("rbind", mapply(rbind, splt_data_pre, splt_data_post, 
                                    SIMPLIFY = FALSE))

## ----CI_shape------------------------------------------------------------
CI_shape <- confint(fm2, "extra")

## ---- Pred_Interval------------------------------------------------------
pred_data$lowPI <- qzinbinom(0.025, pred_data$low, CI_shape[, "2.5 %"], 
                             zi_probs$zi_probs_upp)
pred_data$uppPI <- qzinbinom(0.975, pred_data$upp, CI_shape[, "97.5 %"], 
                             zi_probs$zi_probs_low)

## ---- dyn_preds_fig_PI, fig.align = "center", fig.width = 8.5, fig.height = 7.5----
key <- list(space = "top", rep = FALSE, adj = 1,
            text = list(c("Observed Counts")),
            points = list(pch = 1, col = 1), 
            text = list(c("Expected Counts", "95% Prediction Interval")),
            lines = list(lty = c(1, 2), col = c(2, 1)),
            text = list("RE estimates\n info period"),
            lines = list(lty = 3, col = 1))

xyplot(y + pred + lowPI + uppPI ~ time | factor(id), data = pred_data, 
       subset = id %in% ids, layout = c(3, 3),
       type = c("p", rep("l", 3)), distribute.type = TRUE, 
       lty = c(0, 1, 2, 2), col = c(1, 2, 1, 1), key = key,
       abline = list(v = 2, lty = 3), scales = list(y = list(relation = "free")),
       xlab = "Follow-up Time", ylab = "Counts")

## ---- scoring_rules------------------------------------------------------
scr_fm1 <- scoring_rules(fm1, newdata = DF_test[DF_test$time < 2, ],
                         newdata2 = DF_test[DF_test$time >= 2, ],
                         return_newdata = TRUE, max_count = 3000)

scr_fm2 <- scoring_rules(fm2, newdata = DF_test[DF_test$time < 2, ],
                         newdata2 = DF_test[DF_test$time >= 2, ],
                         return_newdata = TRUE, max_count = 3000)

## ---- combine_data_scr_rules---------------------------------------------
scr_fm2 <- scr_fm2[c("logarithmic", "quadratic", "spherical")]
names(scr_fm2) <- paste0(names(scr_fm2), "2")
scoring_data <- as.data.frame(c(scr_fm1, scr_fm2))

## ---- fig_scr_rules, fig.align = "center", fig.width = 8.5, fig.height = 7.5----
key <- list(space = "top",
            text = list(c("Poisson", "ZI Negative Binomial")),
            lines = list(lty = c(1, 1), col = c(1, 2), lwd = c(2, 2)))

xyplot(spherical + spherical2 ~ time, data = scoring_data,
       type = c("p", "smooth"), pch = ".", col = c(1, 2),
       xlab = "Follow-up Time", ylab = "Spherical Scoring Rule",
       key = key)

## ---- fig_scr_rules2, fig.align = "center", fig.width = 8.5, fig.height = 7.5----
xyplot(logarithmic + logarithmic2 ~ time, data = scoring_data,
       type = c("p", "smooth"), pch = ".", col = c(1, 2),
       xlab = "Follow-up Time", ylab = "Logarithmic Scoring Rule",
       key = key, ylim = c(-8, 0.5))


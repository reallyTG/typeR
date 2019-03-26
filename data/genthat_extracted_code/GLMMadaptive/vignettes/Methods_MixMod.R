## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library("GLMMadaptive")

## ------------------------------------------------------------------------
set.seed(1234)
n <- 100 # number of subjects
K <- 8 # number of measurements per subject
t_max <- 15 # maximum follow-up time

# we constuct a data frame with the design: 
# everyone has a baseline measurment, and then measurements at random follow-up times
DF <- data.frame(id = rep(seq_len(n), each = K),
                 time = c(replicate(n, c(0, sort(runif(K - 1, 0, t_max))))),
                 sex = rep(gl(2, n/2, labels = c("male", "female")), each = K))

# design matrices for the fixed and random effects
X <- model.matrix(~ sex * time, data = DF)
Z <- model.matrix(~ time, data = DF)

betas <- c(-2.13, -0.25, 0.24, -0.05) # fixed effects coefficients
D11 <- 0.48 # variance of random intercepts
D22 <- 0.1 # variance of random slopes

# we simulate random effects
b <- cbind(rnorm(n, sd = sqrt(D11)), rnorm(n, sd = sqrt(D22)))
# linear predictor
eta_y <- as.vector(X %*% betas + rowSums(Z * b[DF$id, ]))
# we simulate binary longitudinal data
DF$y <- rbinom(n * K, 1, plogis(eta_y))

## ------------------------------------------------------------------------
fm <- mixed_model(fixed = y ~ sex * time, random = ~ time | id, data = DF,
                  family = binomial())

## ------------------------------------------------------------------------
fm

## ------------------------------------------------------------------------
summary(fm)

## ------------------------------------------------------------------------
exp(confint(fm))

## ------------------------------------------------------------------------
confint(fm, parm = "var-cov", level = 0.90)

## ------------------------------------------------------------------------
vcov(fm)

## ------------------------------------------------------------------------
vcov(fm, sandwich = TRUE)

## ------------------------------------------------------------------------
fixef(fm)

## ------------------------------------------------------------------------
head(ranef(fm))

## ------------------------------------------------------------------------
head(coef(fm))

## ------------------------------------------------------------------------
marginal_coefs(fm)

## ---- eval = FALSE-------------------------------------------------------
#  marginal_coefs(fm, std_errors = TRUE)

## ------------------------------------------------------------------------
head(fitted(fm))

## ------------------------------------------------------------------------
head(fitted(fm, type = "subject_specific"))

## ---- eval = FALSE-------------------------------------------------------
#  head(fitted(fm, type = "marginal"))

## ------------------------------------------------------------------------
nDF <- with(DF, expand.grid(time = seq(min(time), max(time), length.out = 15),
                            sex = levels(sex)))

## ------------------------------------------------------------------------
plot_data <- effectPlotData(fm, nDF)

## ---- fig.show="hold"----------------------------------------------------
library("lattice")
xyplot(pred + low + upp ~ time | sex, data = plot_data,
       type = "l", lty = c(1, 2, 2), col = c(2, 1, 1), lwd = 2,
       xlab = "Follow-up time", ylab = "log odds")

expit <- function (x) exp(x) / (1 + exp(x))
xyplot(expit(pred) + expit(low) + expit(upp) ~ time | sex, data = plot_data,
       type = "l", lty = c(1, 2, 2), col = c(2, 1, 1), lwd = 2,
       xlab = "Follow-up time", ylab = "Subject-Specific Probabilities")

## ---- eval = FALSE-------------------------------------------------------
#  plot_data_m <- effectPlotData(fm, nDF, marginal = TRUE, cores = 4)
#  
#  # we put the two groups in the same panel
#  my.panel.bands <- function(x, y, upper, lower, fill, col, subscripts, ..., font,
#                             fontface) {
#      upper <- upper[subscripts]
#      lower <- lower[subscripts]
#      panel.polygon(c(x, rev(x)), c(upper, rev(lower)), col = fill, border = FALSE, ...)
#  }
#  
#  xyplot(expit(pred) ~ time, group = sex, data = plot_data_m,
#         upper = expit(plot_data_m$upp), low = expit(plot_data_m$low),
#         type = "l", col = c("blue", "red"),
#         fill = c("#0000FF80", "#FF000080"),
#         panel = function (x, y, ...) {
#             panel.superpose(x, y, panel.groups = 'my.panel.bands', ...)
#             panel.xyplot(x, y, lwd = 2,  ...)
#  }, xlab = "Follow-up time", ylab = "Marginal Probabilities")

## ------------------------------------------------------------------------
gm <- mixed_model(fixed = y ~ sex * time, random = ~ time || id, data = DF,
                  family = binomial())

anova(gm, fm)

## ------------------------------------------------------------------------
pred_DF <- DF[DF$id == 1, ][1:4, ]
pred_DF$id <- paste0("N", as.character(pred_DF$id))
pred_DF

## ------------------------------------------------------------------------
predict(fm, newdata = pred_DF, type_pred = "response",
        type = "mean_subject", se.fit = TRUE)

## ---- eval = FALSE-------------------------------------------------------
#  predict(fm, newdata = pred_DF, type_pred = "response",
#          type = "marginal", se.fit = FALSE)

## ------------------------------------------------------------------------
predict(fm, newdata = pred_DF, type_pred = "response",
        type = "subject_specific", se.fit = TRUE)

## ------------------------------------------------------------------------
future_Times <- pred_DF[1:3, c("id", "time", "sex")]
future_Times$time <- c(3, 4, 10)
future_Times

## ------------------------------------------------------------------------
predict(fm, newdata = pred_DF, newdata2 = future_Times, type_pred = "response",
        type = "subject_specific", se.fit = TRUE)

## ------------------------------------------------------------------------
head(simulate(fm, nsim = 2, seed = 123), 10)

## ------------------------------------------------------------------------
head(simulate(fm, nsim = 2, seed = 123, acount_MLEs_var = TRUE), 10)


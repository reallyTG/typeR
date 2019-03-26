## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, warning=FALSE, message=FALSE, fig.align = 'center', fig.width = 6, fig.height = 4, cache = FALSE)

## ---- include=FALSE------------------------------------------------------
library("bookdown")

## ------------------------------------------------------------------------
library("SimRepeat")
library("printr")
library("nlme")
library("reshape2")
options(scipen = 999)

## ------------------------------------------------------------------------
seed <- 137
n <- 10000
M <- 3

# Ordinal variable
marginal <- lapply(seq_len(M), function(x) list(c(1/3, 2/3)))
support <- lapply(seq_len(M), function(x) list(c(0, 1, 2)))

# Non-mixture continuous variables
method <- "Polynomial"
Stcum1 <- calc_theory("Rice", c(1, 0.5))
Stcum2 <- calc_theory("Rice", c(2, 2))
Stcum3 <- calc_theory("Rice", c(4, 8))

# Error terms
error_type <- "non_mix"
Error1 <- calc_theory("Skewnormal", c(0, 1, 1))
Error2 <- calc_theory("Skewnormal", c(0, 1, 5))
Error3 <- calc_theory("Skewnormal", c(0, 1, 25))
corr.e <- matrix(c(1, 0.4, 0.4^2, 0.4, 1, 0.4, 0.4^2, 0.4, 1), M, M, 
  byrow = TRUE)

skews <- list(c(Stcum1[3], Error1[3]), c(Stcum2[3], Error2[3]), 
  c(Stcum3[3], Error3[3]))
skurts <- list(c(Stcum1[4], Error1[4]), c(Stcum2[4], Error2[4]), 
  c(Stcum3[4], Error3[4]))
fifths <- list(c(Stcum1[5], Error1[5]), c(Stcum2[5], Error2[5]), 
  c(Stcum3[5], Error3[5]))
sixths <- list(c(Stcum1[6], Error1[6]), c(Stcum2[6], Error2[6]), 
  c(Stcum3[6], Error3[6]))
Six <- list(list(0.08, 0.06), list(0.12, NULL), list(0.36, 0.15))

# Mixture continuous variable
mix_pis <- lapply(seq_len(M), function(x) list(c(0.3, 0.7)))
mix_mus <- lapply(seq_len(M), function(x) list(c(-5, 3)))
mix_sigmas <- lapply(seq_len(M), function(x) list(c(2, 1)))
mix_skews <- mix_skurts <- mix_fifths <- mix_sixths <- 
  lapply(seq_len(M), function(x) list(c(0, 0)))
mix_Six <- list()
Nstcum <- calc_mixmoments(mix_pis[[1]][[1]], mix_mus[[1]][[1]], 
  mix_sigmas[[1]][[1]], mix_skews[[1]][[1]], mix_skurts[[1]][[1]], 
  mix_fifths[[1]][[1]], mix_sixths[[1]][[1]])

means <- list(c(Stcum1[1], Nstcum[1], 0),
  c(Stcum2[1], Nstcum[1], 0),
  c(Stcum3[1], Nstcum[1], 0))
vars <- list(c(Stcum1[2]^2, Nstcum[2]^2, Error1[2]^2),
  c(Stcum2[2]^2, Nstcum[2]^2, Error2[2]^2),
  c(Stcum3[2]^2, Nstcum[2]^2, Error3[2]^2))

# Poisson variable
lam <- list(15, 15, 15)
p_zip <- 0.10

# Negative Binomial variables
size <- list(10, 10, 10)
mu <- list(3, 4, 5)
prob <- list()
p_zinb <- 0

# X_ord(1) and X_pois(1) are the same across Y
same.var <- c(1, 5)

# set up X correlation matrix
corr.x <- list()
corr.x[[1]] <- list(matrix(0.4, 6, 6), matrix(0.35, 6, 6), matrix(0.25, 6, 6))
diag(corr.x[[1]][[1]]) <- 1
# set correlations between components of X_mix(11) to 0
corr.x[[1]][[1]][3:4, 3:4] <- diag(2)
# set correlations between time-varying covariates of Y1 and Y2
corr.x[[1]][[2]][2, 2] <- 0.5
corr.x[[1]][[2]][3:4, 3:4] <- matrix(0.4, 2, 2)
corr.x[[1]][[2]][6, 6] <- 0.3
# set correlations between time-varying covariates of Y1 and Y3
corr.x[[1]][[3]][2, 2] <- 0.5^2
corr.x[[1]][[3]][3:4, 3:4] <- matrix(0.4^2, 2, 2)
corr.x[[1]][[3]][6, 6] <- 0.3^2
# set correlations for the same variables equal across outcomes
corr.x[[1]][[2]][, same.var] <- corr.x[[1]][[3]][, same.var] <-
  corr.x[[1]][[1]][, same.var]

corr.x[[2]] <- list(t(corr.x[[1]][[2]]), matrix(0.35, 6, 6), 
  matrix(0.25, 6, 6))
diag(corr.x[[2]][[2]]) <- 1
# set correlations between components of X_mix(21) to 0
corr.x[[2]][[2]][3:4, 3:4] <- diag(2)
# set correlations between time-varying covariates of Y2 and Y3
corr.x[[2]][[3]][2, 2] <- 0.5
corr.x[[2]][[3]][3:4, 3:4] <- matrix(0.4, 2, 2)
corr.x[[2]][[3]][6, 6] <- 0.3
# set correlations for the same variables equal across outcomes
corr.x[[2]][[2]][same.var, ] <- corr.x[[1]][[2]][same.var, ]
corr.x[[2]][[2]][, same.var] <- corr.x[[2]][[3]][, same.var] <- 
  t(corr.x[[1]][[2]][same.var, ])
corr.x[[2]][[3]][same.var, ] <- corr.x[[1]][[3]][same.var, ]

corr.x[[3]] <- list(t(corr.x[[1]][[3]]), t(corr.x[[2]][[3]]), 
  matrix(0.3, 6, 6))
diag(corr.x[[3]][[3]]) <- 1
# set correlations between components of X_mix(31) to 0
corr.x[[3]][[3]][3:4, 3:4] <- diag(2)
# set correlations for the same variables equal across outcomes
corr.x[[3]][[3]][same.var, ] <- corr.x[[1]][[3]][same.var, ]
corr.x[[3]][[3]][, same.var] <- t(corr.x[[3]][[3]][same.var, ])

Time <- 1:M
betas.0 <- 0
betas.t <- 1
# use a list of length 1 so that betas are the same across Y
betas <- list(seq(0.5, 1.5, 0.25))
# interaction between ordinal and Poisson variable, becomes 
# another group-level variable
int.var <- matrix(c(1, 1, 4, 2, 1, 4, 3, 1, 4), 3, 3, byrow = TRUE)
betas.int <- list(0.5)
# continuous non-mixture, continuous mixture, and NB variables are 
# subject-level variables
subj.var <- matrix(c(1, 2, 1, 3, 1, 5, 2, 2, 2, 3, 2, 5, 3, 2, 3, 3, 3, 5), 
  nrow = 9, ncol = 2, byrow = TRUE)
# there are 3 subject-level variables and 3 group-level variables forming 
# 9 group-subject interactions
betas.subj <- list(seq(0.5, 0.5 + (9 - 1) * 0.1, 0.1))
# only ordinal and Poisson variable interact with time (excluding the 
# ordinal-Poisson interaction variable)
tint.var <- matrix(c(1, 1, 1, 4, 2, 1, 2, 4, 3, 1, 3, 4), 6, 2, byrow = TRUE)
betas.tint <- list(c(0.25, 0.5))

## ------------------------------------------------------------------------
checkpar(M, method, error_type, means, vars, skews, skurts, fifths, sixths, 
  Six, mix_pis, mix_mus, mix_sigmas, mix_skews, mix_skurts, mix_fifths, 
  mix_sixths, mix_Six, marginal, support, lam, p_zip, pois_eps = list(), 
  size, prob, mu, p_zinb, nb_eps = list(), corr.x, corr.yx = list(), corr.e, 
  same.var, subj.var, int.var, tint.var, betas.0, betas, betas.subj, betas.int, 
  betas.t, betas.tint, quiet = TRUE)

## ------------------------------------------------------------------------
Sys1 <- corrsys(n, M, Time, method, error_type, means, vars,
  skews, skurts, fifths, sixths, Six, mix_pis, mix_mus, mix_sigmas, mix_skews,
  mix_skurts, mix_fifths, mix_sixths, mix_Six, marginal, support, lam, p_zip,
  size, prob, mu, p_zinb, corr.x, corr.e, same.var, subj.var, int.var,
  tint.var, betas.0, betas, betas.subj, betas.int, betas.t, betas.tint,
  seed = seed, use.nearPD = FALSE, quiet = TRUE)

## ------------------------------------------------------------------------
knitr::kable(Sys1$constants[[1]], booktabs = TRUE, 
  caption = "PMT constants for Y_1")
Sys1$valid.pdf

## ------------------------------------------------------------------------
Sum1 <- summary_sys(Sys1$Y, Sys1$E, E_mix = NULL, Sys1$X, Sys1$X_all, M, 
  method, means, vars, skews, skurts, fifths, sixths, mix_pis, mix_mus, 
  mix_sigmas, mix_skews, mix_skurts, mix_fifths, mix_sixths, marginal, 
  support, lam, p_zip, size, prob, mu, p_zinb, corr.x, corr.e)
names(Sum1)

## ------------------------------------------------------------------------
knitr::kable(Sum1$cont_sum_y, digits = 3, booktabs = TRUE, 
  caption = "Simulated Distributions of Outcomes")

## ------------------------------------------------------------------------
knitr::kable(Sum1$target_sum_e, digits = 3, booktabs = TRUE, 
  caption = "Target Distributions of Error Terms")

## ------------------------------------------------------------------------
knitr::kable(Sum1$cont_sum_e, digits = 3, booktabs = TRUE, 
  caption = "Simulated Distributions of Error Terms")

## ------------------------------------------------------------------------
knitr::kable(Sum1$target_sum_x, digits = 3, booktabs = TRUE, 
  caption = "Target Distributions of Continuous Non-Mixture and Components of 
  Mixture Variables")

## ------------------------------------------------------------------------
knitr::kable(Sum1$cont_sum_x, digits = 3, booktabs = TRUE, 
  caption = "Simulated Distributions of Continuous Non-Mixture and Components 
  of Mixture Variables")

## ------------------------------------------------------------------------
knitr::kable(Sum1$target_mix_x, digits = 3, booktabs = TRUE, 
  caption = "Target Distributions of Continuous Mixture Variables")

## ------------------------------------------------------------------------
knitr::kable(Sum1$mix_sum_x, digits = 3, booktabs = TRUE, 
  caption = "Simulated Distributions of Continuous Mixture Variables")

## ------------------------------------------------------------------------
Nplot <- plot_simpdf_theory(sim_y = Sys1$X_all[[1]][, 3], ylower = -10, 
  yupper = 10, 
  title = "PDF of X_mix(21): N(-5, 2) and N(3, 1) Mixture",
  fx = function(x) mix_pis[[1]][[1]][1] * dnorm(x, mix_mus[[1]][[1]][1], 
    mix_sigmas[[1]][[1]][1]) + mix_pis[[1]][[1]][2] * 
    dnorm(x, mix_mus[[1]][[1]][2], mix_sigmas[[1]][[1]][2]), 
  lower = -Inf, upper = Inf)
Nplot

## ------------------------------------------------------------------------
knitr::kable(Sum1$ord_sum_x[[1]][1:2, ], digits = 3, row.names = FALSE,
             booktabs = TRUE, caption = "Simulated Distribution of X_ord(1)")

## ------------------------------------------------------------------------
knitr::kable(Sum1$pois_sum_x, digits = 3, row.names = FALSE,
             booktabs = TRUE, caption = "Simulated Distribution of X_pois(1)")
Pplot <- plot_simpdf_theory(sim_y = Sys1$X_all[[1]][, 4], 
  title = "PMF of X_pois(1): Zero-Inflated Poisson Distribution", 
  Dist = "Poisson", params = c(lam[[1]][1], p_zip), cont_var = FALSE)
Pplot

## ------------------------------------------------------------------------
knitr::kable(Sum1$nb_sum_x, digits = 3, row.names = FALSE,
             booktabs = TRUE, caption = "Simulated Distributions")
NBplot <- plot_simtheory(sim_y = Sys1$X_all[[1]][, 5], binwidth = 0.5, 
  title = "Simulated Values for X_nb(11)", Dist = "Negative_Binomial", 
  params = c(size[[1]][1], mu[[1]][1], p_zinb), cont_var = FALSE)
NBplot

## ------------------------------------------------------------------------
maxerr <- do.call(rbind, Sum1$maxerr)
rownames(maxerr) <- colnames(maxerr) <- paste("Y", 1:M, sep = "")
knitr::kable(as.data.frame(maxerr), digits = 5, booktabs = TRUE, 
  caption = "Maximum Correlation Errors for X Variables")

## ------------------------------------------------------------------------
data1 <- as.data.frame(cbind(factor(1:n), Sys1$Y, Sys1$X_all[[1]][, 1:5],
  Sys1$X_all[[2]][, c(2, 3, 5)], Sys1$X_all[[3]][, c(2, 3, 5)]))
colnames(data1)[1] <- "Subject"
data1.a <- melt(data1[, c("Subject", "ord1_1", "pois1_1", "Y1", "Y2", "Y3")], 
  id.vars = c("Subject", "ord1_1", "pois1_1"),
  measure.vars = c("Y1", "Y2", "Y3"), variable.name = "Time", value.name = "Y")
data1.b <- melt(data1[, c("Subject", "cont1_1", "cont2_1", "cont3_1")],
  id.vars = c("Subject"), variable.name = "Time", value.name = "cont1")
data1.c <- melt(data1[, c("Subject", "mix1_1", "mix2_1", "mix3_1")],
  id.vars = c("Subject"), variable.name = "Time", value.name = "mix1")
data1.d <- melt(data1[, c("Subject", "nb1_1", "nb2_1", "nb3_1")],
  id.vars = c("Subject"), variable.name = "Time", value.name = "nb1")
data1.a$Time <- data1.b$Time <- data1.c$Time <- data1.d$Time <- 
  c(rep(1, n), rep(2, n), rep(3, n))
data1 <- merge(merge(merge(data1.a, data1.b, by = c("Subject", "Time")), 
  data1.c, by = c("Subject", "Time")), data1.d, by = c("Subject", "Time"))

## ------------------------------------------------------------------------
fm1 <- glm(Y ~ ord1_1 + cont1 + mix1 + pois1_1 + nb1 + ord1_1:pois1_1 + 
  ord1_1:cont1 + pois1_1:cont1 + ord1_1:pois1_1:cont1 + 
  ord1_1:mix1 + pois1_1:mix1 + ord1_1:pois1_1:mix1 + 
  ord1_1:nb1 + pois1_1:nb1 + ord1_1:pois1_1:nb1 + 
  Time + ord1_1:Time + pois1_1:Time, data = data1)
summary(fm1)

## ------------------------------------------------------------------------
fm1.coef <- fm1$coefficients[c("(Intercept)", "ord1_1", "cont1", "mix1", 
  "pois1_1", "nb1", "ord1_1:pois1_1", "Time", "ord1_1:cont1", "cont1:pois1_1", 
  "ord1_1:cont1:pois1_1", "ord1_1:mix1", "mix1:pois1_1", 
  "ord1_1:mix1:pois1_1", "ord1_1:nb1", "pois1_1:nb1", 
  "ord1_1:pois1_1:nb1", "ord1_1:Time", "pois1_1:Time")]
coef <- rbind(c(betas.0, betas[[1]], betas.int[[1]], betas.t, 
  betas.subj[[1]], betas.tint[[1]]), fm1.coef)
colnames(coef) <- names(fm1.coef)
rownames(coef) <- c("Simulated", "Estimated")
knitr::kable(as.data.frame(coef[, 1:6]), digits = 3, booktabs = TRUE, 
  caption = "Beta Coefficients for Repeated Measures Model 1")
knitr::kable(as.data.frame(coef[, 7:12]), digits = 3, booktabs = TRUE)
knitr::kable(as.data.frame(coef[, 13:19]), digits = 3, booktabs = TRUE)

## ------------------------------------------------------------------------
seed <- 137
n <- 10000
M <- 3

# Ordinal variable
marginal <- list(list(c(1/3, 2/3)), NULL, list(c(1/3, 2/3)))
support <- list(list(c(0, 1, 2)), NULL, list(c(0, 1, 2)))

# Non-mixture continuous variables
skews <- list(c(Stcum1[3], Error1[3]), Error2[3], 
  c(Stcum3[3], Error3[3]))
skurts <- list(c(Stcum1[4], Error1[4]), Error2[4],
  c(Stcum3[4], Error3[4]))
fifths <- list(c(Stcum1[5], Error1[5]), Error2[5],
  c(Stcum3[5], Error3[5]))
sixths <- list(c(Stcum1[6], Error1[6]), Error2[6], 
  c(Stcum3[6], Error3[6]))
Six <- list(list(0.08, 0.06), NULL, list(0.36, 0.15))

# Mixture continuous variable
mix_pis <- list(list(c(0.3, 0.7)), NULL, list(c(0.3, 0.7)))
mix_mus <- list(list(c(-5, 3)), NULL, list(c(-5, 3)))
mix_sigmas <- list(list(c(2, 1)), NULL, list(c(2, 1)))
mix_skews <- mix_skurts <- mix_fifths <- mix_sixths <- 
  list(list(c(0, 0)), NULL, list(c(0, 0)))
mix_Six <- list()

means <- list(c(Stcum1[1], Nstcum[1], Error1[1]), Error2[1], 
  c(Stcum3[1], Nstcum[1], Error3[1]))
vars <- list(c(Stcum1[2]^2, Nstcum[2]^2, Error1[2]^2), Error2[2]^2,
  c(Stcum3[2]^2, Nstcum[2]^2, Error3[2]^2))

# Poisson variable
lam <- list(15, NULL, 15)
p_zip <- 0.10

# Negative Binomial variables
size <- list(10, NULL, 10)
mu <- list(3, NULL, 5)
prob <- list()
p_zinb <- 0

# X_ord(1) and X_pois(1) are the same for Y_1 and Y_3
same.var <- matrix(c(1, 1, 3, 1, 1, 5, 3, 5), 2, 4, byrow = TRUE)

# set up X correlation matrix
corr.x <- list()
corr.x[[1]] <- list(matrix(0.4, 6, 6), NULL, matrix(0.25, 6, 6))
diag(corr.x[[1]][[1]]) <- 1
# set correlations between components of X_mix(11) to 0
corr.x[[1]][[1]][3:4, 3:4] <- diag(2)
# set correlations between time-varying covariates of Y1 and Y3
corr.x[[1]][[3]][2, 2] <- 0.5^2
corr.x[[1]][[3]][3:4, 3:4] <- matrix(0.4^2, 2, 2)
corr.x[[1]][[3]][6, 6] <- 0.3^2
# set correlations for the same variables equal across outcomes
corr.x[[1]][[3]][, c(1, 5)] <- corr.x[[1]][[1]][, c(1, 5)]

corr.x[[3]] <- list(t(corr.x[[1]][[3]]), NULL, matrix(0.3, 6, 6))
diag(corr.x[[3]][[3]]) <- 1
# set correlations between components of X_mix(31) to 0
corr.x[[3]][[3]][3:4, 3:4] <- diag(2)
# set correlations for the same variables equal across outcomes
corr.x[[3]][[3]][c(1, 5), ] <- corr.x[[1]][[3]][c(1, 5), ]
corr.x[[3]][[3]][, c(1, 5)] <- t(corr.x[[3]][[3]][c(1, 5), ])

Time <- 1:M
betas.0 <- 0
betas.t <- 1
betas <- list(seq(0.5, 1.5, 0.25), NULL, seq(0.5, 1.5, 0.25))
# interaction between ordinal and Poisson variable, becomes 
# another group-level variable
int.var <- matrix(c(1, 1, 4, 3, 1, 4), 2, 3, byrow = TRUE)
betas.int <- list(0.5, NULL, 0.5)
# continuous non-mixture, continuous mixture, and NB variables are 
# subject-level variables
subj.var <- matrix(c(1, 2, 1, 3, 1, 5, 3, 2, 3, 3, 3, 5), 
  nrow = 6, ncol = 2, byrow = TRUE)
# there are 3 subject-level variables and 3 group-level variables forming 
# 9 group-subject interactions
betas.subj <- list(seq(0.5, 0.5 + (9 - 1) * 0.1, 0.1), NULL, 
  seq(0.5, 0.5 + (9 - 1) * 0.1, 0.1))
# only ordinal and Poisson variable interact with time (excluding the 
# ordinal-Poisson interaction variable)
tint.var <- matrix(c(1, 1, 1, 4, 3, 1, 3, 4), 4, 2, byrow = TRUE)
betas.tint <- list(c(0.25, 0.5), NULL, c(0.25, 0.5))

## ------------------------------------------------------------------------
checkpar(M, method, error_type, means, vars, skews, skurts, fifths, sixths, 
  Six, mix_pis, mix_mus, mix_sigmas, mix_skews, mix_skurts, mix_fifths, 
  mix_sixths, mix_Six, marginal, support, lam, p_zip, pois_eps = list(), 
  size, prob, mu, p_zinb, nb_eps = list(), corr.x, corr.yx = list(), corr.e, 
  same.var, subj.var, int.var, tint.var, betas.0, betas, betas.subj, betas.int, 
  betas.t, betas.tint, quiet = TRUE)

## ------------------------------------------------------------------------
Sys2 <- corrsys2(n, M, Time, method, error_type, means, vars,
  skews, skurts, fifths, sixths, Six, mix_pis, mix_mus, mix_sigmas, mix_skews,
  mix_skurts, mix_fifths, mix_sixths, mix_Six, marginal, support, lam, p_zip,
  pois_eps = list(), size, prob, mu, p_zinb, nb_eps = list(), corr.x, corr.e, 
  same.var, subj.var, int.var, tint.var, betas.0, betas, betas.subj, betas.int, 
  betas.t, betas.tint, seed = seed, use.nearPD = FALSE, quiet = TRUE)

## ------------------------------------------------------------------------
Sum2 <- summary_sys(Sys2$Y, Sys2$E, E_mix = NULL, Sys2$X, Sys2$X_all, M, 
  method, means, vars, skews, skurts, fifths, sixths, mix_pis, mix_mus, 
  mix_sigmas, mix_skews, mix_skurts, mix_fifths, mix_sixths, marginal, 
  support, lam, p_zip, size, prob, mu, p_zinb, corr.x, corr.e)
names(Sum2)

## ------------------------------------------------------------------------
knitr::kable(Sum2$cont_sum_y, digits = 3, booktabs = TRUE, 
  caption = "Simulated Distributions of Outcomes")

## ------------------------------------------------------------------------
knitr::kable(Sum2$target_sum_e, digits = 3, booktabs = TRUE, 
  caption = "Target Distributions of Error Terms")

## ------------------------------------------------------------------------
knitr::kable(Sum2$cont_sum_e, digits = 3, booktabs = TRUE, 
  caption = "Simulated Distributions of Error Terms")

## ------------------------------------------------------------------------
knitr::kable(Sum2$target_sum_x, digits = 3, booktabs = TRUE, 
  caption = "Target Distributions of Continuous Non-Mixture and Components of 
  Mixture Variables")

## ------------------------------------------------------------------------
knitr::kable(Sum2$cont_sum_x, digits = 3, booktabs = TRUE, 
  caption = "Simulated Distributions of Continuous Non-Mixture and Components 
  of Mixture Variables")

## ------------------------------------------------------------------------
knitr::kable(Sum2$target_mix_x, digits = 3, booktabs = TRUE, 
  caption = "Target Distributions of Continuous Mixture Variables")

## ------------------------------------------------------------------------
knitr::kable(Sum2$mix_sum_x, digits = 3, booktabs = TRUE, 
  caption = "Simulated Distributions of Continuous Mixture Variables")

## ------------------------------------------------------------------------
knitr::kable(Sum2$ord_sum_x[[1]][1:2, ], digits = 3, row.names = FALSE,
  booktabs = TRUE, caption = "Simulated Distribution of X_ord(1)")

## ------------------------------------------------------------------------
knitr::kable(Sum2$pois_sum_x, digits = 3, row.names = FALSE,
  booktabs = TRUE, caption = "Simulated Distribution of X_pois(1)")

## ------------------------------------------------------------------------
knitr::kable(Sum2$nb_sum_x, digits = 3, row.names = FALSE,
  booktabs = TRUE, caption = "Simulated Distributions")

## ------------------------------------------------------------------------
maxerr <- rbind(Sum2$maxerr[[1]][-2], Sum2$maxerr[[3]][-2])
rownames(maxerr) <- colnames(maxerr) <- c("Y1", "Y3")
knitr::kable(as.data.frame(maxerr), digits = 5, booktabs = TRUE, 
  caption = "Maximum Correlation Errors for X Variables")

## ------------------------------------------------------------------------
seed <- 1
n <- 10000
M <- 4

# Binary variable
marginal <- lapply(seq_len(M), function(x) list(c(0.2, 0.55)))
support <- lapply(seq_len(M), function(x) list(0:2))

same.var <- 1
subj.var <- matrix(c(1, 2, 2, 2, 3, 2, 4, 2), 4, 2, byrow = TRUE)

# create list of X correlation matrices
corr.x <- list()

rho1 <- 0.1
rho2 <- 0.5
rho3 <- rho2^2
rho4 <- rho2^3
# Y_1
corr.x[[1]] <- list(matrix(rho1, 2, 2), matrix(rho2, 2, 2), matrix(rho3, 2, 2),
  matrix(rho4, 2, 2))
diag(corr.x[[1]][[1]]) <- 1
# set correlations for the same variables equal across outcomes
corr.x[[1]][[2]][, same.var] <- corr.x[[1]][[3]][, same.var] <-
  corr.x[[1]][[4]][, same.var] <- corr.x[[1]][[1]][, same.var]

# Y_2
corr.x[[2]] <- list(t(corr.x[[1]][[2]]), matrix(rho1, 2, 2),
  matrix(rho2, 2, 2), matrix(rho3, 2, 2))
diag(corr.x[[2]][[2]]) <- 1
# set correlations for the same variables equal across outcomes
corr.x[[2]][[2]][same.var, ] <- corr.x[[1]][[2]][same.var, ]
corr.x[[2]][[2]][, same.var] <- corr.x[[2]][[3]][, same.var] <-
  corr.x[[2]][[4]][, same.var] <- t(corr.x[[1]][[2]][same.var, ])
corr.x[[2]][[3]][same.var, ] <- corr.x[[1]][[3]][same.var, ]
corr.x[[2]][[4]][same.var, ] <- corr.x[[1]][[4]][same.var, ]

# Y_3
corr.x[[3]] <- list(t(corr.x[[1]][[3]]), t(corr.x[[2]][[3]]),
  matrix(rho1, 2, 2), matrix(rho2, 2, 2))
diag(corr.x[[3]][[3]]) <- 1
# set correlations for the same variables equal across outcomes
corr.x[[3]][[3]][same.var, ] <- corr.x[[1]][[3]][same.var, ]
corr.x[[3]][[3]][, same.var] <- t(corr.x[[3]][[3]][same.var, ])
corr.x[[3]][[4]][same.var, ] <- corr.x[[1]][[4]][same.var, ]
corr.x[[3]][[4]][, same.var] <- t(corr.x[[1]][[3]][same.var, ])

# Y_4
corr.x[[4]] <- list(t(corr.x[[1]][[4]]), t(corr.x[[2]][[4]]),
  t(corr.x[[3]][[4]]), matrix(rho1, 2, 2))
diag(corr.x[[4]][[4]]) <- 1
# set correlations for the same variables equal across outcomes
corr.x[[4]][[4]][same.var, ] <- corr.x[[1]][[4]][same.var, ]
corr.x[[4]][[4]][, same.var] <- t(corr.x[[4]][[4]][same.var, ])

# create error term correlation matrix
corr.e <- matrix(c(1, 0.4, 0.4^2, 0.4^3,
                   0.4, 1, 0.4, 0.4^2,
                   0.4^2, 0.4, 1, 0.4,
                   0.4^3, 0.4^2, 0.4, 1), M, M, byrow = TRUE)

Log <- calc_theory("Logistic", c(0, 1))
t10 <- calc_theory("t", 10)

# Continuous variables: 1st non-mixture, 2nd error terms
means <- lapply(seq_len(M), function(x) c(Log[1], 0))
vars <- lapply(seq_len(M), function(x) c(Log[2]^2, 1))
skews <- lapply(seq_len(M), function(x) c(Log[3], t10[3]))
skurts <- lapply(seq_len(M), function(x) c(Log[4], t10[4]))
fifths <- lapply(seq_len(M), function(x) c(Log[5], t10[5]))
sixths <- lapply(seq_len(M), function(x) c(Log[6], t10[6]))
Six <- lapply(seq_len(M), function(x) list(1.75, NULL))

## RANDOM EFFECTS
rand.int <- "non_mix" # random intercept
rand.tsl <- "non_mix" # random time slope
rand.var <- NULL # no additional random effects

rmeans <- rskews <- rskurts <- rfifths <- rsixths <- c(0, 0)
rvars <- c(1, 1)
rSix <- list(NULL, NULL)

# append parameters for random effect distributions to parameters for
# continuous fixed effects and error terms
means <- append(means, list(rmeans))
vars <- append(vars, list(rvars))
skews <- append(skews, list(rskews))
skurts <- append(skurts, list(rskurts))
fifths <- append(fifths, list(rfifths))
sixths <- append(sixths, list(rsixths))
Six <- append(Six, list(rSix))

# use a list of length 1 so that betas are the same across Y
betas <- list(c(1, 1))
betas.subj <- list(0.5)
betas.tint <- list(0.75)

# set up correlation matrix for random effects
corr.u <- matrix(c(1, 0.3, 0.3, 1), 2, 2)

## ------------------------------------------------------------------------
checkpar(M, "Polynomial", "non_mix", means, vars, skews, skurts, fifths,
  sixths, Six, marginal = marginal, support = support, corr.x = corr.x,
  corr.e = corr.e, same.var = same.var, subj.var = subj.var, betas = betas,
  betas.subj = betas.subj, betas.tint = betas.tint, rand.int = rand.int,
  rand.tsl = rand.tsl, corr.u = corr.u, quiet = TRUE)

## ------------------------------------------------------------------------
Sys3 <- corrsys(n, M, Time = NULL, "Polynomial", "non_mix", means, vars,
  skews, skurts, fifths, sixths, Six, marginal = marginal, support = support,
  corr.x = corr.x, corr.e = corr.e, same.var = same.var, subj.var = subj.var,
  betas = betas, betas.subj = betas.subj, betas.tint = betas.tint,
  rand.int = rand.int, rand.tsl = rand.tsl, corr.u = corr.u, seed = seed,
  use.nearPD = FALSE, quiet = TRUE)

## ------------------------------------------------------------------------
Sum3 <- summary_sys(Sys3$Y, Sys3$E, E_mix = NULL, Sys3$X,
  Sys3$X_all, M, "Polynomial", means, vars, skews, skurts, fifths,
  sixths, marginal = marginal, support = support, corr.x = corr.x,
  corr.e = corr.e, U = Sys3$U, U_all = Sys3$U_all, rand.int = rand.int,
  rand.tsl = rand.tsl, corr.u = corr.u, rmeans2 = Sys3$rmeans2,
  rvars2 = Sys3$rvars2)
names(Sum3)

## ------------------------------------------------------------------------
knitr::kable(Sum3$cont_sum_y, digits = 3, booktabs = TRUE, 
  caption = "Simulated Distributions of Outcomes")

## ------------------------------------------------------------------------
knitr::kable(Sum3$target_sum_u, digits = 3, booktabs = TRUE, 
  caption = "Target Distributions of Random Effects")

## ------------------------------------------------------------------------
knitr::kable(Sum3$sum_uall, digits = 3, booktabs = TRUE, 
  caption = "Simulated Distributions of Random Effects")

## ------------------------------------------------------------------------
Sum3$maxerr_u

## ------------------------------------------------------------------------
data3 <- as.data.frame(cbind(factor(1:n), Sys3$Y,
  Sys3$X_all[[1]][, c(1:2, 5)], Sys3$X_all[[2]][, c(2, 5)],
  Sys3$X_all[[3]][, c(2, 5)], Sys3$X_all[[4]][, c(2, 5)]))
colnames(data3)[1] <- "Subject"
data3.a <- melt(data3[, c("Subject", "ord1_1", "Y1", "Y2", "Y3", "Y4")],
  id.vars = c("Subject", "ord1_1"),
  measure.vars = c("Y1", "Y2", "Y3", "Y4"), variable.name = "Time",
  value.name = "Y")
data3.b <- melt(data3[, c("Subject", "cont1_1", "cont2_1", "cont3_1",
                          "cont4_1")],
  id.vars = c("Subject"), variable.name = "Time", value.name = "cont1")
data3.a$Time <- data3.b$Time <- c(rep(1, n), rep(2, n), rep(3, n), rep(4, n))
data3 <- merge(data3.a, data3.b, by = c("Subject", "Time"))

## ------------------------------------------------------------------------
fm3 <- lme(Y ~ ord1_1 * Time + ord1_1 * cont1,
  random = ~ Time | Subject, correlation = corAR1(), data = data3)
sum_fm3 <- summary(fm3)

## ------------------------------------------------------------------------
fm3.coef <- as.data.frame(sum_fm3$tTable[c("(Intercept)",
  "ord1_1", "cont1", "Time", "ord1_1:cont1", "ord1_1:Time"), ])
coef <- cbind(c(betas.0, betas[[1]], betas.t, betas.subj[[1]], 
  betas.tint[[1]]), fm3.coef)
colnames(coef)[1] <- "Simulated"
knitr::kable(as.data.frame(coef), digits = 3, booktabs = TRUE, 
  caption = "Beta Coefficients for Repeated Measures Model 2")

## ------------------------------------------------------------------------
sum_fm3$sigma
coef(fm3$modelStruct$corStruct, unconstrained = FALSE)

## ------------------------------------------------------------------------
varcor <- VarCorr(fm3)
fm3.ranef <- data.frame(Cor = as.numeric(varcor[2, 3]),
  SD_int = as.numeric(varcor[1, 2]), SD_Tsl = as.numeric(varcor[2, 2]))
knitr::kable(fm3.ranef, digits = 3, booktabs = TRUE)


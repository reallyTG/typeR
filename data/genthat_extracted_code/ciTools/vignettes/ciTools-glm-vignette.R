## ----message=FALSE-------------------------------------------------------
library(tidyverse)
library(ciTools)
library(MASS) 
library(arm)
set.seed(20171102)

## ------------------------------------------------------------------------
x <- rnorm(100, mean = 5)
y <- rbinom(n = 100, size = 1, prob = invlogit(-20 + 4*x))
df <- data.frame(x = x, y = y)
fit <- glm(y ~ x, family = binomial)

## ------------------------------------------------------------------------
df1 <- add_ci(df, fit, names = c("lwr", "upr"), alpha = 0.1) %>%
    mutate(type = "parametric")

df2 <- add_ci(df, fit, type = "boot", names = c("lwr", "upr"), alpha = 0.1, nSims = 500) %>%
    mutate(type = "bootstrap")
df <- bind_rows(df1, df2)

## ----fig.width = 6, fig.heither = 4, fig.align = "center"----------------
ggplot(df, aes(x = x, y = y)) +
    ggtitle("Logistic Regression", subtitle = "Model fit (black line) and confidence intervals (gray)") +
    geom_jitter(height = 0.01) +
    geom_ribbon(aes(ymin = lwr, ymax = upr), alpha = 0.4) +
    geom_line(aes(x =x , y = pred), size = 2) +
    facet_grid(~type)

## ----echo = F------------------------------------------------------------
df3 <- filter(df, type == "parametric")

df4 <- filter(df, type == "bootstrap") %>%
    rename(lboot = lwr, uboot = upr) %>%
    bind_cols(df3)

## ----fig.width = 6, fig.heither = 4, fig.align = "center", echo = F------
ggplot(df4, aes(x = x, y = y)) +
    ggtitle("Logistic Regression") +
    geom_jitter(height = 0.01) +
    geom_ribbon(aes(ymin = lboot, ymax = uboot), alpha = 0.4, fill = "red") +
    geom_ribbon(aes(ymin = lwr, ymax = upr), alpha = 0.4, fill = "royalblue") +
    geom_line(aes(x = x , y = pred), size = 2)

## ------------------------------------------------------------------------
x <- rnorm(100, mean = 0)
y <- rpois(n = 100, lambda = exp(1.5 + 0.5*x))
df <- data.frame(x = x, y = y)
fit <- glm(y ~ x , family = poisson(link = "log"))

## ------------------------------------------------------------------------
df_ints <- df %>% 
    add_ci(fit, names = c("lcb", "ucb"), alpha = 0.1) %>%
    add_pi(fit, names = c("lpb", "upb"), alpha = 0.1, nSims = 20000) %>%
    print()

## ----fig.width = 6, fig.heither = 4, fig.align = "center"----------------
df_ints %>% 
    ggplot(aes(x = x, y = y)) +
    geom_point(size = 2) +
    ggtitle("Poisson Regression", subtitle = "Model fit (black line), with prediction intervals (gray), confidence intervals (dark gray)") +
    geom_line(aes(x = x, y = pred), size = 1.2) + 
    geom_ribbon(aes(ymin = lcb, ymax = ucb), alpha = 0.4) +
    geom_ribbon(aes(ymin = lpb, ymax = upb), alpha = 0.2)

## ------------------------------------------------------------------------
df %>%
    add_probs(fit, q = 10) %>%
    add_quantile(fit, p = 0.4) %>%
    print()

## ------------------------------------------------------------------------
x <- runif(n = 100, min = 0, max = 2)
mu <- exp(1 + x)
y <- rnegbin(n = 100, mu = mu, theta = mu/(5 - 1)) 

## ------------------------------------------------------------------------
df <- data.frame(x = x, y = y)
fit <- glm(y ~ x, family = quasipoisson(link = "log"))
summary(fit)$dispersion

## ------------------------------------------------------------------------
df_ints <- add_ci(df, fit, names = c("lcb", "ucb"), alpha = 0.05) %>%
    add_pi(fit, names = c("lpb", "upb"), alpha = 0.1, nSims = 20000) 


## ----fig.width = 6, fig.heither = 4, fig.align="center"------------------
ggplot(df_ints, aes(x = x, y = y)) +
    ggtitle("Quasipoisson Regression", subtitle = "Model fit (black line), with Prediction intervals (gray), Confidence intervals (dark gray)") + 
    geom_point(size = 2) +
    geom_line(aes(x = x, y = pred), size = 1.2) +
    geom_ribbon(aes(ymin = lcb, ymax = ucb), alpha = 0.4) +
    geom_ribbon(aes(ymin = lpb, ymax = upb), alpha = 0.2)

## ----message=FALSE-------------------------------------------------------
pois <- read_csv("pois_pi_results.csv") %>%
    dplyr::select(-total_time) %>%
    rename(nominal_level = level) %>%
    dplyr::select(sample_size, everything())
knitr::kable(pois)

## ----fig.width = 6, fig.heither = 4, fig.align="center", echo = F--------
ggplot(pois, aes(x=sample_size, y=cov_prob)) + 
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    geom_errorbar(aes(ymin=cov_prob - 2*cov_prob_se, ymax = cov_prob + 2*cov_prob_se), width=.1) +
    ylim(0, 1) +
    xlab("Sample Size (log scale)") +
    ylab("Coverage Probs +/- 2 SEs") +
    ggtitle("Poisson Regression -- P.I. Simulation", subtitle = "Coverage Probabilities on [0,1] scale") +
    scale_x_log10(breaks = c(20, 30, 50, 100, 250, 500, 1000, 2000)) +
    geom_hline(aes(yintercept = 0.95), colour="#BB0000", linetype="dashed", size = 1)

## ----fig.width = 6, fig.heither = 4, fig.align="center", echo = F--------
ggplot(pois, aes(x=sample_size, y=cov_prob)) + 
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    geom_errorbar(aes(ymin=cov_prob - 2*cov_prob_se, ymax = cov_prob + 2*cov_prob_se), width=.1) +
    xlab("Sample Size (log scale)") +
    ylab("Coverage Probs +/- 2 SEs") +
    ggtitle("Poisson Regression -- P.I. Simulation", subtitle = "Coverage Probabilities (zoom in)") +
    scale_x_log10(breaks = c(20, 30, 50, 100, 250, 500, 1000, 2000)) +
    geom_hline(aes(yintercept = 0.95), colour="#BB0000", linetype="dashed", size = 1)

## ----fig.width = 6, fig.heither = 4, fig.align="center", echo = F--------
ggplot(pois, aes(x=sample_size, y=int_width)) + 
    geom_errorbar(aes(ymin=int_width - 2*int_width_se, ymax = int_width + 2*int_width_se), width=.1) +
    scale_x_log10(breaks = c(20, 30, 50, 100, 250, 500, 1000, 2000)) +
    xlab("Sample Size (log scale)") +
    ylab("Interval Widths +/- 2 SEs") +
    ggtitle("Poisson Regression -- P.I. Simulation", subtitle = "Interval Widths") +
    geom_line(size = 1.5) +
    geom_point(size = 1.5)

## ----message=FALSE-------------------------------------------------------
neg_bin <- read_csv("negbin_pi_results.csv") %>%
    dplyr::select(-total_time) %>%
    rename(nominal_level = level) %>%
    dplyr::select(sample_size, everything())
knitr::kable(neg_bin)

## ----fig.width = 6, fig.heither = 4, fig.align="center", echo = F--------
ggplot(neg_bin, aes(x=sample_size, y=cov_prob)) + 
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    geom_errorbar(aes(ymin=cov_prob - 2*cov_prob_se, ymax = cov_prob + 2*cov_prob_se), width=.1) +
    ylim(0, 1) +
    xlab("Sample Size (log scale)") +
    ylab("Coverage Probs +/- 2 SEs") +
    ggtitle("Negative Binomial Regression -- P.I. Simulation", subtitle = "Coverage Probabilities on [0,1] scale") +
    scale_x_log10(breaks = c(20, 30, 50, 100, 150, 200, 250, 500, 1000, 2000)) +
    geom_hline(aes(yintercept = 0.95), colour="#BB0000", linetype="dashed", size = 1)

## ----fig.width = 6, fig.heither = 4, fig.align="center", echo = F--------
ggplot(neg_bin, aes(x=sample_size, y=cov_prob)) + 
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    geom_errorbar(aes(ymin=cov_prob - 2*cov_prob_se, ymax = cov_prob + 2*cov_prob_se), width=.1) +
    xlab("Sample Size (log scale)") +
    ylab("Coverage Probs +/- 2 SEs") +
    ggtitle("Negative Binomial Regression -- P.I. Simulation", subtitle = "Coverage Probabilities (zoom in)") +
    scale_x_log10(breaks = c(20, 30, 50, 100, 150, 200, 250, 500, 1000, 2000)) +
    geom_hline(aes(yintercept = 0.95), colour="#BB0000", linetype="dashed", size = 1)

## ----fig.width = 6, fig.heither = 4, fig.align="center", echo = F--------
ggplot(neg_bin, aes(x=sample_size, y=int_width)) + 
    geom_errorbar(aes(ymin=int_width - 2*int_width_se, ymax = int_width + 2*int_width_se), width=.1) +
    scale_x_log10(breaks = c(20, 30, 50, 100, 150, 200, 250, 500, 1000, 2000)) +
    xlab("Sample Size (log scale)") +
    ylab("Interval Widths +/- 2 SEs") +
    ggtitle("Negative Binomial Regression -- P.I. Simulation", subtitle = "Interval Widths") +
    geom_line(size = 1.5) +
    geom_point(size = 1.5)

## ----message=FALSE-------------------------------------------------------
gam <- read_csv("gamma_pi_results.csv") %>%
    dplyr::select(-total_time) %>%
    rename(nominal_level = level) %>%
    dplyr::select(sample_size, everything())
knitr::kable(gam)

## ----fig.width = 6, fig.heither = 4, fig.align="center", echo = F--------
ggplot(gam, aes(x=sample_size, y=cov_prob)) + 
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    geom_errorbar(aes(ymin=cov_prob - 2*cov_prob_se, ymax = cov_prob + 2*cov_prob_se), width=.1) +
    ylim(0, 1) +
    xlab("Sample Size (log scale)") +
    ylab("Coverage Probs +/- 2 SEs") +
    ggtitle("Gamma Regression -- P.I. Simulation", subtitle = "Coverage Probabilities on [0,1] scale") +
    scale_x_log10(breaks = c(100, 250, 500, 1000, 2000)) +
    geom_hline(aes(yintercept = 0.95), colour="#BB0000", linetype="dashed", size = 1)

## ----fig.width = 6, fig.heither = 4, fig.align="center", echo = F--------
ggplot(gam, aes(x=sample_size, y=cov_prob)) + 
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    geom_errorbar(aes(ymin=cov_prob - 2*cov_prob_se, ymax = cov_prob + 2*cov_prob_se), width=.1) +
    xlab("Sample Size (log scale)") +
    ylab("Coverage Probs +/- 2 SEs") +
    ggtitle("Gamma Regression -- P.I. Simulation", subtitle = "Coverage Probabilities (zoom in)") +
    scale_x_log10(breaks = c(100, 250, 500, 1000, 2000)) +
    geom_hline(aes(yintercept = 0.95), colour="#BB0000", linetype="dashed", size = 1)

## ----fig.width = 6, fig.heither = 4, fig.align="center", echo = F--------
ggplot(gam, aes(x=sample_size, y=int_width)) + 
    geom_errorbar(aes(ymin=int_width - 2*int_width_se, ymax = int_width + 2*int_width_se), width=.1) +
    scale_x_log10(breaks = c(100, 250, 500, 1000, 2000)) +
    xlab("Sample Size (log scale)") +
    ylab("Interval Widths +/- 2 SEs") +
    ggtitle("Gamma Regression -- P.I. Simulation", subtitle = "Interval Widths") +
    geom_line(size = 1.5) +
    geom_point(size = 1.5)

## ----message=FALSE-------------------------------------------------------
norm_log <- read_csv("gaussian_pi_loglink_results.csv") %>%
    dplyr::select(-total_time) %>%
    rename(nominal_level = level) %>%
    dplyr::select(sample_size, everything())
knitr::kable(norm_log)

## ----fig.width = 6, fig.heither = 4, fig.align="center", echo = F--------
ggplot(norm_log, aes(x=sample_size, y=cov_prob)) + 
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    geom_errorbar(aes(ymin=cov_prob - 2*cov_prob_se, ymax = cov_prob + 2*cov_prob_se), width=.1) +
    ylim(0, 1) +
    xlab("Sample Size (log scale)") +
    ylab("Coverage Probs +/- 2 SEs") +
    ggtitle("Gaussian Regression -- P.I. Simulation", subtitle = "Coverage Probabilities on [0,1] scale") +
    scale_x_log10(breaks = c(20, 30, 50, 100, 250, 500, 1000, 2000)) +
    geom_hline(aes(yintercept = 0.95), colour="#BB0000", linetype="dashed", size = 1)

## ----fig.width = 6, fig.heither = 4, fig.align="center", echo = F--------
ggplot(norm_log, aes(x=sample_size, y=cov_prob)) + 
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    geom_errorbar(aes(ymin=cov_prob - 2*cov_prob_se, ymax = cov_prob + 2*cov_prob_se), width=.1) +
    xlab("Sample Size (log scale)") +
    ylab("Coverage Probs +/- 2 SEs") +
    ggtitle("Gaussian Regression -- P.I. Simulation", subtitle = "Coverage Probabilities (zoom in)") +
    scale_x_log10(breaks = c(20, 30, 50, 100, 250, 500, 1000, 2000)) +
    geom_hline(aes(yintercept = 0.95), colour="#BB0000", linetype="dashed", size = 1)

## ----fig.width = 6, fig.heither = 4, fig.align="center", echo = F--------
ggplot(norm_log, aes(x=sample_size, y=int_width)) + 
    geom_errorbar(aes(ymin=int_width - 2*int_width_se, ymax = int_width + 2*int_width_se), width=.1) +
    scale_x_log10(breaks = c(20, 30, 50, 100, 250, 500, 1000, 2000)) +
    xlab("Sample Size (log scale)") +
    ylab("Interval Widths +/- 2 SEs") +
    ggtitle("Gaussian Regression -- P.I. Simulation", subtitle = "Interval Widths") +
    geom_line(size = 1.5) +
    geom_point(size = 1.5)

## ------------------------------------------------------------------------
sessionInfo()


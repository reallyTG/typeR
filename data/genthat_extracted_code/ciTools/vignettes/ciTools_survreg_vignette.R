## ---- message = FALSE----------------------------------------------------
library(tidyverse)
library(knitr)
library(ciTools)
library(here)
set.seed(20180925)

## ----include = FALSE, cache = TRUE---------------------------------------
library(SPREDA)
car <- rep(c("suv", "sedan"), 25)
temp <- seq(40,100, length.out = 50)
time <- exp(0.33 + 0.2 * ifelse(car == "sedan", 0, 1) + 0.08 * temp + rsev(50))
time <- ifelse(time < 2000, time, 2000)
failure <- ifelse(time < 2000, 1, 0)
dat <- data.frame(temp = temp,
                  car = car,
                  time = time,
                  failure = failure)

## ----cache = TRUE--------------------------------------------------------
kable(head(dat))


## ----cache = TRUE, fig.width = 5, fig.height= 5, warning = FALSE---------
ggplot(dat, aes(x = temp, y = time)) +
    geom_point(aes(color = factor(failure)))+
    ggtitle("Censored obs. in red") +
    theme_bw()

## ----cache = TRUE--------------------------------------------------------
(fit <- survreg(Surv(time, failure) ~ temp + car, data = dat)) ## weibull dist is default

## ----cache = TRUE, fig.width = 8, fig.height = 5, warning = FALSE--------
with_ints <- ciTools::add_ci(dat,fit, names = c("lcb", "ucb")) %>%
    ciTools::add_pi(fit, names = c("lpb", "upb"))


## ----cache = TRUE, fig.width = 8, fig.height = 5, warning = FALSE--------
kable(head(with_ints))

## ----cache = TRUE, fig.width = 8, fig.height = 5, warning = FALSE--------
ggplot(with_ints, aes(x = temp, y = time)) +
    geom_point(aes(color = car)) +
    facet_wrap(~car)+
    theme_bw() +
    ggtitle("Model fit with 95% CIs and PIs",
            "solid line = mean, dotted line = median") +
    geom_line(aes(y = mean_pred), linetype = 1) +
    geom_line(aes(y = median_pred), linetype = 2) +
    geom_ribbon(aes(ymin = lcb, ymax = ucb), alpha = 0.5) +
    geom_ribbon(aes(ymin = lpb, ymax = upb), alpha = 0.1)


## ----cache = TRUE, fig.width = 8, fig.height = 5, warning = FALSE--------
probs <- ciTools::add_probs(dat, fit, q = 500,
                            name = c("prob", "lcb", "ucb"),
                            comparison = ">")

## ----cache = TRUE, fig.width = 8, fig.height = 5, warning = FALSE--------
ggplot(probs, aes(x = temp, y = prob)) +
    ggtitle("Estimated prob. of avg. spring lasting longer than 500 hrs.") +
    ylim(c(0,1)) +
    facet_wrap(~car)+
    theme_bw() +
    geom_line(aes(y = prob)) +
    geom_ribbon(aes(ymin = lcb, ymax = ucb), alpha = 0.5)


## ----cache = TRUE, fig.width = 8, fig.height = 5, warning = FALSE--------
quants <- ciTools::add_quantile(dat, fit, p = 0.90,
                                name = c("quant", "lcb", "ucb"))

## ----cache = TRUE, fig.width = 8, fig.height = 5, warning = FALSE--------
ggplot(quants, aes(x = temp, y = time)) +
    geom_point(aes(color = car)) +
    ggtitle("Estimated 90th percentile of condtional failure distribution, with CI") +
    facet_wrap(~car)+
    theme_bw() +
    geom_line(aes(y = quant)) +
    geom_ribbon(aes(ymin = lcb, ymax = ucb), alpha = 0.5)

## ----include=FALSE, cache= TRUE------------------------------------------
path <- "./survreg_data"
exp0 <- read_csv(paste0(path,"/","exponential_sim_expect_ci_censoredp00.csv"))
exp1 <- read_csv(paste0(path,"/","exponential_sim_expect_ci_censoredp03.csv"))
exp2 <- read_csv(paste0(path,"/","exponential_sim_expect_ci_censoredp05.csv"))
exp_dat <- rbind(exp0, exp1, exp2) %>%
    mutate(distr = "Exponential")
loglog0 <- read_csv(paste0(path,"/",
                           "loglogistic_sim_expect_ci_scale025_censoredp00.csv"))
loglog1 <- read_csv(paste0(path,"/",
                           "loglogistic_sim_expect_ci_scale025_censoredp03.csv"))
loglog2 <- read_csv(paste0(path,"/",
                           "loglogistic_sim_expect_ci_scale025_censoredp05.csv"))
loglog_dat <- rbind(loglog0, loglog1, loglog2) %>%
    mutate(distr = "Loglogistic") %>%
    dplyr::select(-c(scale))
lognorm0 <- read_csv(paste0(path,"/","lognormal_sim_expect_ci_scale2_censoredp00.csv"))
lognorm1 <- read_csv(paste0(path,"/","lognormal_sim_expect_ci_scale2_censoredp03.csv"))
lognorm2 <- read_csv(paste0(path,"/","lognormal_sim_expect_ci_scale2_censoredp05.csv"))
lognorm_dat <- rbind(lognorm0, lognorm1, lognorm2) %>%
    mutate(distr = "Lognormal") %>%
    dplyr::select(-c(scale))
weibull0 <- read_csv(paste0(path,"/","weibull_sim_expect_ci_scale2_censoredp00.csv"))
weibull1 <- read_csv(paste0(path,"/","weibull_sim_expect_ci_scale2_censoredp03.csv"))
weibull2 <- read_csv(paste0(path,"/","weibull_sim_expect_ci_scale2_censoredp05.csv"))
weibull_dat <- rbind(weibull0, weibull1, weibull2) %>%
    mutate(distr = "Weibull") %>%
    dplyr::select(-c(scale))
ci_dat <- rbind(exp_dat, loglog_dat, lognorm_dat, weibull_dat)

## ----fig.width=8, fig.height=8, echo = FALSE, cache= TRUE----------------
ggplot(filter(ci_dat), aes(x=sample_size, y=cov_prob)) +
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    geom_errorbar(aes(ymin=cov_prob - 2*cov_prob_se,
                      ymax = cov_prob + 2*cov_prob_se), width=.1) +
    xlab("Sample Size (log scale)") +
    ylab("Coverage Probs +/- 2 SEs") +
    ggtitle("C.I. Simulation, by Distribution and Censoring",
            subtitle = "Coverage Probabilities (zoomed in)") +
    scale_x_log10(breaks = c(20, 30, 50, 100, 250, 500, 1000, 2000)) +
    geom_hline(aes(yintercept = 0.90), colour="#BB0000", linetype="dashed", size = 1) +
    facet_grid(distr~censoredp)


## ----fig.width=8, fig.height=8, echo=FALSE, cache= TRUE------------------
ggplot(filter(ci_dat), aes(x=sample_size, y=cov_prob)) +
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    ylim(0,1) +
    geom_errorbar(aes(ymin=cov_prob - 2*cov_prob_se,
                      ymax = cov_prob + 2*cov_prob_se), width=.1) +
    xlab("Sample Size (log scale)") +
    ylab("Coverage Probs +/- 2 SEs") +
    ggtitle("C.I. Simulation, by Distribution and Censoring",
            subtitle = "Coverage Probabilities (zoomed out)") +
    scale_x_log10(breaks = c(20, 30, 50, 100, 250, 500, 1000, 2000)) +
    geom_hline(aes(yintercept = 0.90), colour="#BB0000", linetype="dashed", size = 1) +
    facet_grid(distr~censoredp)

## ----fig.width=8, fig.height=8, echo = FALSE, cache= TRUE----------------
ggplot(filter(ci_dat), aes(x=sample_size, y=int_width)) +
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    geom_errorbar(aes(ymin=int_width - 2*int_width_se,
                      ymax = int_width + 2*int_width_se), width=.1) +
    xlab("Sample Size (log scale)") +
    ylab("Interval Widths +/- 2 SEs") +
    ggtitle("C.I Simulation, by Distribution and Censoring",
            subtitle = "Interval Widths") +
    scale_x_log10(breaks = c(20, 30, 50, 100, 250, 500, 1000, 2000)) +
    geom_hline(aes(yintercept = 0.0), colour="blue", linetype="dashed", size = 1) +
    facet_grid(distr~censoredp)

## ---- include = FALSE, cache= TRUE, warning = FALSE----------------------
expp0 <- read_csv(paste0(path,"/","exponential_sim_prob_ci_censoredp00.csv"))
expp1 <- read_csv(paste0(path,"/","exponential_sim_prob_ci_censoredp03.csv"))
expp2 <- read_csv(paste0(path,"/","exponential_sim_prob_ci_censoredp05.csv"))
expp_dat <- rbind(expp0, expp1, expp2) %>%
    mutate(distr = "Exponential")
loglogp0 <- read_csv(paste0(path,"/",
                            "loglogistic_sim_prob_ci_scale025_censoredp00.csv"))
loglogp1 <- read_csv(paste0(path,"/",
                            "loglogistic_sim_prob_ci_scale025_censoredp03.csv"))
loglogp2 <- read_csv(paste0(path,"/",
                            "loglogistic_sim_prob_ci_scale025_censoredp05.csv"))
loglogp_dat <- rbind(loglogp0, loglogp1, loglogp2) %>%
    mutate(distr = "Loglogisic") %>%
    dplyr::select(-c(scale))
lognormp0 <- read_csv(paste0(path,"/","lognormal_sim_prob_ci_scale2_censoredp00.csv"))
lognormp1 <- read_csv(paste0(path,"/","lognormal_sim_prob_ci_scale2_censoredp03.csv"))
lognormp2 <- read_csv(paste0(path,"/","lognormal_sim_prob_ci_scale2_censoredp05.csv"))
lognormp_dat <- rbind(lognormp0, lognormp1, lognormp2) %>%
    mutate(distr = "Lognormal") %>%
    dplyr::select(-c(scale))
weibullp0 <- read_csv(paste0(path,"/","weibull_sim_prob_ci_scale2_censoredp00.csv"))
weibullp1 <- read_csv(paste0(path,"/","weibull_sim_prob_ci_scale2_censoredp03.csv"))
weibullp2 <- read_csv(paste0(path,"/","weibull_sim_prob_ci_scale2_censoredp05.csv"))
weibullp_dat <- rbind(weibullp0, weibullp1, weibullp2) %>%
    mutate(distr = "Weibull") %>%
    dplyr::select(-c(scale))
prob_dat <- rbind(expp_dat, loglogp_dat, lognormp_dat, weibullp_dat)

## ---- fig.width=8, fig.height=8, echo = FALSE, cache= TRUE, warning = FALSE----
ggplot(filter(prob_dat), aes(x=sample_size, y=cov_prob)) +
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    geom_errorbar(aes(ymin=cov_prob - 2*cov_prob_se,
                      ymax = cov_prob + 2*cov_prob_se), width=.1) +
    xlab("Sample Size (log scale)") +
    ylab("Coverage Probs +/- 2 SEs") +
    ggtitle("C.I. for Survival Probability Simulation, by Distribution and Censoring",
            subtitle = "Coverage Probabilities (zoomed in)") +
    scale_x_log10(breaks = c(20, 30, 50, 100, 250, 500, 1000, 2000)) +
    geom_hline(aes(yintercept = 0.90), colour="#BB0000", linetype="dashed", size = 1) +
    facet_grid(distr~censoredp)

## ---- fig.width=8, fig.height=8, echo = FALSE, cache= TRUE, warning = FALSE----
ggplot(filter(prob_dat), aes(x=sample_size, y=cov_prob)) +
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    ylim(0,1) +
    geom_errorbar(aes(ymin=cov_prob - 2*cov_prob_se,
                      ymax = cov_prob + 2*cov_prob_se), width=.1) +
    xlab("Sample Size (log scale)") +
    ylab("Coverage Probs +/- 2 SEs") +
    ggtitle("Survival Probability Simulation, by Distribution and Censoring",
            subtitle = "Coverage Probabilities (zoomed out)") +
    scale_x_log10(breaks = c(20, 30, 50, 100, 250, 500, 1000, 2000)) +
    geom_hline(aes(yintercept = 0.90), colour="#BB0000", linetype="dashed", size = 1) +
    facet_grid(distr~censoredp)

## ----fig.width=8, fig.height=8, echo = FALSE, cache= TRUE, warning = FALSE----
ggplot(filter(prob_dat), aes(x=sample_size, y=int_width)) +
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    geom_errorbar(aes(ymin=int_width - 2*int_width_se,
                      ymax = int_width + 2*int_width_se), width=.1) +
    xlab("Sample Size (log scale)") +
    ylab("Interval Widths +/- 2 SEs") +
    ggtitle("Survival Probability Simulation, by Distribution and Censoring",
            subtitle = "Interval Widths") +
    scale_x_log10(breaks = c(20, 30, 50, 100, 250, 500, 1000, 2000)) +
    geom_hline(aes(yintercept = 0.0), colour="blue", linetype="dashed", size = 1) +
    facet_grid(distr~censoredp)

## ----include=FALSE, cache= TRUE------------------------------------------
exppi0 <- read_csv(paste0(path,"/","exponential_sim_pi_censoredp00.csv"))
exppi1 <- read_csv(paste0(path,"/","exponential_sim_pi_censoredp03.csv"))
exppi2 <- read_csv(paste0(path,"/","exponential_sim_pi_censoredp05.csv"))
exppi_dat <- rbind(exppi0, exppi1, exppi2) %>%
    mutate(distr = "Exponential")
loglogpi0 <- read_csv(paste0(path,"/",
                             "loglogistic_sim_pi_scale025_censoredp00.csv"))
loglogpi1 <- read_csv(paste0(path,"/",
                             "loglogistic_sim_pi_scale025_censoredp03.csv"))
loglogpi2 <- read_csv(paste0(path,"/",
                             "loglogistic_sim_pi_scale025_censoredp05.csv"))
loglogpi_dat <- rbind(loglogpi0, loglogpi1, loglogpi2) %>%
    mutate(distr = "Loglogistic") %>%
    dplyr::select(-c(scale))
lognormpi0 <- read_csv(paste0(path,"/","lognormal_sim_pi_scale2_censoredp00.csv"))
lognormpi1 <- read_csv(paste0(path,"/","lognormal_sim_pi_scale2_censoredp03.csv"))
lognormpi2 <- read_csv(paste0(path,"/","lognormal_sim_pi_scale2_censoredp05.csv"))
lognormpi_dat <- rbind(lognormpi0, lognormpi1, lognormpi2) %>%
    mutate(distr = "Lognormal") %>%
    dplyr::select(-c(scale))
weibullpi0 <- read_csv(paste0(path,"/","weibull_sim_pi_scale2_censoredp00.csv"))
weibullpi1 <- read_csv(paste0(path,"/","weibull_sim_pi_scale2_censoredp03.csv"))
weibullpi2 <- read_csv(paste0(path,"/","weibull_sim_pi_scale2_censoredp05.csv"))
weibullpi_dat <- rbind(weibullpi0, weibullpi1, weibullpi2) %>%
    mutate(distr = "Weibull") %>%
    dplyr::select(-c(scale))
pi_dat <- rbind(exppi_dat, loglogpi_dat, lognormpi_dat, weibullpi_dat)

## ----fig.width=8, fig.height=8, echo=FALSE, cache= TRUE------------------
ggplot(filter(pi_dat), aes(x=sample_size, y=cov_prob)) +
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    geom_line(aes(y = cov_prob_boot), size = 1.5, color = "blue") +
    ## geom_errorbar(aes(ymin=cov_prob - 2*cov_prob_se,
    ##                   ymax = cov_prob + 2*cov_prob_se), width=.1) +
    ## geom_errorbar(aes(ymin=cov_prob_boot - 2*cov_prob_boot_se,
    ##                   ymax = cov_prob_boot + 2*cov_prob_boot_se),
    ##               width=.1, color = "blue") +
    xlab("Sample Size (log scale)") +
    ylab("Coverage Probs +/- 2 SEs") +
    ggtitle("P.I. Simulation, by Distribution and Censoring",
            subtitle = "Coverage Probabilities. Naive method (black). Simulation method (blue) ") +
    scale_x_log10(breaks = c(20, 30, 50, 100, 250, 500, 1000, 2000)) +
    geom_hline(aes(yintercept = 0.90), colour="#BB0000", linetype="dashed", size = 1) +
    facet_grid(distr~censoredp)

## ----fig.width=8, fig.height=8, echo = FALSE, cache= TRUE----------------
ggplot(filter(pi_dat), aes(x=sample_size, y=cov_prob)) +
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    ylim(0,1) +
    geom_errorbar(aes(ymin=cov_prob - 2*cov_prob_se,
                      ymax = cov_prob + 2*cov_prob_se), width=.1) +
    xlab("Sample Size (log scale)") +
    ylab("Coverage Probs +/- 2 SEs") +
    ggtitle("P.I. Simulation, by Distribution and Censoring",
            subtitle = "Coverage Probabilities (zoomed out)") +
    scale_x_log10(breaks = c(20, 30, 50, 100, 250, 500, 1000, 2000)) +
    geom_hline(aes(yintercept = 0.90), colour="#BB0000", linetype="dashed", size = 1) +
    facet_grid(distr~censoredp)

## ----fig.width=8, fig.height=5, echo = FALSE, cache= TRUE----------------
ggplot(filter(pi_dat, distr == "Exponential"), aes(x=sample_size, y=int_width)) +
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    geom_line(aes(y = int_width_boot), color = "blue", size = 1.5) +
    ## geom_errorbar(aes(ymin=int_width - 2*int_width_se,
    ##                       ymax = int_width + 2*int_width_se), width=.1) +
    xlab("Sample Size (log scale)") +
    ylab("Interval Widths +/- 2 SEs") +
    ggtitle("P.I Simulation, Exponential Distribution",
            subtitle = "Interval Widths. naive method (black), simulation method (blue)") +
    scale_x_log10(breaks = c(20, 30, 50, 100, 250, 500, 1000, 2000)) +
    facet_wrap(~censoredp)

## ----fig.width=8, fig.height=5, echo = FALSE, cache= TRUE----------------
ggplot(filter(pi_dat, distr == "Loglogistic"), aes(x=sample_size, y=int_width)) +
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    geom_line(aes(y = int_width_boot), color = "blue", size = 1.5) +
    ## geom_errorbar(aes(ymin=int_width - 2*int_width_se,
    ##                   ymax = int_width + 2*int_width_se), width=.1) +
    xlab("Sample Size (log scale)") +
    ylab("Interval Widths +/- 2 SEs") +
    ggtitle("P.I Simulation, Loglogistic Distribution",
            subtitle = "Interval Widths. naive method (black), simulation method (blue)") +
    scale_x_log10(breaks = c(20, 30, 50, 100, 250, 500, 1000, 2000)) +
    facet_wrap(~censoredp)

## ----fig.width=8, fig.height=5, echo = FALSE, cache= TRUE----------------
ggplot(filter(pi_dat, distr == "Lognormal"), aes(x=sample_size, y=int_width)) +
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    geom_line(aes(y = int_width_boot), color = "blue", size = 1.5) +
    ## geom_errorbar(aes(ymin=int_width - 2*int_width_se,
    ##                   ymax = int_width + 2*int_width_se), width=.1) +
    xlab("Sample Size (log scale)") +
    ylab("Interval Widths +/- 2 SEs") +
    ggtitle("P.I Simulation, Lognormal Distribution",
            subtitle = "Interval Widths. naive method (black), simulation method (blue)") +
    scale_x_log10(breaks = c(20, 30, 50, 100, 250, 500, 1000, 2000)) +
    facet_wrap(~censoredp)

## ----fig.width=8, fig.height=5, echo = FALSE, cache= TRUE----------------
ggplot(filter(pi_dat, distr == "Weibull"), aes(x=sample_size, y=int_width)) +
    geom_point(size = 2) +
    geom_line(size = 1.5) +
    geom_line(aes(y = int_width_boot), color = "blue", size = 1.5) +
    ## geom_errorbar(aes(ymin=int_width - 2*int_width_se,
    ##                   ymax = int_width + 2*int_width_se), width=.1) +
    xlab("Sample Size (log scale)") +
    ylab("Interval Widths +/- 2 SEs") +
    ggtitle("P.I Simulation, Weibull Distribution",
            subtitle = "Interval Widths. naive method (black), simulation method (blue)") +
    scale_x_log10(breaks = c(20, 30, 50, 100, 250, 500, 1000, 2000)) +
    facet_wrap(~censoredp)

## ------------------------------------------------------------------------
sessionInfo()


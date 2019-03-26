## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
collapse = TRUE,
comment = "#>"
)

## ----gh-installation, eval = FALSE---------------------------------------
#  install.packages("devtools")
#  devtools::install_github("jrosen48/konfound")

## ---- eval = F-----------------------------------------------------------
#  library(konfound)

## ---- echo = F-----------------------------------------------------------
devtools::load_all(".")

## ------------------------------------------------------------------------
pkonfound(2, .4, 100, 3)

## ------------------------------------------------------------------------
pkonfound(.4, 2, 100, 3)

## ------------------------------------------------------------------------
pkonfound(est_eff = -2.2,
          std_err = .65, 
          n_obs = 200,
          n_covariates = 3)

## ------------------------------------------------------------------------
pkonfound(.4, 2, 100, 3, to_return = "thresh_plot")

## ------------------------------------------------------------------------
pkonfound(.4, 2, 100, 3, to_return = "corr_plot")

## ------------------------------------------------------------------------
model_output <- pkonfound(2, .4, 200, 3, to_return = c("raw_output", "thresh_plot", "corr_plot"))
summary(model_output)

## ------------------------------------------------------------------------
model_output$raw_output
model_output$thresh_plot
model_output$corr_plot

## ------------------------------------------------------------------------
pkonfound(.4, 2, 100, 3, to_return = "raw_output")

## ------------------------------------------------------------------------
m1 <- lm(mpg ~ wt + hp + qsec, data = mtcars)
m1

konfound(m1, hp)

## ------------------------------------------------------------------------
konfound_output <- konfound(m1, hp, to_return = c("raw_output", "thresh_plot", "corr_plot"))
summary(konfound_output)

## ------------------------------------------------------------------------
konfound_output$raw_output
konfound_output$thresh_plot

## ------------------------------------------------------------------------
konfound(m1, wt, test_all = TRUE)

## ------------------------------------------------------------------------
konfound(m1, wt, to_return = "table")

## ---- message = F--------------------------------------------------------
# if forcats is not installed, this install it first using install.packages("forcats") for this to run
if (requireNamespace("forcats")) {
    d <- forcats::gss_cat
    
    d$married <- ifelse(d$marital == "Married", 1, 0)
    
    m2 <- glm(married ~ age, data = d, family = binomial(link = "logit"))
    konfound(m2, age)
}

## ------------------------------------------------------------------------
if (requireNamespace("lme4")) {
    library(lme4)
    m3 <- fm1 <- lmer(Reaction ~ Days + (1 | Subject), sleepstudy)
    konfound(m3, Days)
}

## ------------------------------------------------------------------------
d <- read.csv("https://msu.edu/~kenfrank/example%20dataset%20for%20mkonfound.csv")
head(d)
mkonfound(d, t, df)

## ------------------------------------------------------------------------
mkonfound(d, t, df, return_plot = T)


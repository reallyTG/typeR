## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(fig.width=8, fig.height=5.33, fig.path='Figs/',
                      echo=TRUE, warning=FALSE, message=FALSE)

## ------------------------------------------------------------------------
s_reg_A <- c(2, 2, 2, 2)
s_reg_B <- c(4, 1, 1, 2)
s_reg_C <- c(2, 4, 2)
s_reg_D <- c(1, 3, 3, 1)

## ------------------------------------------------------------------------
library(TeachBayes)
many_spinner_plots(list(s_reg_A, s_reg_B, 
                        s_reg_C, s_reg_D))

## ------------------------------------------------------------------------
(Prob <- spinner_likelihoods(list(s_reg_A, s_reg_B, s_reg_C, s_reg_D)))

## ------------------------------------------------------------------------
(spins <- spinner_data(s_reg_B, nsim=10))

## ------------------------------------------------------------------------
likelihoods <- dspinner(spins, Prob)

## ------------------------------------------------------------------------
models <- c("Spinner A", "Spinner B", "Spinner C", "Spinner D")
prior <- rep(1/4, 4)
bayes_table <- data.frame(Model=models,
                          Prior=prior,
                          Likelihood=likelihoods)
(bayesian_crank(bayes_table) -> bayes_table)

## ------------------------------------------------------------------------
prior_post_plot(bayes_table)


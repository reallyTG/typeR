## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(fig.width=6, fig.height=4, fig.path='Figs/',
                      echo=TRUE, warning=FALSE, message=FALSE)

## ------------------------------------------------------------------------
library(TeachBayes)
bayes_df <- data.frame(B=0:50, Prior=rep(1/51, 51))

## ------------------------------------------------------------------------
sample_b <- 3
pop_N <- 50
sample_n <- 10
bayes_df$Likelihood <- dsampling(sample_b, pop_N, 
                                 bayes_df$B, sample_n)

## ------------------------------------------------------------------------
bayes_df <- bayesian_crank(bayes_df)

## ------------------------------------------------------------------------
prior_post_plot(bayes_df)

## ------------------------------------------------------------------------
library(dplyr)
discint(select(bayes_df, B, Posterior), 0.90)


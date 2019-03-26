## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, fig.height = 5, fig.width = 7)
library(fitur)
library(ggplot2)

## ----stats---------------------------------------------------------------
set.seed(438)
x <- rweibull(10000, shape = 5, scale = 1)

## ----histPlot------------------------------------------------------------
dt <- data.frame(x)
nbins <- 30
g <- ggplot(dt, aes(x)) +
  geom_histogram(aes(y = ..density..), 
                bins = nbins, fill = NA, color = "black") +
  theme_bw() +
  theme(panel.grid = element_blank())
g

## ----densPlot------------------------------------------------------------
dists <- c('gamma', 'lnorm', 'weibull')
multipleFits <- lapply(dists, fit_univariate, x = x)
plot_density(x, multipleFits, 30) + theme_bw() +
  theme(panel.grid = element_blank())

## ----qqplot--------------------------------------------------------------
plot_qq(x, multipleFits) +
  theme_bw() +
  theme(panel.grid = element_blank())

## ----ppplot--------------------------------------------------------------
plot_pp(x, multipleFits) +
  theme_bw() +
  theme(panel.grid = element_blank())


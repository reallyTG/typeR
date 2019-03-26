## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(fig.width=6, fig.height=4, fig.path='Figs/',
                      echo=TRUE, warning=FALSE, message=FALSE)

## ------------------------------------------------------------------------
library(TeachBayes)
quantile1 <- list(x = .7, p = .5)
quantile2 <- list(x = .85, p = .9)
(ab <- beta.select(quantile1, quantile2))

## ------------------------------------------------------------------------
beta_interval(.9, ab)

## ------------------------------------------------------------------------
beta_area(0, .75, ab)

## ------------------------------------------------------------------------
p <- beta_data(ab)
ggplot(data.frame(p=p), aes(x=p)) +
  geom_histogram(aes(y = ..density..), 
                 fill="orange", color="black") + 
  geom_density()


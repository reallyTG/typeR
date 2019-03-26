## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(dev="svg", fig.width=7, fig.height=7)

## ------------------------------------------------------------------------
library(BeviMed)
set.seed(0)

## ------------------------------------------------------------------------
G <- matrix(rbinom(size=2, prob=0.02, n=100*20), nrow=100, ncol=20)
y_random <- runif(n=nrow(G)) < 0.1

prob_association(G=G, y=y_random)

## ------------------------------------------------------------------------
y_dependent <- apply(G, 1, function(variants) sum(variants[1:3]) > 0)

prob_association(G=G, y=y_dependent)

## ------------------------------------------------------------------------
output <- summary(bevimed(G=G, y=y_dependent))
output


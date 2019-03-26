## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(fig.width = 5, fig.height = 5)

## ------------------------------------------------------------------------
library(ggplot2)

library(disclapmix)
data(danes)

## ------------------------------------------------------------------------
db <- as.matrix(danes[rep(seq_len(nrow(danes)), danes$n), seq_len(ncol(danes)-1)])
str(db)

## ---- eval=FALSE---------------------------------------------------------
#  fit <- disclapmix(x = db, clusters = 2L)

## ------------------------------------------------------------------------
clusters <- 1L:5L
fits <- lapply(clusters, function(clusters) {
  fit <- disclapmix(x = db, clusters = clusters)
  return(fit)
})

marginalBICs <- sapply(fits, function(fit) {
  fit$BIC_marginal
})

bestfit <- fits[[which.min(marginalBICs)]]

## ------------------------------------------------------------------------
bestfit
summary(bestfit)

## ---- fig.width=10-------------------------------------------------------
plot(bestfit)

## ------------------------------------------------------------------------
bestfit$y
bestfit$disclap_parameters

## ------------------------------------------------------------------------
disclap_estimates <- predict(bestfit, 
                             newdata = as.matrix(danes[, 1:(ncol(danes) - 1)]))

## ------------------------------------------------------------------------
ggplot() +
  geom_abline(intercept = 0, slope = 1) +
  geom_point(aes(x = danes$n/sum(danes$n), y = disclap_estimates)) +
  labs(x = "Observed frequency",
       y = "Predicted frequency (discrete Laplace)") +
  theme_bw() +
  scale_x_log10() +
  scale_y_log10()


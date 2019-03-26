## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE)

## ------------------------------------------------------------------------
library(revdbayes)
# Set a threshold at the 90% quantile
thresh <- quantile(newlyn, probs = 0.90)
# MLE, SE and 95% likelihood-based confidence interval
mle <- kgaps_mle(newlyn, thresh, conf = 95)
mle$theta_mle
mle$theta_se
mle$theta_ci

## ---- fig.width = 5, fig.align='center'----------------------------------
thresh <- quantile(newlyn, probs = 0.90)
postsim <- kgaps_post(newlyn, thresh)
plot(postsim, xlab = expression(theta))


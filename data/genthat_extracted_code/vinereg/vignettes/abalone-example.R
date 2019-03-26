## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, warning = FALSE)

## ---- message = FALSE----------------------------------------------------
library(vinereg) 
library(ggplot2)
library(dplyr)
library(tidyr)

## ------------------------------------------------------------------------
set.seed(5)

## ------------------------------------------------------------------------
data(abalone, package = "PivotalR")
abalone_f <- abalone %>%
    dplyr::filter(sex == "F") %>%        # select female abalones
    dplyr::select(-id, -sex) %>%         # remove id and sex variables
    dplyr::filter(height < max(height))  # remove height outlier

## ---- fig.width=7, fig.height=6------------------------------------------
pairs(abalone_f, pch = ".")

## ------------------------------------------------------------------------
(fit_vine_par <- vinereg(
    whole ~ length + diameter + height, 
    data = abalone_f, 
    selcrit = "aic"
))

## ------------------------------------------------------------------------
fit_vine_par$order

## ------------------------------------------------------------------------
summary(fit_vine_par$vine)

## ---- fig.width=7, fig.height=7------------------------------------------
contour(fit_vine_par$vine)

## ------------------------------------------------------------------------
# quantile levels
alpha_vec <- c(0.1, 0.5, 0.9) 

## ------------------------------------------------------------------------
pred_vine_par <- fitted(fit_vine_par, alpha = alpha_vec)
# equivalent to:
# predict(fit_vine_par, newdata = abalone.f, alpha = alpha_vec)
head(pred_vine_par)

## ---- fig.width=7, fig.height=4------------------------------------------
plot_effects(fit_vine_par)

## ---- fig.width=7, fig.height=6------------------------------------------
pred_lqr <- pred_vine_par
for (a in seq_along(alpha_vec)) {
    my.rq <- quantreg::rq(
        whole ~ length + diameter + height, 
        tau = alpha_vec[a], 
        data = abalone_f
    )
    pred_lqr[, a] <- quantreg::predict.rq(my.rq)
}

plot_marginal_effects <- function(covs, preds) {
    cbind(covs, preds) %>%
        tidyr::gather(alpha, prediction, -seq_len(NCOL(covs))) %>%
        dplyr::mutate(prediction = as.numeric(prediction)) %>%
        tidyr::gather(variable, value, -(alpha:prediction)) %>%
        ggplot(aes(value, prediction, color = alpha)) +
        geom_point(alpha = 0.15) + 
        geom_smooth(method = "gam", formula = y ~ s(x, bs = "cs"), se = FALSE) + 
        facet_wrap(~ variable, scale = "free_x") +
        ylab(quote(q(y* "|" * x[1] * ",...," * x[p]))) +
        xlab(quote(x[k])) +
        theme(legend.position = "bottom")
}
plot_marginal_effects(abalone_f[, 1:3], pred_lqr)

## ---- fig.width=4.6, fig.height=4.6--------------------------------------
(fit_vine_np <- vinereg(
    whole ~ length + diameter + height,
    data = abalone_f,
    family_set = "nonpar",
    selcrit = "aic"
))
contour(fit_vine_np$vine)

## ---- fig.width=7, fig.height=4------------------------------------------
plot_effects(fit_vine_np, var = c("diameter", "height", "length"))

## ---- fig.width=4.7, fig.height=4----------------------------------------
abalone_f$rings <- as.ordered(abalone_f$rings)
(fit_disc <- vinereg(
    rings ~ .,
    data = abalone_f,
    family_set = "nonpar", 
    selcrit = "aic"
))
plot_effects(fit_disc)


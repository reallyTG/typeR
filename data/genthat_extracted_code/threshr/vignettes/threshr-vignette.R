## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE)

## ---- include = FALSE----------------------------------------------------
set.seed(22082017)

## ---- fig.show='hold', fig.height=5, fig.width=7, fig.align='center'-----
library(threshr)

# Set the size of the posterior sample simulated at each threshold
n <- 10000

## North Sea significant wave heights

# Set a vector of training thresholds
u_vec_ns <- quantile(ns, probs = seq(0, 0.85, by = 0.05))
# Compare the predictive performances of the training thresholds
ns_cv <- ithresh(data = ns, u_vec = u_vec_ns, n = n)

## Gulf of Mexico significant wave heights

# Set a vector of training thresholds
u_vec_gom <- quantile(gom, probs = seq(0, 0.8, by = 0.05))
# Compare the predictive performances of the training thresholds
gom_cv <- ithresh(data = gom, u_vec = u_vec_gom, n = n)

## ---- fig.show='hold', fig.height=5, fig.width=7, fig.align='center'-----
plot(ns_cv, lwd = 2, cex.axis = 0.8)
mtext("North Sea : significant wave height / m", side = 3, line = 2.5)

plot(gom_cv, lwd = 2, cex.axis = 0.8)
mtext("Gulf of Mexico: significant wave height / m", side = 3, line = 2.5)

## ------------------------------------------------------------------------
summary(ns_cv)
summary(gom_cv)

## ---- fig.show='hold', fig.width=3.45, fig.height=3.45-------------------
# Plot of Generalized Pareto posterior sample at the best threshold
# (based on the lowest validation threshold)
plot(ns_cv, which_u = "best")
plot(gom_cv, which_u = "best")

## ---- fig.show='hold', fig.height=5, fig.width=7, fig.align='center'-----
# Predictive distribution function
best_p <- predict(gom_cv, n_years = c(100, 1000), type = "d")
plot(best_p)

## ---- fig.show='hold', fig.height=5, fig.width=7, fig.align='center'-----
### All thresholds plus weighted average of inferences over all thresholds
all_p <- predict(gom_cv, which_u = "all")
plot(all_p)


library(pegas)


### Name: theta.tree
### Title: Population Parameter THETA Using Genealogy
### Aliases: theta.tree
### Keywords: models

### ** Examples

tr <- rcoal(50) # assumes theta = 2
(o <- theta.tree(tr))
theta.tree(tr, 10, analytical = FALSE) # uses nlminb()
## profile log-likelihood:
THETA <- seq(0.5, 4, 0.01)
logLikelihood <- theta.tree(tr, THETA, fixed = TRUE)
plot(THETA, logLikelihood, type = "l")
xx <- seq(o$theta - 1.96 * o$se, o$theta + 1.96 * o$se, 0.01)
yy <- theta.tree(tr, xx, fixed = TRUE)
polygon(c(xx, rev(xx)), c(yy, rep(0, length(xx))),
        border = NA, col = "lightblue")
segments(o$theta, 0, o$theta, o$logLik, col = "blue")
abline(v = 2, lty = 3)
legend("bottomright", legend = expression("log-likelihood",
       "True " * theta, hat(theta) * " (MLE)", "95%\ conf. interv."),
       lty = c(1, 3, 1, 1), lwd = c(1, 1, 1, 15),
       col = c("black", "black", "blue", "lightblue"))




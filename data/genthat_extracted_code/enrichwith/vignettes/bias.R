## ---- echo = TRUE, eval = TRUE-------------------------------------------
# Get the data from the online supplmementary material of Agresti (2015)
data("endometrial", package = "enrichwith")
modML <- glm(HG ~ NV + PI + EH, family = binomial("probit"), data = endometrial)
theta_mle <- coef(modML)
summary(modML)

## ---- echo = TRUE, eval = TRUE, messages = FALSE-------------------------
library("brglm")
modBR <- brglm(HG ~ NV + PI + EH, family = binomial("probit"), data = endometrial)
theta_brglm <- coef(modBR)
summary(modBR)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
library("enrichwith")
enriched_modML <- enrich(modML, with = "auxiliary functions")

## ---- echo = TRUE, eval = TRUE-------------------------------------------
# Extract the ingredients for the quasi Fisher scoring iteration from the enriched glm object
gradient <- enriched_modML$auxiliary_functions$score # gradient of the log-likelihood
information <- enriched_modML$auxiliary_functions$information # information matrix
bias <- enriched_modML$auxiliary_functions$bias # first-order bias

## ---- echo = TRUE, eval = TRUE-------------------------------------------
# The quasi Fisher scoring iteration using c(theta) = identity
for (k in seq.int(maxit)) {
    s_vector <- gradient(theta_current)
    i_matrix <- information(theta_current, type = "expected")
    b_vector <- bias(theta_current)
    step <- solve(i_matrix) %*% s_vector - b_vector
    theta_current <- theta_current + step
    # A stopping criterion
    if (all(abs(step) < epsilon)) {
        break
    }
}
(theta_e <- drop(theta_current))

## ---- echo = TRUE, eval = TRUE-------------------------------------------
all.equal(theta_e, theta_brglm, check.attributes = FALSE, tolerance = epsilon)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
# The quasi Fisher scoring iteration using c(theta) = solve(i(theta)) %*% j(theta)
for (k in seq.int(maxit)) {
    s_vector <- gradient(theta_current)
    i_matrix <- information(theta_current, type = "expected")
    j_matrix <- information(theta_current, type = "observed")
    b_vector <- bias(theta_current)
    step <- solve(i_matrix) %*% (s_vector - j_matrix %*% b_vector)
    theta_current <- theta_current + step
    # A stopping criterion
    if (all(abs(step) < epsilon)) {
        break
    }
}
(theta_o <- drop(theta_current))

## ---- echo = TRUE, eval = TRUE-------------------------------------------
round(data.frame(theta_mle, theta_e, theta_o), 3)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
se_theta_mle <- sqrt(diag(solve(information(theta_mle, type = "expected"))))
se_theta_e <- sqrt(diag(solve(information(theta_e, type = "expected"))))
se_theta_o <- sqrt(diag(solve(information(theta_o, type = "expected"))))
round(data.frame(z_mle = theta_mle/se_theta_mle,
                 z_br_e = theta_e/se_theta_e,
                 z_br_o = theta_o/se_theta_o), 3)


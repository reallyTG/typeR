## ---- echo = TRUE, eval = TRUE-------------------------------------------
clotting <- data.frame(conc = c(5,10,15,20,30,40,60,80,100,
                                5,10,15,20,30,40,60,80,100),
                       time = c(118, 58, 42, 35, 27, 25, 21, 19, 18,
                                69, 35, 26, 21, 18, 16, 13, 12, 12),
                       lot = factor(c(rep(1, 9), rep(2, 9))))

## ---- echo = TRUE, eval = TRUE-------------------------------------------
library("ggplot2")
clottingML <- glm(time ~ log(conc) * lot, family = Gamma, data = clotting)
alpha <- 0.01
pr_out <- predict(clottingML, type = "response", se.fit = TRUE)
new_data <- clotting
new_data$time <- pr_out$fit
new_data$type <- "fitted"
clotting$type <- "observed"
all_data <- rbind(clotting, new_data)
new_data <- within(new_data, {
    low <- pr_out$fit - qnorm(1 - alpha/2) * pr_out$se.fit
    upp <- pr_out$fit + qnorm(1 - alpha/2) * pr_out$se.fit
})
ggplot(all_data) +
    geom_point(aes(conc, time, col = type), alpha = 0.8) +
    geom_segment(data = new_data, aes(x = conc, y = low, xend = conc, yend = upp, col = type)) +
    facet_grid(. ~ lot) +
    theme_bw() +
    theme(legend.position = "top")

## ---- echo = TRUE, eval = TRUE-------------------------------------------
library("enrichwith")
enriched_clottingML <- enrich(clottingML, with = "auxiliary functions")
scores_clottingML <- enriched_clottingML$auxiliary_functions$score

## ---- echo = TRUE, eval = TRUE-------------------------------------------
scores_clottingML <- get_score_function(clottingML)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
scores_clottingML()

## ---- echo = TRUE, eval = TRUE-------------------------------------------
info_clottingML <- enriched_clottingML$auxiliary_functions$information

## ---- echo = TRUE, eval = TRUE-------------------------------------------
info_clottingML <- get_information_function(clottingML)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
summary_clottingML <- summary(clottingML)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
summary_std_errors <- coef(summary_clottingML)[, "Std. Error"]
einfo <- info_clottingML(dispersion = summary_clottingML$dispersion)
all.equal(sqrt(diag(solve(einfo)))[1:4], summary_std_errors, tolerance = 1e-05)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
oinfo <- info_clottingML(dispersion = summary_clottingML$dispersion, type = "observed")
all.equal(oinfo[1:4, 1:4], einfo[1:4, 1:4])

## ---- echo = TRUE, eval = TRUE-------------------------------------------
clottingML_log <- update(clottingML, family = Gamma("log"))
summary_clottingML_log <- summary(clottingML_log)
info_clottingML_log <- get_information_function(clottingML_log)
einfo_log <- info_clottingML_log(dispersion = summary_clottingML_log$dispersion, type = "expected")
oinfo_log <- info_clottingML_log(dispersion = summary_clottingML_log$dispersion, type = "observed")
round(einfo_log, 3)
round(oinfo_log, 3)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
clottingML_nested <- update(clottingML, . ~ log(conc))
enriched_clottingML_nested <- enrich(clottingML_nested, with = "mle of dispersion")
coef_full <- coef(clottingML)
coef_hypothesis <- structure(rep(0, length(coef_full)), names = names(coef_full))
coef_hypothesis_short <- coef(enriched_clottingML_nested, model = "mean")
coef_hypothesis[names(coef_hypothesis_short)] <- coef_hypothesis_short
disp_hypothesis <- coef(enriched_clottingML_nested, model = "dispersion")
scores <- scores_clottingML(coef_hypothesis, disp_hypothesis)
info <- info_clottingML(coef_hypothesis, disp_hypothesis)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
(score_statistic <- drop(scores%*%solve(info)%*%scores))

## ---- echo = TRUE, eval = TRUE-------------------------------------------
pchisq(score_statistic, 2, lower.tail = FALSE)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
coef_full[3:4]%*%solve(solve(info)[3:4, 3:4])%*%coef_full[3:4]

## ---- echo = TRUE, eval = TRUE-------------------------------------------
(deviance(clottingML_nested) - deviance(clottingML))/disp_hypothesis

## ---- echo = TRUE, eval = TRUE-------------------------------------------
simulate_clottingML <- get_simulate_function(clottingML)
simulate_clottingML(nsim = 3, seed = 123)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
simulate(clottingML, nsim = 3, seed = 123)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
coefficients <- c(0, 0.01, 0, 0.01)
dispersion <- 0.001
samples <- simulate_clottingML(coefficients = coefficients, dispersion = dispersion, nsim = 500000, seed = 123)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
means <- 1/(model.matrix(clottingML) %*% coefficients)
variances <- dispersion * means^2
max(abs(rowMeans(samples) - means))
max(abs(apply(samples, 1, var) - variances))

## ---- echo = TRUE, eval = TRUE-------------------------------------------
cML_dmodel <- get_dmodel_function(clottingML)
cML_dmodel()

## ---- echo = TRUE, eval = TRUE-------------------------------------------
cML_dmodel(coefficients = c(-0.01, 0.02, -0.01, 0), dispersion = 0.1)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
new_data <- data.frame(conc = 5:10, time = 50:45, lot = factor(c(1, 1, 1, 2, 2, 2)))
cML_dmodel(data = new_data, coefficients = c(-0.01, 0.02, -0.01, 0), dispersion = 0.1)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
cML_qmodel <- get_qmodel_function(clottingML)
cML_pmodel <- get_pmodel_function(clottingML)
probs <- cML_pmodel(data = new_data, coefficients = c(-0.01, 0.02, -0.01, 0), dispersion = 0.1)
cML_qmodel(probs, data = new_data, coefficients = c(-0.01, 0.02, -0.01, 0), dispersion = 0.1)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
new_data <- expand.grid(conc = c(15, 40),
                        lot = factor(1:2),
                        time = seq(0, 50, length = 100))
new_data$density <- cML_dmodel(new_data)
ggplot(data = new_data) +
    geom_line(aes(time, density)) + facet_grid(conc ~ lot) +
    theme_bw() +
    geom_vline(data = clotting[c(3, 6, 12, 15), ], aes(xintercept = time), lty = 2)

## ---- echo = TRUE, eval = TRUE-------------------------------------------
enriched_clottingML <- enriched_glm(time ~ log(conc) * lot, family = Gamma, data = clotting)
names(enriched_clottingML$auxiliary_functions)
enriched_clottingML$score_mle
enriched_clottingML$expected_information_mle
enriched_clottingML$observed_information_mle
enriched_clottingML$bias_mle
enriched_clottingML$dispersion_mle


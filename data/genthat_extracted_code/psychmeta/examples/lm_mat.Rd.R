library(psychmeta)


### Name: lm_mat
### Title: Compute linear regression models and generate "lm" objects from
###   covariance matrices.
### Aliases: lm_mat matrixreg matreg lm_matrix

### ** Examples

## Generate data
S <- reshape_vec2mat(cov = c(.3 * 2 * 3,
                             .4 * 2 * 4,
                             .5 * 3 * 4),
                     var = c(2, 3, 4)^2,
                     var_names = c("X", "Y", "Z"))
mean_vec <- setNames(c(1, 2, 3), colnames(S))
dat <- data.frame(MASS::mvrnorm(n = 100, mu = mean_vec,
                                Sigma = S, empirical = TRUE))

## Compute regression models with lm
lm_out1 <- lm(Y ~ X, data = dat)
lm_out2 <- lm(Y ~ X + Z, data = dat)

## Compute regression models with lm_mat
matreg_out1 <- lm_mat(formula = Y ~ X, cov_mat = S, mean_vec = mean_vec, n = nrow(dat))
matreg_out2 <- lm_mat(formula = Y ~ X + Z, cov_mat = S, mean_vec = mean_vec, n = nrow(dat))

## Compare results of lm and lm_mat with one predictor
lm_out1
matreg_out1

## Compare summaries of lm and lm_mat with one predictor
summary(lm_out1)
summary(matreg_out1)

## Compare results of lm and lm_mat with two predictors
lm_out2
matreg_out2

## Compare summaries of lm and lm_mat with two predictors
summary(lm_out2)
summary(matreg_out2)

## Compare predictions made with lm and lm_mat
predict(object = matreg_out1, newdata = data.frame(X = 1:5))
predict(object = summary(matreg_out1), newdata = data.frame(X = 1:5))
predict(lm_out1, newdata = data.frame(X = 1:5))

## Compare predictions made with lm and lm_mat (with confidence intervals)
predict(object = matreg_out1, newdata = data.frame(X = 1:5),
        se.fit = TRUE, interval = "confidence")
predict(lm_out1, newdata = data.frame(X = 1:5),
        se.fit = TRUE, interval = "confidence")

## Compare predictions made with lm and lm_mat (with prediction intervals)
predict(object = matreg_out1, newdata = data.frame(X = 1:5),
        se.fit = TRUE, interval = "prediction")
predict(lm_out1, newdata = data.frame(X = 1:5),
        se.fit = TRUE, interval = "prediction")

## Compare model comparisons computed using lm and lm_mat objects
anova(lm_out1, lm_out2)
anova(matreg_out1, matreg_out2)

## Model comparisons can be run on lm_mat summaries, too:
anova(summary(matreg_out1), summary(matreg_out2))
## Or summaries and raw models can be mixed:
anova(matreg_out1, summary(matreg_out2))
anova(summary(matreg_out1), matreg_out2)


## Compare confidence intervals computed using lm and lm_mat objects
confint(object = lm_out1)
confint(object = matreg_out1)
confint(object = summary(matreg_out1))

confint(object = lm_out2)
confint(object = matreg_out2)
confint(object = summary(matreg_out2))




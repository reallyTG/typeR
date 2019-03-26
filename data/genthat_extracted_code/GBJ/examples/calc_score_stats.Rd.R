library(GBJ)


### Name: calc_score_stats
### Title: calc_score_stats.R
### Aliases: calc_score_stats

### ** Examples

Y <- rbinom(n=100, size=1, prob=0.5)
null_mod <- glm(Y~1, family=binomial(link="logit"))
factor_mat <- matrix(data=rnorm(n=100*5), nrow=100)
calc_score_stats(null_mod, factor_mat, "logit")




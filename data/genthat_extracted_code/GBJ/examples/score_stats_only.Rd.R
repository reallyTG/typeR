library(GBJ)


### Name: score_stats_only
### Title: score_stats_only.R
### Aliases: score_stats_only

### ** Examples

Y <- rbinom(n=100, size=1, prob=0.5)
null_mod <- glm(Y~1, family=binomial(link="logit"))
factor_matrix <- matrix(data=rnorm(n=100*5), nrow=100)
score_stats_only(null_mod, factor_matrix, "logit")




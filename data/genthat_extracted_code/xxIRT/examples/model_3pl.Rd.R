library(xxIRT)


### Name: model_3pl
### Title: 3-parameter-logistic model
### Aliases: model_3pl model_3pl_prob model_3pl_info model_3pl_lik
###   model_3pl_rescale model_3pl_gendata model_3pl_plot
###   model_3pl_plot_loglik model_3pl_jmle model_3pl_mmle
###   model_3pl_eap_scoring model_3pl_fitplot

### ** Examples

model_3pl_prob(c(-1, 1), c(1, .8, .8), c(-1, 1, 1), c(0, 0, .2), 1.702)
model_3pl_prob(c(-1, 1), c(1, .8, .8), c(-1, 1, 1), c(0, 0, .2), 1.0)
model_3pl_info(c(-1, 1), c(1, .8, .8), c(-1, 1, 1), c(0, 0, .2), 1.702)
model_3pl_info(c(-1, 1), c(1, .8, .8), c(-1, 1, 1), c(0, 0, .2), 1.0)
u <- matrix(c(1, 0, 1, 0, 1, 0), nrow=2)
model_3pl_lik(u, c(-1, 1), c(1, .8, .8), c(-1, 1, 1), c(0, 0, .2), 1.702, FALSE)
model_3pl_lik(u, c(-1, 1), c(1, .8, .8), c(-1, 1, 1), c(0, 0, .2), 1.0, TRUE)
model_3pl_gendata(10, 5)
model_3pl_gendata(10, 5, a=1, c=0, missing=.1)
with(model_3pl_gendata(10, 5), model_3pl_plot(a, b, c, type="prob"))
with(model_3pl_gendata(10, 5), model_3pl_plot(a, b, c, type="info", total=TRUE))
with(model_3pl_gendata(5, 50), model_3pl_plot_loglik(u, a, b, c, show_mle=TRUE))
## Not run: 
##D data_tru <- model_3pl_gendata(3000, 50)
##D data_est <- model_3pl_jmle(u=data_tru$u, scale=c(0, 1), priors=NULL, debug=TRUE)
##D evaluate_3pl_estimation(data_tru, data_est)
## End(Not run)
## Not run: 
##D data_tru <- model_3pl_gendata(3000, 50)
##D data_est <- model_3pl_mmle(u=data_tru$u, scale=NULL, priors=NULL, debug=TRUE)
##D evaluate_3pl_estimation(data_tru, data_est)
## End(Not run)
x <- model_3pl_gendata(1000, 20)
with(x, model_3pl_fitplot(u, t, a, b, c, c(1, 3, 5)))




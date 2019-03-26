library(mcglm)


### Name: mc_link_function
### Title: Link Functions
### Aliases: mc_link_function mc_logit mc_probit mc_cauchit mc_cloglog
###   mc_loglog mc_identity mc_log mc_sqrt mc_invmu2 mc_inverse

### ** Examples

x1 <- seq(-1, 1, l = 5)
X <- model.matrix(~ x1)
mc_link_function(beta = c(1,0.5), X = X,
                 offset = NULL, link = 'log')
mc_link_function(beta = c(1,0.5), X = X,
                 offset = rep(10,5), link = 'identity')




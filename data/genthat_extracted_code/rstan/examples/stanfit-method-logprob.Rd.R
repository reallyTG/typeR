library(rstan)


### Name: log_prob-methods
### Title: 'log_prob' and 'grad_log_prob' functions
### Aliases: log_prob log_prob,stanfit-method grad_log_prob
###   grad_log_prob,stanfit-method constrain_pars
###   constrain_pars,stanfit-method unconstrain_pars
###   unconstrain_pars,stanfit-method get_num_upars
###   get_num_upars,stanfit-method

### ** Examples
## Not run: 
##D # see the examples in the help for stanfit as well
##D # do a simple optimization problem 
##D opcode <- "
##D parameters {
##D   real y;
##D }
##D model {
##D   target += log(square(y - 5) + 1);
##D }
##D "
##D opfit <- stan(model_code = opcode, chains = 0)
##D tfun <- function(y) log_prob(opfit, y)
##D tgrfun <- function(y) grad_log_prob(opfit, y)
##D or <- optim(1, tfun, tgrfun, method = 'BFGS')
##D print(or)
##D 
##D # return the gradient as an attribute
##D tfun2 <- function(y) { 
##D   g <- grad_log_prob(opfit, y) 
##D   lp <- attr(g, "log_prob")
##D   attr(lp, "gradient") <- g
##D   lp
##D } 
##D 
##D or2 <- nlm(tfun2, 10)
##D or2 
## End(Not run)



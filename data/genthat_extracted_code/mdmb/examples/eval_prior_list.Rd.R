library(mdmb)


### Name: eval_prior_list
### Title: Evaluates Several Prior Distributions
### Aliases: eval_prior_list eval_prior_list_sumlog

### ** Examples

#############################################################################
# EXAMPLE 1: Evaluation of prior values
#############################################################################

# normal distribution
b0 <- list( "dnorm", list(mean=0,sd=100) )
# t distribution with one degree of freedom (Cauchy distribution)
b1 <- list( "dt", list(df=1) )
# define list of priors
beta_prior <- list( b0, b1 )
# parameter value
beta <- c( 0.3, 1 )

#-- evaluate priors
mdmb::eval_prior_list(par=beta, par_prior=beta_prior)
mdmb::eval_prior_list_sumlog(par=beta, par_prior=beta_prior)




library(geex)


### Name: nobs,geex-method
### Title: Extract the number observations
### Aliases: nobs,geex-method nobs,geex,geex-method
###   nobs,geex_summary-method nobs,geex_summary,geex_summary-method

### ** Examples

## Not run: 
##D library(geepack)
##D data('ohio')
##D 
##D glmfit  <- glm(resp ~ age, data = ohio,
##D               family = binomial(link = "logit"))
##D z  <- m_estimate(
##D   estFUN = example_ee,
##D   data = ohio,
##D   compute_roots = FALSE,
##D   units = 'id',
##D   roots = coef(glmfit),
##D   outer_args = list(model = glmfit))
##D 
##D nobs(z)
## End(Not run)




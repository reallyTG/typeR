library(geex)


### Name: summary,geex-method
### Title: Object Summaries
### Aliases: summary,geex-method

### ** Examples

## Not run: 
##D library(geepack)
##D data('ohio')
##D glmfit  <- glm(resp ~ age, data = ohio,
##D               family = binomial(link = "logit"))
##D example_ee <- function(data, model){
##D   f <- grab_psiFUN(model, data)
##D   function(theta){
##D     f(theta)
##D   }
##D }
##D z  <- m_estimate(
##D estFUN = example_ee,
##D data = ohio,
##D compute_roots = FALSE,
##D units = 'id',
##D roots = coef(glmfit),
##D outer_args = list(model = glmfit))
##D 
##D object.size(z)
##D object.size(summary(z))
##D object.size(summary(z, keep_data = FALSE))
##D object.size(summary(z, keep_data = FALSE, keep_args = FALSE))
## End(Not run)




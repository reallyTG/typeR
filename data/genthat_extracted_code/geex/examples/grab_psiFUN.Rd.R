library(geex)


### Name: grab_psiFUN
### Title: Grab estimating functions from a model object
### Aliases: grab_psiFUN grab_psiFUN.glm grab_psiFUN.geeglm
###   grab_psiFUN.merMod

### ** Examples


## Not run: 
##D library(geepack)
##D data('ohio')
##D 
##D glmfit  <- glm(resp ~ age, data = ohio,
##D                family = binomial(link = "logit"))
##D geefit  <- geeglm(resp ~ age, data = ohio, id = id,
##D                   family = binomial(link = "logit"))
##D glmmfit <- glmer(resp ~ age + (1|id), data = ohio,
##D                  family = binomial(link = "logit"))
##D example_ee <- function(data, model){
##D  f <- grab_psiFUN(model, data)
##D  function(theta){
##D   f(theta)
##D  }
##D }
##D 
##D m_estimate(
##D   estFUN = example_ee,
##D   data = ohio,
##D   compute_roots = FALSE,
##D   units = 'id',
##D   roots = coef(glmfit),
##D   outer_args = list(model = glmfit))
##D m_estimate(
##D   estFUN = example_ee,
##D   data = ohio,
##D   compute_roots = FALSE,
##D   units = 'id',
##D   roots = coef(geefit),
##D   outer_args = list(model = geefit))
##D m_estimate(
##D   estFUN = example_ee,
##D   data = ohio,
##D   compute_roots = FALSE,
##D   units = 'id',
##D   roots = unlist(getME(glmmfit, c('beta', 'theta'))),
##D   outer_args = list(model = glmmfit))
##D  
## End(Not run)




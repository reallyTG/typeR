library(brms)


### Name: theme_black
### Title: Black Theme for 'ggplot2' Graphics
### Aliases: theme_black

### ** Examples

## Not run: 
##D # change default ggplot theme
##D theme_set(theme_black())
##D 
##D # change default bayesplot color scheme
##D bayesplot::color_scheme_set("viridisC")
##D 
##D # fit a simple model
##D fit <- brm(count ~ log_Age_c + log_Base4_c * Trt + (1|patient),
##D            data = epilepsy, family = poisson(), chains = 2)
##D summary(fit)
##D            
##D # create various plots
##D plot(marginal_effects(fit), ask = FALSE)
##D pp_check(fit)
##D stanplot(fit, type = "hex", pars = c("b_Intercept", "b_Trt1"))
## End(Not run)





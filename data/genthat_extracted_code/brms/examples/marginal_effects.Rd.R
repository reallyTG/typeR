library(brms)


### Name: marginal_effects.brmsfit
### Title: Display Marginal Effects of Predictors
### Aliases: marginal_effects.brmsfit marginal_effects
###   plot.brmsMarginalEffects

### ** Examples

## Not run: 
##D fit <- brm(count ~ log_Age_c + log_Base4_c * Trt + (1 | patient),
##D            data = epilepsy, family = poisson()) 
##D            
##D ## plot all marginal effects
##D plot(marginal_effects(fit), ask = FALSE)
##D 
##D ## change colours to grey scale
##D me <- marginal_effects(fit, "log_Base4_c:Trt")
##D plot(me, plot = FALSE)[[1]] + 
##D   scale_color_grey() +
##D   scale_fill_grey()
##D 
##D ## only plot the marginal interaction effect of 'log_Base4_c:Trt'
##D ## for different values for 'log_Age_c'
##D conditions <- data.frame(log_Age_c = c(-0.3, 0, 0.3))
##D plot(marginal_effects(fit, effects = "log_Base4_c:Trt", 
##D                       conditions = conditions))
##D                       
##D ## also incorporate random effects variance over patients
##D ## also add data points and a rug representation of predictor values
##D plot(marginal_effects(fit, effects = "log_Base4_c:Trt", 
##D                       conditions = conditions, re_formula = NULL), 
##D      points = TRUE, rug = TRUE)
##D  
##D ## change handling of two-way interactions
##D int_conditions <- list(
##D   log_Base4_c = setNames(c(-2, 1, 0), c("b", "c", "a"))
##D )
##D marginal_effects(fit, effects = "Trt:log_Base4_c",
##D                  int_conditions = int_conditions)
##D marginal_effects(fit, effects = "Trt:log_Base4_c",
##D                  int_conditions = list(log_Base4_c = quantile))        
##D      
##D ## fit a model to illustrate how to plot 3-way interactions
##D fit3way <- brm(count ~ log_Age_c * log_Base4_c * Trt, data = epilepsy)
##D conditions <- make_conditions(fit3way, "log_Age_c")
##D marginal_effects(
##D   fit3way, "log_Base4_c:Trt", conditions = conditions
##D )
##D ## only include points close to the specified values of log_Age_c
##D me <- marginal_effects(
##D  fit3way, "log_Base4_c:Trt", conditions = conditions, 
##D  select_points = 0.1
##D )
##D plot(me, points = TRUE)
## End(Not run)





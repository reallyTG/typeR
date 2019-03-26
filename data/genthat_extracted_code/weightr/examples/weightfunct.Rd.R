library(weightr)


### Name: weightfunct
### Title: Estimate the Vevea and Hedges (1995) Weight-Function Model
### Aliases: weightfunct
### Keywords: weightr

### ** Examples

## Not run: 
##D # Uses the default p-value cutpoints of 0.05 and 1:
##D 
##D weightfunct(effect, v)
##D 
##D # Estimating a fixed-effects model, again with the default cutpoints:
##D 
##D weightfunct(effect, v, fe=TRUE)
##D 
##D # Specifying cutpoints:
##D 
##D weightfunct(effect, v, steps=c(0.01, 0.025, 0.05, 0.10, 0.20, 0.30, 0.50, 1.00))
##D 
##D # Including a linear model, where moderators are denoted as 'mod1' and mod2':
##D 
##D weightfunct(effect, v, mods=~mod1+mod2)
##D 
##D # Specifying cutpoints and weights to estimate Vevea and Woods (2005):
##D 
##D weightfunct(effect, v, steps=c(0.01, 0.05, 0.50, 1.00), weights=c(1, .9, .7, .5))
##D 
##D # Specifying cutpoints and weights while including a linear model:
##D 
##D weightfunct(effect, v, mods=~mod1+mod2, steps=c(0.05, 0.10, 0.50, 1.00), weights=c(1, .9, .8, .5))
## End(Not run)




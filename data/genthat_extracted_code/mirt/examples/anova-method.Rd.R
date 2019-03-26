library(mirt)


### Name: anova-method
### Title: Compare nested models with likelihood-based statistics
### Aliases: anova-method anova,SingleGroupClass-method
###   anova,MultipleGroupClass-method anova,MixedClass-method
###   anova,DiscreteClass-method anova,MixtureClass-method

### ** Examples


## Not run: 
##D x <- mirt(Science, 1)
##D x2 <- mirt(Science, 2)
##D anova(x, x2)
##D 
##D # in isolation
##D anova(x)
##D 
##D # bounded parameter
##D dat <- expand.table(LSAT7)
##D mod <- mirt(dat, 1)
##D mod2 <- mirt(dat, 1, itemtype = c(rep('2PL', 4), '3PL'))
##D anova(mod, mod2) #unbounded test
##D anova(mod, mod2, bounded = TRUE) #bounded
##D 
##D # priors
##D model <- 'F = 1-5
##D           PRIOR = (5, g, norm, -1, 1)'
##D mod1b <- mirt(dat, model, itemtype = c(rep('2PL', 4), '3PL'))
##D anova(mod1b)
##D 
##D model2 <- 'F = 1-5
##D           PRIOR = (1-5, g, norm, -1, 1)'
##D mod2b <- mirt(dat, model2, itemtype = '3PL')
##D anova(mod1b, mod2b)
##D 
## End(Not run)




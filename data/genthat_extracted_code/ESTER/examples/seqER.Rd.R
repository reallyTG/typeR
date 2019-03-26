library(ESTER)


### Name: seqER
### Title: Computes sequential evidence ratios
### Aliases: seqER

### ** Examples

## Not run: 
##D data(mtcars)
##D mod1 <- lm(mpg ~ cyl, mtcars)
##D mod2 <- lm(mpg ~ cyl + disp, mtcars)
##D seqER(ic = bic, mod1, mod2, nmin = 10)
##D 
##D # Example with ten permutation samples
##D data(mtcars)
##D mod1 <- lm(mpg ~ cyl, mtcars)
##D mod2 <- lm(mpg ~ cyl + disp, mtcars)
##D seqER(ic = bic, mod1, mod2, nmin = 10, nsims = 10)
##D 
##D # Example with blinding
##D data(mtcars)
##D mod1 <- lm(mpg ~ cyl, mtcars)
##D mod2 <- lm(mpg ~ cyl + disp, mtcars)
##D seqER(ic = bic, mod1, mod2, nmin = 10, boundary = 10, blind = TRUE)
##D 
##D # Example with repeated measures
##D library(lme4)
##D data(sleepstudy)
##D mod1 <- lmer(Reaction ~ Days + (1|Subject), sleepstudy)
##D mod2 <- lmer(Reaction ~ Days + I(Days^2) + (1|Subject), sleepstudy)
##D seqER(ic = bic, mod1, mod2, nmin = 10, id = "Subject", nsims = 10)
##D 
##D # Example with brmsfit models
##D library(brms)
##D mod1 <- brm(Reaction ~ Days + (1|Subject), sleepstudy)
##D mod2 <- brm(Reaction ~ Days + I(Days^2) + (1|Subject), sleepstudy)
##D seqER(ic = WAIC, mod1, mod2, nmin = 10, id = "Subject", nsims = 10)
## End(Not run)





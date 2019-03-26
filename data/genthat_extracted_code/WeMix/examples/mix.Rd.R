library(WeMix)


### Name: mix
### Title: Survey Weighted Mixed-Effects Models
### Aliases: mix

### ** Examples

## Not run: 
##D library(WeMix)
##D library(lme4)
##D 
##D data(sleepstudy)
##D ss1 <- sleepstudy
##D doubles <- c(308, 309, 310) # subject with double obs
##D # Create weights
##D ss1$W1 <- ifelse(ss1$Subject %in% doubles, 2, 1)
##D ss1$W2 <- 1
##D 
##D # Run random-intercept 2-level model 
##D mix1 <- mix(Reaction~ Days + (1|Subject),data=ss1, weights = c("W1","W2"),
##D             fast=TRUE, nQuad=13, verbose=FALSE)
##D 
##D # Run random-intercept 2-level model with group-mean centering
##D grp_centered <- mix(Reaction ~ Days + (1|Subject), data=ss1, weights = c("W1","W2"), nQuad=13,
##D           fast=TRUE, center_group = list("Subject" = ~Days),
##D           verbose=FALSE)
## End(Not run)




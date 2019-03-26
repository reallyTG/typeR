library(emmeans)


### Name: emm_options
### Title: Set or change emmeans options
### Aliases: emm_options get_emm_option emm_defaults
### Keywords: datasets

### ** Examples

## Not run: 
##D emm_options(ref_grid = list(level = .90),
##D             contrast = list(infer = c(TRUE,FALSE)),
##D             estble.tol = 1e-6)
##D # Sets default confidence level to .90 for objects created by ref.grid
##D # AS WELL AS emmeans called with a model object (since it creates a 
##D # reference grid). In addition, when we call 'contrast', 'pairs', etc.,
##D # confidence intervals rather than tests are displayed by default.
## End(Not run)

## Not run: 
##D emm_options(disable.pbkrtest = TRUE)
##D # This forces use of asymptotic methods for lmerMod objects.
##D # Set to FALSE or NULL to re-enable using pbkrtest.
## End(Not run)

# See tolerance being used for determining estimability
get_emm_option("estble.tol")





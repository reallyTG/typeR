library(pkgmaker)


### Name: postponeAction
### Title: Postponing Actions
### Aliases: postponeAction runPostponedAction

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)

opt <- options(verbose=2)

# define actions
postponeAction(function(){print(10)}, "print")
postponeAction(function(){print(1:10)}, "more")
postponeAction()
# execute actions
runPostponedAction()
runPostponedAction()

# restore options
options(opt)





library(RandomFields)


### Name: BrownResnick
### Title: Brown-Resnick process
### Aliases: RPbrownresnick Brown-Resnick 'Brown-Resnick process'
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## Don't show: ## Not run: 
##D model <- ~ RPbrownresnick(RMfbm(alpha=A), xi=0)
##D x <- seq(0, 10, 0.2)
##D z <- RFsimulate(model=model, x, x, n=4, A=0.9) # about 1 min on a fast machine
##D plot(z)
##D 
##D z <- RFsimulate(model, x=x, n=4, A=1.9)
##D plot(z)
##D 
##D 
##D ## basic model in Buishand, de Haan, Zhou (2008)
##D model <- RMfbm(proj=1, alpha=1, var=0.5) + RMfbm(proj=2, alpha=1, var=0.5) 
##D x <- seq(0, 5, 0.05)
##D z <- RFsimulate(RPbrownresnick(model, xi=0), x, x, every=1000)
##D plot(z)
##D 
##D 
## End(Not run)## End(Don't show)
## for some more sophisticated models see 'maxstableAdvanced'

## Don't show: 
FinalizeExample()
## End(Don't show)



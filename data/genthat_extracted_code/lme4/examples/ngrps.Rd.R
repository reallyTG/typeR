library(lme4)


### Name: ngrps
### Title: Number of Levels of a Factor or a "merMod" Model
### Aliases: ngrps

### ** Examples

ngrps(factor(seq(1,10,2)))
ngrps(lmer(Reaction ~ 1|Subject, sleepstudy))

## A named vector if there's more than one grouping factor :
ngrps(lmer(strength ~ (1|batch/cask), Pastes))
## cask:batch      batch
##         30         10

methods(ngrps) # -> "factor" and "merMod"




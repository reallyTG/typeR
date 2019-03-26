library(vegan)


### Name: ordistep
### Title: Choose a Model by Permutation Tests in Constrained Ordination
### Aliases: ordistep ordiR2step
### Keywords: multivariate models

### ** Examples

## See add1.cca for another example

### Dune data
data(dune)
data(dune.env)
mod0 <- rda(dune ~ 1, dune.env)  # Model with intercept only
mod1 <- rda(dune ~ ., dune.env)  # Model with all explanatory variables

## With scope present, the default direction is "both"
mod <- ordistep(mod0, scope = formula(mod1))
mod
## summary table of steps
mod$anova

## Example of ordistep, forward
ordistep(mod0, scope = formula(mod1), direction="forward")

## Example of ordiR2step (always forward)
## stops because R2 of 'mod1' exceeded
ordiR2step(mod0, mod1)




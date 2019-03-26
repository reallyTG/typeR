library(qtlDesign)


### Name: Variance and effect size
### Title: Effect size, proportion variance explained, and error variance
###   calculations
### Aliases: error.var gmeans2effect prop.var
### Keywords: design

### ** Examples

error.var(cross="bc",env.var=1,gen.var=1,bio.reps=1)
error.var(cross="f2",env.var=1,gen.var=1,bio.reps=1)
error.var(cross="ri",env.var=1,gen.var=1,bio.reps=1)
error.var(cross="ri",env.var=1,gen.var=1,bio.reps=10)
gmeans2effect(cross="f2",means=c(0,1,2))
gmeans2effect(cross="f2",means=c(0,1,1))
gmeans2effect(cross="bc",means=c(0,1,1))
gmeans2effect(cross="ri",means=c(0,1,1))
prop.var(cross="bc",effect=5,sigma2=1)
prop.var(cross="f2",effect=c(5,0),sigma2=1)
prop.var(cross="ri",effect=5,sigma2=1)




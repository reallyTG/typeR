library(idefix)


### Name: RespondMNL
### Title: Response generation
### Aliases: RespondMNL

### ** Examples

# design: 3 dummy coded attributes, each 3 levels. There are 8 choice sets.
des <- example_design
set.seed(123)
true_par <- rnorm(6)
RespondMNL(par=true_par, des = des, n.alts = 2)




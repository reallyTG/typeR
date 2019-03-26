library(scifigure)


### Name: sci_figure
### Title: Create a figure depicting reproducibility/replicability of a set
###   of scientific experiments
### Aliases: sci_figure

### ** Examples


# Initialize the default experiments data frame
exps <- init_experiments()
sci_figure(exps)
sci_figure(exps, hide_stages = c("population", "analyst"))

# Do some manual manipulation to the experiments

exps["analyst", "Exp2"] <- "different"
exps["code", c("Exp2", "Exp3")] <- "unobserved"
sci_figure(exps)





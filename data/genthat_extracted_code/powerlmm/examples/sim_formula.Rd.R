library(powerlmm)


### Name: sim_formula
### Title: Create a simulation formula
### Aliases: sim_formula

### ** Examples

# 2-lvl model
f <- sim_formula("y ~ treatment * time + (1 + time | subject)")

# ANCOVA using 'data_transform'
f <- sim_formula("y ~ treatment + pretest",
                 data_transform = transform_to_posttest,
                 test = "treatment")





library(powerlmm)


### Name: sim_formula_compare
### Title: Compare multiple simulation formulas
### Aliases: sim_formula_compare

### ** Examples


# Formulas can be a named character
# uses the defaults 'sim_formula()'
f <- sim_formula_compare("m0" = "y ~ time * treatment + (1 | subject)",
                         "m1" = "y ~ time * treatment + (1 + time | subject)")

# Can also use sim_formula()
f0 <- sim_formula("y ~ time * treatment + (1 | subject)")
f1 <- sim_formula("y ~ time * treatment + (1 + time | subject)")
f <- sim_formula_compare("m0" = f0, "m1" = f1)





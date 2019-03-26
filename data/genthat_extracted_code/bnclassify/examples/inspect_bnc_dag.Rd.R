library(bnclassify)


### Name: inspect_bnc_dag
### Title: Inspect a Bayesian network classifier structure.
### Aliases: inspect_bnc_dag class_var features vars families modelstring
###   feature_families narcs is_semi_naive is_anb is_nb is_ode

### ** Examples

data(car)
nb <- bnc('nb', 'class', car, smooth = 1)
narcs(nb)
is_ode(nb)




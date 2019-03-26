library(LEGIT)


### Name: example_with_crossover
### Title: Simulated example of a 2 way interaction GxE model with
###   crossover point.
### Aliases: example_with_crossover

### ** Examples

## Examples
# Diathesis Stress WEAK
ex_dia = example_with_crossover(250, c=10, coef_main = c(3,1,2), sigma=1)
# Diathesis Stress STRONG
ex_dia_s = example_with_crossover(250, c=10, coef_main = c(3,0,2), sigma=1)
# Differential Susceptibility WEAK
ex_ds = example_with_crossover(250, c=5, coef_main = c(3+5,1,2), sigma=1)
# Differential Susceptibility STRONG
ex_ds_s = example_with_crossover(250, c=5, coef_main = c(3+5,0,2), sigma=1)




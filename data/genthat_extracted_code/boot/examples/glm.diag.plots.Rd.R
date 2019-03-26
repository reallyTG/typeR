library(boot)


### Name: glm.diag.plots
### Title: Diagnostics plots for generalized linear models
### Aliases: glm.diag.plots
### Keywords: regression dplot hplot

### ** Examples

# In this example we look at the leukaemia data which was looked at in 
# Example 7.1 of Davison and Hinkley (1997)
data(leuk, package = "MASS")
leuk.mod <- glm(time ~ ag-1+log10(wbc), family = Gamma(log), data = leuk)
leuk.diag <- glm.diag(leuk.mod)
glm.diag.plots(leuk.mod, leuk.diag)




library(fergm)


### Name: coef_plot
### Title: Plots the coefficients of FERGM and ERGM objects.
### Aliases: coef_plot
### Keywords: FERGM interpret summary

### ** Examples

# load example data
data("ergm.fit")
data("fergm.fit")
data("mesa")
# Compare substantive implications via coef plot, these are with 95% credible intervals
coef_plot(fergm.fit = fergm.fit, ergm.fit = ergm.fit,
custom_var_names =  c("Edges", "Sex Homophily", "Grade Homophily",
"Race Homophily", "GWESP", "Alternating K-Stars"))
coef_plot(fergm.fit = fergm.fit,
custom_var_names =  c("Edges", "Sex Homophily", "Grade Homophily",
"Race Homophily", "GWESP", "Alternating K-Stars"))




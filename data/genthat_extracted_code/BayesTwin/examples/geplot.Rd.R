library(BayesTwin)


### Name: geplot
### Title: Plots 95% credibility interval of GxE interaction
### Aliases: geplot GEplot ge_plot
### Keywords: utilities

### ** Examples

#Using the output to plot the 95% credibility region 
data(results)
geplot(results$var_a, results$samples_beta0, results$samples_beta1)




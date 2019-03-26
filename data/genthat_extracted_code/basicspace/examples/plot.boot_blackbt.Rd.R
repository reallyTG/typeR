library(basicspace)


### Name: plot.boot_blackbt
### Title: Bootstrapped Blackbox Transpose Stimulus Plots
### Aliases: plot.boot_blackbt
### Keywords: multivariate

### ** Examples



data(LC1980)
data=LC1980[,-1]

# Not run to save time, but loaded object is the output
# bootbbt <- boot_blackbt(data, missing=c(0,8,9), dims=1, minscale=8, iter=10)
data("bootbbt")

plot.boot_blackbt(bootbbt)





library(lmvar)


### Name: plot.lmvar
### Title: Plot diagnostics for an 'lmvar' object
### Aliases: plot.lmvar

### ** Examples

if (interactive()){

# As example we use the dataset 'cats' from the library 'MASS'.
library(MASS)

# We regress the cats heart weight 'Hwt' onto its body weight 'Bwt'
X = model.matrix(~ Bwt - 1, cats)
fit = lmvar(cats$Hwt, X_mu = X, X_sigma = X)

# Display all plots
plot(fit)

# Display two plots that focus on the shape of the distribution
plot(fit, which = c(2, 3))

# Suppress plot number and name of the 'lmvar' object being plot in  plot 3
plot(fit, which = 3, show = FALSE)

# Label the 5 observations with the most extreme residuals in plot 1
plot(fit, which = 1, id.n = 5)

}




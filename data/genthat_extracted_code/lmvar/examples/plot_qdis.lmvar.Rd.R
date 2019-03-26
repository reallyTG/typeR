library(lmvar)


### Name: plot_qdis.lmvar
### Title: Plot of the distribution of quantiles for an object of class
###   'lmvar'
### Aliases: plot_qdis.lmvar

### ** Examples

if (interactive()){

library(lmvar)

# create a 'lmvar' model using the 'iris' data set
X = model.matrix(~ Species - 1, data = iris)
fit_lmvar = lmvar(iris$Petal.Length, X, X)

plot_qdis(fit_lmvar)

# compare 'lmvar' model with linear model
fit_lm = lm( Petal.Length ~ Species, data = iris, y = TRUE)

plot_qdis(fit_lmvar, fit_lm)

# check whether inclustion of petal in model improves distribution of quantiles
X = model.matrix(~ Species + Petal.Width - 1, data = iris)
fit_lmvar_width = lmvar(iris$Petal.Length, X, X)

plot_qdis(fit_lmvar, fit_lmvar_width)

}




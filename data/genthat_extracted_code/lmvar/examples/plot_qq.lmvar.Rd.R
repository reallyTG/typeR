library(lmvar)


### Name: plot_qq.lmvar
### Title: QQ-plot for an object of class 'lmvar'
### Aliases: plot_qq.lmvar

### ** Examples

if (interactive()){

library(lmvar)

# create a 'lmvar' model using the 'iris' data set
X = model.matrix(~ Species - 1, data = iris)
fit_lmvar = lmvar(iris$Petal.Length, X, X)

plot_qq(fit_lmvar)

# compare the 'lmvar' model with a lineair model
fit_lm = lm( Petal.Length ~ Species, data = iris, y = TRUE)

plot_qq(fit_lmvar, fit_lm)

# check whether inclustion of petal in model improves QQ-plot
X = model.matrix(~ Species + Petal.Width - 1, data = iris)
fit_lmvar_width = lmvar(iris$Petal.Length, X, X)

plot_qq(fit_lmvar, fit_lmvar_width)

}




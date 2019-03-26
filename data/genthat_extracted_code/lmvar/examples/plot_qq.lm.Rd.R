library(lmvar)


### Name: plot_qq.lm
### Title: QQ-plot for an object of class 'lm'
### Aliases: plot_qq.lm

### ** Examples

if (interactive()){

library(lmvar)

# create a linear model using the 'iris' data set
fit_lm = lm( Petal.Length ~ Species, data = iris, y = TRUE)

plot_qq(fit_lm)

# compare 'lm' with 'lmvar' fit
X = model.matrix(~ Species - 1, data = iris)
fit_lmvar = lmvar(iris$Petal.Length, X, X)

plot_qq(fit_lm, fit_lmvar)

# check whether inclustion of petal in model improves QQ-plot
fit_lm_width = lm( Petal.Length ~ Species + Petal.Width, data = iris, y = TRUE)

plot_qq(fit_lm, fit_lm_width)

}




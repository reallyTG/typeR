library(lmvar)


### Name: plot_qdis.lm
### Title: Plot of the distribution of quantiles for an object of class
###   'lm'
### Aliases: plot_qdis.lm

### ** Examples

if(interactive()){

library(lmvar)

# create a linear model using the 'iris' data set
fit_lm = lm(Petal.Length ~ Species, data = iris, y = TRUE)

plot_qdis(fit_lm)

# compare 'lm' with 'lmvar' fit
X = model.matrix(~ Species - 1, data = iris)
fit_lmvar = lmvar(iris$Petal.Length, X, X)

plot_qdis(fit_lm, fit_lmvar)

# check whether inclustion of petal in model improves distribution of quantiles
fit_lm_width = lm(Petal.Length ~ Species + Petal.Width, data = iris, y = TRUE)

plot_qdis(fit_lm, fit_lm_width)

}




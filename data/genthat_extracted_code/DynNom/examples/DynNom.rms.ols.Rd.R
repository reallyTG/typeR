library(DynNom)


### Name: DynNom.ols
### Title: Dynamic Nomograms for Linear Models from the 'rms' package
### Aliases: DynNom.ols
### Keywords: dynamic nomograms linear models individual prediction shiny

### ** Examples

## Not run: 
##D # example 1
##D x1 <- runif(200)
##D x2 <- runif(200)
##D x3 <- runif(200)
##D x4 <- runif(200)
##D y <- x1 + x2 + rnorm(200)
##D data = data.frame(x1, x2, x3, x4, y)
##D f    <- ols(y ~ rcs(x1, 4) + x2 + x3 + x4)
##D DynNom.ols(f, data)
##D 
##D # example 2
##D data1 = as.data.frame(Titanic)
##D year <- sample(c(1:5), 32, replace = TRUE)
##D data <- data.frame(year, data1)
##D model <- ols(year ~ Age + Class + Sex, data = data, weights = Freq)
##D DynNom.ols(model, data)
## End(Not run)

if (interactive()) {
data1 <- data.frame(state.x77)
fit1 <- ols(Life.Exp ~ Population + Income + Murder + Frost , data = data1)
DynNom(fit1, data1)
}




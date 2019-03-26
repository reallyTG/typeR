library(simputation)


### Name: impute_proxy
### Title: Impute by variable derivation
### Aliases: impute_proxy impute_const

### ** Examples

irisNA <- iris
irisNA[1:3,1] <- irisNA[3:7,2] <- NA

# impute a constant 

a <- impute_const(irisNA, Sepal.Width ~ 7)
head(a)

a <- impute_proxy(irisNA, Sepal.Width ~ 7)
head(a)

# copy a value from another variable (where available)
a <- impute_proxy(irisNA, Sepal.Width ~ Sepal.Length)
head(a)

# group mean imputation
a <- impute_proxy(irisNA
  , Sepal.Length ~ mean(Sepal.Length,na.rm=TRUE) | Species)
head(a)

# random hot deck imputation
a <- impute_proxy(irisNA, Sepal.Length ~ mean(Sepal.Length, na.rm=TRUE)
, add_residual = "observed")

# ratio imputation (but use impute_lm for that)
a <- impute_proxy(irisNA, 
  Sepal.Length ~ mean(Sepal.Length,na.rm=TRUE)/mean(Sepal.Width,na.rm=TRUE) * Sepal.Width)





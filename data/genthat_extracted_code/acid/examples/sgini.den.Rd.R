library(acid)


### Name: sgini.den
### Title: Single-parameter Gini Coefficient for an Income Distribution
### Aliases: sgini.den

### ** Examples

## without point mass
set.seed(123)
x <- rnorm(1000,10,1)
incs <- seq(1,20,length.out=1000)
dens <- dnorm(incs,10,1)
lower=NULL;upper=NULL;pm0<-NA
gini(x)$Gini
sgini(x,nu=2)$Gini
sgini.den(incs,dens)$Gini


## with point mass
set.seed(123)
x <- c(rep(0,1000),rnorm(1000,10,1))
incs <- c(0,seq(1,20,length.out=1000))
dens <- c(0.5,dnorm(incs[-1],10,1)/2)
gini(x)$Gini
sgini(x,nu=2)$Gini
sgini.den(incs,dens,pm = 0.5)$Gini
 



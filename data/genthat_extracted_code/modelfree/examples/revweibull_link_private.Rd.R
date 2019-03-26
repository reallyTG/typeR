library(modelfree)


### Name: revweibull_link_private
### Title: Reverse Weibull link function with guessing and lapsing rates
### Aliases: revweibull_link_private
### Keywords: nonparametric models regression nonlinear

### ** Examples

data( "01_Miranda" )
x <- example01$x
r <- example01$r
m <- example01$m
glmdata <- data.frame( cbind( r/m ,m , x ) )
names( glmdata ) <- c( "resp", "m", "x" )
glmformula <- c( "resp ~ x" )
userlink<-revweibull_link_private( 20, 0, 0 )
fit <- glm( glmformula, data = glmdata, weights = m, family = binomial( userlink ) )




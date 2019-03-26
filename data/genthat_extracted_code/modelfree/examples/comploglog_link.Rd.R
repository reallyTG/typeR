library(modelfree)


### Name: comploglog_link
### Title: Complementary log-log link function with guessing and lapsing
###   rates
### Aliases: comploglog_link
### Keywords: nonparametric models regression nonlinear

### ** Examples

data( "01_Miranda" )
x <- example01$x
r <- example01$r
m <- example01$m
glmdata <- data.frame( cbind( r/m ,m , x ) )
names( glmdata ) <- c( "resp", "m", "x" )
glmformula <- c( "resp ~ x" )
userlink<-comploglog_link( 0.1, 0.1 )
fit <- glm( glmformula, data = glmdata, weights = m, family = binomial( userlink ) )




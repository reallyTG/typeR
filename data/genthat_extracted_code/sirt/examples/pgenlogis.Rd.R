library(sirt)


### Name: pgenlogis
### Title: Calculation of Probabilities and Moments for the Generalized
###   Logistic Item Response Model
### Aliases: pgenlogis genlogis.moments
### Keywords: Generalized logistic item response model

### ** Examples

pgenlogis( x=c(-.3, 0, .25, 1 ), alpha1=0, alpha2=.6 )
  ##   [1] 0.4185580 0.5000000 0.5621765 0.7310586

####################################################################
# compare link functions
x <- seq( -3,3, .1 )

#***
# logistic link
y <- sirt::pgenlogis( x, alpha1=0, alpha2=0 )
plot( x, stats::plogis(x), type="l", main="Logistic Link", lwd=2)
points( x, y, pch=1, col=2 )

#***
# probit link
round( sirt::genlogis.moments( alpha1=.165, alpha2=.165 ), 3 )
  ##       M    SD   Var
  ##   0.000 1.472 2.167
# SD of generalized logistic link function is 1.472
y <- sirt::pgenlogis( x * 1.47, alpha1=.165, alpha2=.165 )
plot( x, stats::pnorm(x), type="l", main="Probit Link", lwd=2)
points( x, y, pch=1, col=2 )

#***
# loglog link
y <- sirt::pgenlogis( -.39 + 1.20*x -.007*x^2, alpha1=-.037, alpha2=.62 )
plot( x, exp( - exp( -x ) ), type="l", main="Loglog Link", lwd=2,
    ylab="loglog(x)=exp(-exp(-x))" )
points( x, y, pch=17, col=2 )

#***
# cloglog link
y <- sirt::pgenlogis( .54+1.64*x +.28*x^2 + .046*x^3, alpha1=.062, alpha2=-.037 )
plot( x, 1-exp( - exp(x) ), type="l", main="Cloglog Link", lwd=2,
    ylab="loglog(x)=1-exp(-exp(x))" )
points( x, y, pch=17, col=2 )




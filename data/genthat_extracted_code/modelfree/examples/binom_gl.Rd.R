library(modelfree)


### Name: binom_gl
### Title: Psychometric function with guessing and lapsing rates
### Aliases: binom_gl
### Keywords: nonparametric models regression nonlinear

### ** Examples

data( "01_Miranda" );
value <-binom_gl( example01$r, example01$m, example01$x, "logit", 1, 2, c( 0.01, 0.01 ) );




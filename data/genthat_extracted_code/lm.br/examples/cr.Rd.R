library(lm.br)


### Name: cr
### Title: Confidence Region for the Changepoint
### Aliases: cr,Cpp_Clmbr-method cr

### ** Examples

#  A quick example
y <- c( 2, 0, 2.001, 4, 6 )
x <- 1:5
t <- lm.br( y ~ x )
t $ cr()
t$cr( .9, 'af', incr = 0.1, out='t' )




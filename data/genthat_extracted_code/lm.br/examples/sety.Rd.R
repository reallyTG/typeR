library(lm.br)


### Name: sety
### Title: Set y-Values
### Aliases: sety,Cpp_Clmbr-method sety

### ** Examples

#  A simulation test
x <- c( 1.0, 1.1, 1.3, 1.7, 2.4, 3.9, 5.7, 7.6, 8.4, 8.6 )
y <- x
LLmodel <- lm.br( y ~ x )    
countCLR <- countAF <- 0
theta <- 3
## No test: 
for( i in 1:10000 )  {
  y <- 0 + (-1.)*pmin(x-theta,0) + (0.5)*pmax(x-theta,0) + rnorm(10)
  LLmodel$sety( y )
  stest <- LLmodel$sl( theta, 'clr', .0001, "V" )
  if( stest > 0.05 )  countCLR <- countCLR + 1
  stest <- LLmodel$sl( theta, 'af', .0001, "V" )
  if( stest > 0.05 )  countAF <- countAF + 1
  if( floor(i/1000) - i/1000 == 0 ) cat(i, countCLR/i, countAF/i, "\n")
}
## End(No test)




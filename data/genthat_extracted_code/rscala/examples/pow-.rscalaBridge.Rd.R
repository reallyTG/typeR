library(rscala)


### Name: ^.rscalaBridge
### Title: Evaluation Operator Returning a Reference and Transcompile
###   Operator
### Aliases: ^.rscalaBridge

### ** Examples

## No test: 
s <- scala()
x <- s ^ 'new scala.util.Random()'  # These two lines ...
x <- s $ .new_scala.util.Random()   # ... are equivalent
s(rng=x) * 'rng.nextDouble()'
f <- s ^ function(x=scalaType('Double')) { pi - x }
f$apply(3.14)
s(n=10L, mapper=s ^ function(x=scalaType("Int")) { 2 * x }) * "Array.tabulate(n)(mapper)"
logStdNormalDensity <- s ^ function(x=scalaType("Double"), mean=0.0, sd=1.0) {
  variance <- sd^2
  -0.5*log(2*pi*variance) - 0.5/variance * (x-mean)^2
}
identical(logStdNormalDensity$apply(1.0), dnorm(1.0, log=TRUE))
close(s)
## End(No test)





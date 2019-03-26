library(rscala)


### Name: scala
### Title: Instantiate a Scala Bridge
### Aliases: scala rscala-package

### ** Examples

## No test: 
s <- scala()
rng <- s $ .new_scala.util.Random()
rng $ alphanumeric() $ take(15L) $ mkString(',')
s * '2+3'
h <- s(x=2, y=3) ^ 'x+y'
h $ toString()
s(mean=h, sd=2, r=rng) * 'mean + sd * r.nextGaussian()'
close(s)
## End(No test)





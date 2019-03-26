library(rscala)


### Name: *.rscalaBridge
### Title: Evaluation Operator
### Aliases: *.rscalaBridge

### ** Examples

## No test: 
s <- scala()
s * 'scala.util.Random.nextDouble() <= 0.75'
s(mean=10, sd=2.5) * 'mean + sd * scala.util.Random.nextGaussian()'
close(s)
## End(No test)





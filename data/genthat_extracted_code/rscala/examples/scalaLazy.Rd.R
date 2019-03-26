library(rscala)


### Name: scalaLazy
### Title: Lazily Execute Functions on a Scala Bridge
### Aliases: scalaLazy

### ** Examples

## No test: 

s <- scala()
scalaLazy(function(s) { s + 'import scala.util.Random' })
s$.new_Random()$nextDouble()
close(s)
## End(No test)




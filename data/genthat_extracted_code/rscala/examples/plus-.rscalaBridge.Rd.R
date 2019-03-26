library(rscala)


### Name: +.rscalaBridge
### Title: Declaration Operator
### Aliases: +.rscalaBridge

### ** Examples

## No test: 
s <- scala()
s + '
  import scala.util.Random.nextInt
  import scala.math.{Pi, log, exp, sqrt}
  val const = -log(sqrt(2*Pi))
  def dnorm(x: Double, mean: Double, sd: Double, logScale: Boolean) = {
    val z = ( x - mean ) / sd
    val result = const - log(sd) - z * z / 2
    if ( logScale ) result else exp(result)
  }
'
s $ const()
s $ nextInt(100L)
s $ dnorm(8, 10, 2, FALSE)
close(s)
## End(No test)





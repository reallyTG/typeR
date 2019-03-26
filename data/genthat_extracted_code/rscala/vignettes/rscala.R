### R code from vignette source 'rscala.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: Setup document
###################################################
options(prompt = "R> ", continue = "+  ", width = 70, useFancyQuotes = FALSE)
a <- toString(packageVersion("rscala"))
cells <- strsplit(a,"\\.")[[1]]
versionString <- paste0(cells[1:3],collapse=".")
if ( length(cells) > 3 ) versionString <- paste0(versionString,"-SNAPSHOT")


###################################################
### code chunk number 2: Install package (eval = FALSE)
###################################################
## install.packages("rscala")


###################################################
### code chunk number 3: Show supported Scala versions
###################################################
names(rscala::scalaVersionJARs())


###################################################
### code chunk number 4: Configure and (if necessary) install Java & Scala (eval = FALSE)
###################################################
## rscala::scalaConfig()


###################################################
### code chunk number 5: Load library
###################################################
library("rscala")


###################################################
### code chunk number 6: Instantiate a bridge as a user would (eval = FALSE)
###################################################
## s <- scala()


###################################################
### code chunk number 7: Instantiate a bridge for this document
###################################################
set.seed(234L)
s <- scala(serialize.output = TRUE)
s + 'scala.util.Random.setSeed(3242)'


###################################################
### code chunk number 8: Define a function using the '+' operator
###################################################
s + '
  def binomialCoefficient(n: Int, k: Int) = {
    ( 1 to k ).map( i => ( n - i + 1 ) / i.toDouble ).product.toInt
  }
'


###################################################
### code chunk number 9: Access a user defined function
###################################################
s + 'println("10 choose 3 is " + binomialCoefficient(10, 3) + ".")'


###################################################
### code chunk number 10: Use the '*' operator
###################################################
choose(10, 3) == s * 'binomialCoefficient(10, 3)'


###################################################
### code chunk number 11: Show equivalent matrices in R and Scala
###################################################
fromScala <- s * 'Array(Array(1, 2, 3), Array(4, 5, 6))'
fromR     <- matrix(1:6, nrow = 2, byrow = TRUE)
identical(fromScala, fromR)


###################################################
### code chunk number 12: Pass data to Scala
###################################################
s(name = "Hannah") * 'name.toUpperCase == name.toUpperCase.reverse'


###################################################
### code chunk number 13: Pass data to Scala with multiple named and unnamed arguments
###################################################
names <- c("Hannah", "David", "Reinier")
s(names, convertToUpperCase = TRUE) * '
  val x = if ( convertToUpperCase ) names.map(_.toUpperCase) else names
  x.map { y => y == y.reverse }
'


###################################################
### code chunk number 14: Use I() to pass a length-one vector to Scala as an array
###################################################
x <- letters[sample(length(letters), rbinom(1, size = 2, prob = 0.5))]
s(x = I(x)) * 'x.map(_.toUpperCase).mkString'


###################################################
### code chunk number 15: Return a reference if the result is not a copyable type
###################################################
rng <- s * 'new scala.util.Random()'
rng

oneToTenReference <- s ^ 'Array.range(1, 11)'
oneToTenReference


###################################################
### code chunk number 16: Pass a reference to a bridge
###################################################
s(rng, len = 15L) * 'rng.alphanumeric.take(len).mkString'


###################################################
### code chunk number 17: Call a methods of a reference
###################################################
rng$setSeed(24234L)
rng$nextInt(10L)
oneToTenReference$sum()


###################################################
### code chunk number 18: Guarantee a reference is returned when calling a method
###################################################
rng$.nextInt(10L)


###################################################
### code chunk number 19: Assess an instance variable as if it were a method
###################################################
rng$self()


###################################################
### code chunk number 20: Show how to instantiate an object or obtain a null reference
###################################################
seed <- 123L
rng <- s$.new_java.util.Random(seed)
map <- s$".new_scala.collection.mutable.HashMap[String, Double]"()
nullString <- s$.null_String()


###################################################
### code chunk number 21: Show more uses of the '$' operator and quote if needed
###################################################
myList <- s$List(1L, 2L, 3L)
augmentedList <- myList$':+'(100L)
paste0(augmentedList$toString(), " now contains 100.")


###################################################
### code chunk number 22: Show even more uses of the '$' operator
###################################################
s$binomialCoefficient(10L, 3L) == choose(10, 3)
oneToTenReference <- s$.Array.range(1L, 11L)
myScalaList <- s$List(1, 2, 3, 4)
s$scala.util.Properties.versionNumberString()


###################################################
### code chunk number 23: Show how to chain method calls
###################################################
s$java.util.TimeZone.getDefault()$getDisplayName()


###################################################
### code chunk number 24: Show how to call back from Scala using the embedded R object
###################################################
s * '
  R.eval("primes <- %-", Array(2, 3, 5, 7, 11, 13, 17, 19, 23, 29))
  val rFunction = R.evalObject("function(x) x * primes")
  val primesTimesTwo = R.evalI1("%-(2)", rFunction)
  R.evalI2("matrix(%-, nrow = %-)", primesTimesTwo, 2)
'
exists("primes")


###################################################
### code chunk number 25: Define a function to compute expected number of clusters
###################################################
f <- function(n, alpha) sapply(alpha, function(a) sum(a / (1:n + a - 1)))
f(100, 1.0)


###################################################
### code chunk number 26: Demonstrate Scala calling a user-defined R function
###################################################
bisection <- function(func, lower = 1.0, upper = 1.0, epsilon = 0.0000001) {
  s(lower, upper, epsilon) * '
    def g(x: Double) = R.evalD0("func(%-)", x)
    val (fLower, fUpper) = (g(lower), g(upper))
    if ( fLower * fUpper > 0 ) sys.error("Root is not straddled.")
    type D = Double
    @scala.annotation.tailrec
    def engine(l: D, u: D, fLower: D, fUpper: D): Double = {
      if ( math.abs( l - u ) <= epsilon ) ( l + u ) / 2
      else {
        val c = ( l + u ) / 2
        val fCenter = g(c)
        if ( fLower * fCenter < 0 ) engine(l, c, fLower, fCenter)
        else engine(c, u, fCenter, fUpper)
      }
    }
    engine(lower, upper, fLower, fUpper)
  '
}
bisection(function(a) f(1000, a) - 10, 0.1, 20)


###################################################
### code chunk number 27: Show recursion between R and Scala
###################################################
recursive.sum <- function(n) s(n) * '
  if ( n <= 0 ) 0L else n + R.evalI0("recursive.sum(%-)", n - 1)
'
recursive.sum(10)


###################################################
### code chunk number 28: Show how subsequent calls avoid compilation for the sake of speed
###################################################
rng_rscala <- s$.new_java.util.Random()
first  <- system.time( rng_rscala$nextGaussian() )['elapsed']
second <- system.time( rng_rscala$nextGaussian() )['elapsed']
c(first = first, second = second, ratio = first / second)


###################################################
### code chunk number 29: Benchmark against the rJava package (eval = FALSE)
###################################################
## library("rJava")
## rJava::.jinit()
## rng_rJava          <- .jnew("java.util.Random")
## rng_rJava_LowLevel <- function() .jcall(rng_rJava, "D", "nextGaussian")
## microbenchmark::microbenchmark(times = 1000, rng_rJava_LowLevel(),
##   rng_rscala$nextGaussian(), rng_rJava$nextGaussian())


###################################################
### code chunk number 30: Show simplest .onLoad function (eval = FALSE)
###################################################
## .onLoad <- function(libname, pkgname) {
##   assign("s", scala(), envir = parent.env(environment()))
## }


###################################################
### code chunk number 31: Show supported Scala versions again
###################################################
names(rscala::scalaVersionJARs())


###################################################
### code chunk number 32: Show .onLoad function that loads the package JAR files (eval = FALSE)
###################################################
## .onLoad <- function(libname, pkgname) {
##   assign("s", scala(pkgname), envir = parent.env(environment()))
## }


###################################################
### code chunk number 33: Show how to use the '+' operator without blocking the R prompt (eval = FALSE)
###################################################
## .onLoad <- function(libname, pkgname) {
##   s <- scala(pkgname)
##   scalaLazy(function(s) s + 'import org.ddahl.bamboo._')
##   assign("s", s, envir = parent.env(environment()))
## }


###################################################
### code chunk number 34: Close the bridge when a package is unloaded (eval = FALSE)
###################################################
## .onUnload <- function(libpath) {
##   close(s)
## }


###################################################
### code chunk number 35: Piggy-back on another package (yet still add your JAR files) (eval = FALSE)
###################################################
## .onLoad <- function(libname, pkgname) {
##   s <- sdols:::s
##   scalaJARs(pkgname, s)
##   assign("s", envir = parent.env(environment()))
## }


###################################################
### code chunk number 36: Close bridge before this document ends
###################################################
close(s)



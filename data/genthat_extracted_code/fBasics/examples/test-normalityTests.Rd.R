library(fBasics)


### Name: NormalityTests
### Title: Normality Tests
### Aliases: NormalityTests normalTest ksnormTest shapiroTest
###   jarqueberaTest dagoTest jbTest adTest cvmTest lillieTest pchiTest
###   sfTest
### Keywords: htest

### ** Examples

## Series:
   x = rnorm(100)

## ksnormTests -
   # Kolmogorov - Smirnov One-Sampel Test
   ksnormTest(x)

## shapiroTest - Shapiro-Wilk Test
   shapiroTest(x)

## jarqueberaTest -
   # Jarque - Bera Test
   # jarqueberaTest(x)
   # jbTest(x)




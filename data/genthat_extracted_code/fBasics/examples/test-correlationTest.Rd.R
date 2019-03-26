library(fBasics)


### Name: correlationTest
### Title: Correlation Tests
### Aliases: correlationTest pearsonTest kendallTest spearmanTest
### Keywords: htest

### ** Examples

## x, y -
   x = rnorm(50)
   y = rnorm(50)
  
## correlationTest - 
   correlationTest(x, y, "pearson")
   correlationTest(x, y, "kendall")
   spearmanTest(x, y)




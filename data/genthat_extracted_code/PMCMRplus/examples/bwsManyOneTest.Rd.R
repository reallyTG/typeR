library(PMCMRplus)


### Name: bwsManyOneTest
### Title: BWS Many-To-One Comparison Test
### Aliases: bwsManyOneTest bwsManyOneTest.default bwsManyOneTest.formula
### Keywords: htest nonparametric

### ** Examples

out <- bwsManyOneTest(weight ~ group, PlantGrowth, p.adjust="holm")
summary(out)

## A two-sample test
set.seed(1245)
x <- c(rnorm(20), rnorm(20,0.3))
g <- gl(2, 20)
summary(bwsManyOneTest(x ~ g, alternative = "less", p.adjust="none"))
summary(bwsManyOneTest(x ~ g, alternative = "greater", p.adjust="none"))

## Not run: 
##D ## Check with the implementation in package BWStest
##D BWStest::bws_test(x=x[g==1], y=x[g==2], alternative = "less")
##D BWStest::bws_test(x=x[g==1], y=x[g==2], alternative = "greater")
## End(Not run)




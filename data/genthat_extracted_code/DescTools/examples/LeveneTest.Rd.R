library(DescTools)


### Name: LeveneTest
### Title: Levene's Test for Homogeneity of Variance
### Aliases: LeveneTest LeveneTest.formula LeveneTest.lm LeveneTest.default
### Keywords: htest

### ** Examples

## example from ansari.test:
## Hollander & Wolfe (1973, p. 86f):
## Serum iron determination using Hyland control sera
ramsay <- c(111, 107, 100, 99, 102, 106, 109, 108, 104, 99,
            101, 96, 97, 102, 107, 113, 116, 113, 110, 98)
jung.parekh <- c(107, 108, 106, 98, 105, 103, 110, 105, 104,
            100, 96, 108, 103, 104, 114, 114, 113, 108, 106, 99)

LeveneTest( c(ramsay, jung.parekh),
  factor(c(rep("ramsay",length(ramsay)), rep("jung.parekh",length(jung.parekh)))))

LeveneTest( c(rnorm(10), rnorm(10, 0, 2)), factor(rep(c("A","B"),each=10)) )

## Not run: 
##D # original example from package car
##D 
##D with(Moore, LeveneTest(conformity, fcategory))
##D with(Moore, LeveneTest(conformity, interaction(fcategory, partner.status)))
##D 
##D LeveneTest(conformity ~ fcategory * partner.status, data = Moore)
##D LeveneTest(conformity ~ fcategory * partner.status, data = Moore, center = mean)
##D LeveneTest(conformity ~ fcategory * partner.status, data = Moore, center = mean, trim = 0.1)
##D 
##D LeveneTest(lm(conformity ~ fcategory*partner.status, data = Moore))
## End(Not run)




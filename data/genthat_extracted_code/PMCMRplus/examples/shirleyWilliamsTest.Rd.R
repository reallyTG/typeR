library(PMCMRplus)


### Name: shirleyWilliamsTest
### Title: Shirley-Williams Test
### Aliases: shirleyWilliamsTest shirleyWilliamsTest.default
###   shirleyWilliamsTest.formula
### Keywords: htest nonparametric

### ** Examples

## Example from Shirley (1977)
## Reaction times of mice to stimuli to their tails.
y <- c(2.4, 3, 3, 2.2, 2.2, 2.2, 2.2, 2.8, 2, 3,
2.8, 2.2, 3.8, 9.4, 8.4, 3, 3.2, 4.4, 3.2, 7.4, 9.8, 3.2, 5.8,
7.8, 2.6, 2.2, 6.2, 9.4, 7.8, 3.4, 7, 9.8, 9.4, 8.8, 8.8, 3.4,
9, 8.4, 2.4, 7.8)
g <- gl(4, 10)

## Not run: 
##D ## two.sided test
##D summary(shirleyWilliamsTest(y ~ g, method = "boot", alternative = "two.sided"))
## End(Not run)

## one-sided test using look-up table
shirleyWilliamsTest(y ~ g, alternative = "greater")






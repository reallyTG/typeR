library(PMCMRplus)


### Name: adKSampleTest
### Title: Anderson-Darling k-Sample Test
### Aliases: adKSampleTest adKSampleTest.default adKSampleTest.formula

### ** Examples

## Hollander & Wolfe (1973), 116.
## Mucociliary efficiency from the rate of removal of dust in normal
## subjects, subjects with obstructive airway disease, and subjects
## with asbestosis.
x <- c(2.9, 3.0, 2.5, 2.6, 3.2) # normal subjects
y <- c(3.8, 2.7, 4.0, 2.4)      # with obstructive airway disease
z <- c(2.8, 3.4, 3.7, 2.2, 2.0) # with asbestosis

datf <- data.frame(
  g = g <- c(rep("ns", length(x)), rep("oad",
      length(y)), rep("a", length(z))),
  x = x <- c(x, y, z))

adKSampleTest(x ~ g, datf)






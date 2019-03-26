library(PMCMRplus)


### Name: kruskalTest
### Title: Kruskal-Wallis Rank Sum Test
### Aliases: kruskalTest kruskalTest.default kruskalTest.formula

### ** Examples

## Hollander & Wolfe (1973), 116.
## Mucociliary efficiency from the rate of removal of dust in normal
##  subjects, subjects with obstructive airway disease, and subjects
##  with asbestosis.
x <- c(2.9, 3.0, 2.5, 2.6, 3.2) # normal subjects
y <- c(3.8, 2.7, 4.0, 2.4)      # with obstructive airway disease
z <- c(2.8, 3.4, 3.7, 2.2, 2.0) # with asbestosis

datf <- data.frame(
  g = g <- c(rep("ns", length(x)), rep("oad",
      length(y)), rep("a", length(z))),
  x = x <- c(x, y, z))

## Using incomplete beta approximation
kruskalTest(x ~ g, datf, dist="KruskalWallis")

## Using chisquare distribution
kruskalTest(x ~ g, datf, dist="Chisquare")

## Check with kruskal.test from R stats
kruskal.test(x ~ g, datf)

## Using Conover's F
kruskalTest(x ~ g, datf, dist="FDist")

## Check with aov on ranks
anova(aov(rank(x) ~ g, datf))

## Check with oneway.test
oneway.test(rank(x) ~ g, datf, var.equal = TRUE)




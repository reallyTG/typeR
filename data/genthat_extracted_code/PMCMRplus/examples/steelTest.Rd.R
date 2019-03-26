library(PMCMRplus)


### Name: steelTest
### Title: Steel's Many-to-One Rank Test
### Aliases: steelTest steelTest.default steelTest.formula
### Keywords: htest

### ** Examples

## Example from Sachs (1997, p. 402)
x <- c(106, 114, 116, 127, 145,
110, 125, 143, 148, 151,
136, 139, 149, 160, 174)
g <- gl(3,5)
levels(g) <- c("0", "I", "II")

## Steel's Test
steelTest(x ~ g)


## Example from USEPA (2002):
## Reproduction data from a Ceriodaphnia dubia
## 7-day chronic test to several concentrations
## of effluent. Dose level 50% is excluded.
x <- c(20, 26, 26, 23, 24, 27, 26, 23, 27, 24,
13, 15, 14, 13, 23, 26, 0, 25, 26, 27,
18, 22, 13, 13, 23, 22, 20, 22, 23, 22,
14, 22, 20, 23, 20, 23, 25, 24, 25, 21,
9, 0, 9, 7, 6, 10, 12, 14, 9, 13,
rep(0,10))
g <- gl(6, 10)
levels(g) <- c("Control", "3%", "6%", "12%", "25%", "50%")

## NOEC at 3%, LOEC at 6%
steelTest(x ~ g, subset = g != "50%", alternative = "less")







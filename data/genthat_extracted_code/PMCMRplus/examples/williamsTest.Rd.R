library(PMCMRplus)


### Name: williamsTest
### Title: Williams Trend Test
### Aliases: williamsTest williamsTest.default williamsTest.formula
### Keywords: htest

### ** Examples

## Example from Sachs (1997, p. 402)
x <- c(106, 114, 116, 127, 145,
110, 125, 143, 148, 151,
136, 139, 149, 160, 174)
g <- gl(3,5)
levels(g) <- c("0", "I", "II")

## Williams Test
williamsTest(x ~ g)





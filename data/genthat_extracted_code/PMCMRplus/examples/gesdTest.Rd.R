library(PMCMRplus)


### Name: gesdTest
### Title: Generalized Extreme Studentized Deviate Many-Outlier Test
### Aliases: gesdTest
### Keywords: htest univariate

### ** Examples

## Taken from Rosner (1983):
x <- c(-0.25,0.68,0.94,1.15,1.20,1.26,1.26,
1.34,1.38,1.43,1.49,1.49,1.55,1.56,
1.58,1.65,1.69,1.70,1.76,1.77,1.81,
1.91,1.94,1.96,1.99,2.06,2.09,2.10,
2.14,2.15,2.23,2.24,2.26,2.35,2.37,
2.40,2.47,2.54,2.62,2.64,2.90,2.92,
2.92,2.93,3.21,3.26,3.30,3.59,3.68,
4.30,4.64,5.34,5.42,6.01)

out <- gesdTest(x, 10)

## print method
out

## summary method
summary(out)





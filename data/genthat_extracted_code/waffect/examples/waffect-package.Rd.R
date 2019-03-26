library(waffect)


### Name: waffect-package
### Title: A package to simulate constrained phenotypes under a disease
###   model H1
### Aliases: waffect-package
### Keywords: package

### ** Examples

## Not run: Typical usage to simulate case/control phenotypes under H1 (in this example: 5 individuals, 2 cases, 3 controls, the probability that individual 1 is a case is 0.5...):
waffect(prob =  c(0.5, 0.2, 0.9, 0.7, 0.1), count = c(2,3), label = c(1,0))

## Not run: We can just specify the number of cases:
waffect(prob =  c(0.5, 0.2, 0.9, 0.7, 0.1), count = 2, label = c(1,0))

## Not run: We can change the labels:
waffect(prob =  c(0.5, 0.2, 0.9, 0.7, 0.1), count = 2, label = c("case", "control"))

## Not run: We can also simulate under H0 just entering the number of cases and controls:
waffect(count=c(2,3), label = c(1,0))

## Not run: Simulation of phenotypes in the multiclass case (in this example: 4 individuals and  3 classes, 1 individual in class 1, 2 individuals in class 2, 1 individual in class 3):
pi = cbind(c(0.5,0.3,0.2), c(0.2,0.2,0.6), c(0.1,0.7,0.2), c(0.4,0.3,0.3))
waffect(prob =  pi, count = c(1,2,1), label = 1:3)




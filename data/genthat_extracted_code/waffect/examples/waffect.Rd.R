library(waffect)


### Name: waffect
### Title: Simulation of phenotypes in the binary (case/control) and
###   multiclass cases.
### Aliases: waffect

### ** Examples

## Not run: Typical usage to simulate case/control phenotypes under H1 (in this example: 12 individuals, 7 cases, 5 controls, the probability that individual 1 is a case is 0.2...):
waffect(prob =  c(0.2, 0.4, 0.9, 0.6, 0.9, 0.1, 0.4, 0.6, 0.6, 0.3, 0.8, 0.1), count=c(7,5), label=c(1,0))

## Not run: By rerunning the command we obtain another simulation:
waffect(prob =  c(0.2, 0.4, 0.9, 0.6, 0.9, 0.1, 0.4, 0.6, 0.6, 0.3, 0.8, 0.1), count=c(7,5), label=c(1,0))

## Not run: We can just specify the number of cases:
waffect(prob =  c(0.2, 0.4, 0.9, 0.6, 0.9, 0.1, 0.4, 0.6, 0.6, 0.3, 0.8, 0.1), count=7, label=c(1,0))

## Not run: It is possible to change the default code for cases and controls:
pi <- runif(100)
waffect(prob = pi, c(50,50), label = c("case","control"))

## Not run: If prob is not specified then a constant vector of probabilities is assumed by default. This is equivalent to simulate phenotypes under the null hypothesis H0:
waffect(count = c(20,30), label=c(1,0))  

## Not run: Example with 6 individuals and 3 classes:
pi1 = c(0.3,0.4,0.3)
pi2 = c(0.3,0.5,0.2)
pi3 = c(0.1,0.2,0.7)
pi4 = c(0.1,0.6,0.3)
pi5 = c(0.1,0.7,0.2)
pi6 = c(0.4,0.1,0.5)
pi = cbind(pi1,pi2,pi3,pi4,pi5,pi6)
waffect(prob = pi, count = c(1,2,3))





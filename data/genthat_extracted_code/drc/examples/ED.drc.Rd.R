library(drc)


### Name: ED.drc
### Title: Estimating effective doses
### Aliases: ED ED.drc
### Keywords: models nonlinear

### ** Examples


## Fitting 4-parameter log-logistic model
ryegrass.m1 <- drm(ryegrass, fct = LL.4())

## Calculating EC/ED values
ED(ryegrass.m1, c(10, 50, 90)) 
## first column: the estimates of ED10, ED50 and ED90
## second column: the corresponding estimated standard errors 

### How to use the argument 'ci'

## Also displaying 95% confidence intervals
ED(ryegrass.m1, c(10, 50, 90), interval = "delta")

## Comparing delta method and back-transformed 
##  confidence intervals for ED values

## Fitting 4-parameter log-logistic 
##  in different parameterisation (using LL2.4)
ryegrass.m2 <- drm(ryegrass, fct = LL2.4())  

ED(ryegrass.m1, c(10, 50, 90), interval = "fls")
ED(ryegrass.m2, c(10, 50, 90), interval = "delta")


### How to use the argument 'bound'

## Fitting the Brain-Cousens model
lettuce.m1 <- drm(weight ~ conc, 
data = lettuce, fct = BC.4())

### Calculating ED[-10]

# This does not work
#ED(lettuce.m1, -10)  

## Now it does work
ED(lettuce.m1, -10, bound = FALSE)  # works
ED(lettuce.m1, -20, bound = FALSE)  # works

## The following does not work for another reason: ED[-30] does not exist 
#ED(lettuce.m1, -30, bound = FALSE)  





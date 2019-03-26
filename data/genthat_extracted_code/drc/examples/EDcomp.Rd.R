library(drc)


### Name: EDcomp
### Title: Comparison of relative potencies between dose-response curves
### Aliases: EDcomp relpot
### Keywords: models nonlinear

### ** Examples


spinach.LL.4 <- drm(SLOPE~DOSE, CURVE, data = spinach, fct = LL.4())

EDcomp(spinach.LL.4, c(50,50))
EDcomp(spinach.LL.4, c(10,50))
EDcomp(spinach.LL.4, c(10,50), reverse = TRUE)

## Using the package multcomp
#sires <- SI(spinach.LL.4, c(25, 50, 75))
#library(multcomp)
#summary(glht(parm(sires[[2]][[1]], sires[[2]][[2]]), rhs = 1))

## Comparing specific ratios: 25/25, 50/50, 75/75
#sires2 <- SI(spinach.LL.4, c(25, 50, 75), matrix(c(1, 1, 2, 2, 3, 3), 3, 2, byrow = TRUE))
#library(multcomp)
#summary(glht(parm(sires2[[2]][[1]], sires2[[2]][[2]]), rhs = 1))


## Relative potency of two herbicides
m2 <- drm(DryMatter~Dose, Herbicide, 
data = S.alba, fct = LL.3())

EDcomp(m2, c(50, 50))  
EDcomp(m2, c(50, 50), interval = "delta")
EDcomp(m2, c(50, 50), interval = "fieller")

## Comparison based on an absolute
##  response level

m3 <- drm(SLOPE~DOSE, CURVE,
data = spinach, fct = LL.4())

EDcomp(m3, c(0.5,0.5), compMatch = c(2,4), type = "absolute", interval = "fieller")

EDcomp(m3, c(55,80), compMatch = c(2,4))  
# same comparison using a relative response level


## Relative potency transformed from log scale
m4 <- drm(drymatter~log(dose), treatment, data=G.aparine[-c(1:40), ], 
pmodels = data.frame(treatment,treatment,1,treatment), fct = LL2.4())

EDcomp(m4, c(50,50), interval = "fls", logBase = exp(1))





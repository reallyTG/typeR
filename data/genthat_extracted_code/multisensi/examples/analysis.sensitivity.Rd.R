library(multisensi)


### Name: analysis.sensitivity
### Title: Runs a series of sensitivity analyses by a function from the
###   'sensitivity' package
### Aliases: analysis.sensitivity
### Keywords: sensitivity analysis sensitivity package

### ** Examples

# Test case : the Winter Wheat Dynamic Models (WWDM)
library(sensitivity) # to use fast99
# input factors design
data(biomasseX)
# input climate variable
data(Climat)

# example of the sensitivity:fast99 function
# design
newplan <- fast99(model = NULL, factors = names(biomasseX), n = 100, 
            q = "qunif", q.arg = list(list(min = 0.9, max = 2.8),
                         list(min = 0.9, max = 0.99),
                         list(min = 0.6, max = 0.8),
                         list(min = 3, max = 12),
                         list(min = 0.0035, max = 0.01),
                         list(min = 0.0011, max = 0.0025),
                         list(min = 700, max = 1100)))
# simulations
wwdm.Y <- simulmodel(model=biomasse, plan=newplan$X, climdata=Climat)
# analysis
res <- analysis.sensitivity(data.frame(wwdm.Y), plan=newplan, nbcomp=4)




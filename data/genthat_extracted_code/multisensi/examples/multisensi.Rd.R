library(multisensi)


### Name: multisensi
### Title: A function with multiple options to perform multivariate
###   sensitivity analysis
### Aliases: multisensi
### Keywords: multivariate data sensitivity analysis

### ** Examples

## Test case : the Winter Wheat Dynamic Models (WWDM)
#  input factors design
 data(biomasseX)
# input climate variable
 data(Climat)
# output variables (precalculated to speed up the example)
 data(biomasseY)

# to do dynsi process
# argument reduction=NULL
resD <- multisensi(design=biomasseX, model=biomasseY, reduction=NULL,
                 dimension=NULL, analysis=analysis.anoasg,
                 analysis.args=list(formula=2,keep.outputs = FALSE))
summary(resD)


# to do gsi process
#------------
# with dimension reduction by PCA
# argument reduction=basis.ACP
resG1 <- multisensi(design=biomasseX, model=biomasseY, reduction=basis.ACP,
                   dimension=0.95, analysis=analysis.anoasg,
                   analysis.args=list(formula=2,keep.outputs = FALSE))
summary(resG1)

plot(x=resG1, beside=FALSE)

#------------
# with dimension reduction by o-splines basis
# arguments reduction=basis.osplines
# and basis.args=list(knots= ... , mdegree= ... )

resG2 <- multisensi(design=biomasseX, model=biomasseY, reduction=basis.osplines,
                   dimension=NULL, center=FALSE, scale=FALSE,
                   basis.args=list(knots=11, mdegree=3), analysis=analysis.anoasg, 
                   analysis.args=list(formula=2,keep.outputs = FALSE))
summary(resG2)

#------------
library(sensitivity) # to use fast99

# with dimension reduction by o-splines basis
# and sensitivity analysis with sensitivity:fast99
resG3 <- multisensi(design=fast99, model=biomasse,
                   analysis=analysis.sensitivity, 
                   design.args=list(factors = names(biomasseX), n = 100,
                   q = "qunif", q.arg = list(list(min = 0.9, max = 2.8),
                   list(min = 0.9, max = 0.99), list(min = 0.6, max = 0.8), 
                   list(min = 3, max = 12), list(min = 0.0035, max = 0.01),
                   list(min = 0.0011, max = 0.0025),
                   list(min = 700, max = 1100))), climdata=Climat,
                   reduction=basis.osplines,
                   basis.args=list(knots=7, mdegree=3),
                   center=FALSE,scale=FALSE,dimension=NULL)
summary(resG3)





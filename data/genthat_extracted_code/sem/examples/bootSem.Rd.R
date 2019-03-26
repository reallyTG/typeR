library(sem)


### Name: bootSem
### Title: Bootstrap a Structural Equation Model
### Aliases: bootSem bootSem.sem bootSem.msem print.bootsem summary.bootsem
###   print.summary.bootsem
### Keywords: htest models

### ** Examples

    ## No test: 

# A simple confirmatory factor-analysis model using polychoric correlations.
#  The polycor package is required for the hetcor function.

if (require(polycor)){

# The following function returns correlations computed by hetcor,
#   and is used for the bootstrapping.

hcor <- function(data) hetcor(data, std.err=FALSE)$correlations

model.cnes <- specifyModel(text="
F -> MBSA2, lam1
F -> MBSA7, lam2
F -> MBSA8, lam3
F -> MBSA9, lam4
F <-> F, NA, 1
MBSA2 <-> MBSA2, the1
MBSA7 <-> MBSA7, the2
MBSA8 <-> MBSA8, the3
MBSA9 <-> MBSA9, the4
")

R.cnes <- hcor(CNES)

sem.cnes <- sem(model.cnes, R.cnes, N=1529)
summary(sem.cnes)
}

#  Note: this can take a minute:

set.seed(12345) # for reproducibility

system.time(boot.cnes <- bootSem(sem.cnes, R=100, Cov=hcor, data=CNES))
summary(boot.cnes, type="norm")  
# cf., standard errors to those computed by summary(sem.cnes)
    
## End(No test)
    
    ## Not run: 
##D   # because of long execution time
##D 
##D # An example bootstrapping a multi-group model
##D 
##D if (require(MBESS)){ # for data
##D data(HS.data)
##D 
##D mod.hs <- cfa(text="
##D spatial: visual, cubes, paper, flags
##D verbal: general, paragrap, sentence, wordc, wordm
##D memory: wordr, numberr, figurer, object, numberf, figurew
##D math: deduct, numeric, problemr, series, arithmet
##D ")
##D 
##D mod.mg <- multigroupModel(mod.hs, groups=c("Female", "Male")) 
##D 
##D sem.mg <- sem(mod.mg, data=HS.data, group="Gender",
##D               formula = ~ visual + cubes + paper + flags +
##D               general + paragrap + sentence + wordc + wordm +
##D               wordr + numberr + figurer + object + numberf + figurew +
##D               deduct + numeric + problemr + series + arithmet
##D               )
##D 
##D # Note: this example can take several minutes or more;
##D #       you can decrease R if you just want to see how it works:
##D 
##D set.seed(12345) # for reproducibility
##D 
##D system.time(boot.mg <- bootSem(sem.mg, R=100))
##D summary(boot.mg, type="norm")
##D # cf., standard errors to those computed by summary(sem.mg)
##D }
##D     
## End(Not run)




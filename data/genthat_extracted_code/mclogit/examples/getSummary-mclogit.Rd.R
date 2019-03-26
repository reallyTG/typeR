library(mclogit)


### Name: getSummary-methods
### Title: 'getSummary' Methods
### Aliases: getSummary.mclogit getSummary.mblogit

### ** Examples

## Not run: 
##D summary(classd.model <- mclogit(cbind(Freq,choice.set)~
##D                    (econdim1.sq+nonmatdim1.sq+nonmatdim2.sq)+
##D                    (econdim1+nonmatdim1+nonmatdim2)+
##D                    (econdim1+nonmatdim1+nonmatdim2):classd,
##D                   data=mvoteint.classd,random=~1|mvoteint/eb,
##D                   subset=classd!="Farmers"))
##D myGetSummary.classd <- function(x)getSummary.mclogit(x,rearrange=list(
##D         "Econ. Left/Right"=c(
##D                     "Squared effect"="econdim1.sq",
##D                     "Linear effect"="econdim1",
##D                     " x Intermediate/Manual worker"="econdim1:classdIntermediate",
##D                     " x Service class/Manual worker"="econdim1:classdService class",
##D                     " x Self-employed/Manual worker"="econdim1:classdSelf-employed"
##D                     ),
##D         "Lib./Auth."=c(
##D                     "Squared effect"="nonmatdim1.sq",
##D                     "Linear effect"="nonmatdim1",
##D                     " x Intermediate/Manual worker"="nonmatdim1:classdIntermediate",
##D                     " x Service class/Manual worker"="nonmatdim1:classdService class",
##D                     " x Self-employed/Manual worker"="nonmatdim1:classdSelf-employed"
##D                     ),
##D         "Mod./Trad."=c(
##D                     "Squared effect"="nonmatdim2.sq",
##D                     "Linear effect"="nonmatdim2",
##D                     " x Intermediate/Manual worker"="nonmatdim2:classdIntermediate",
##D                     " x Service class/Manual worker"="nonmatdim2:classdService class",
##D                     " x Self-employed/Manual worker"="nonmatdim2:classdSelf-employed"
##D                     )
##D         ))
##D 
##D mtable(classd.model,getSummary=myGetSummary.classd)
##D # Output would look like so:
##D # ==================================================================================
##D #                                 Econ. Left/Right    Lib./Auth.       Mod./Trad.
##D # ----------------------------------------------------------------------------------
##D # Squared effect                      0.030            0.008           -0.129**
##D #                                    (0.081)          (0.041)          (0.047)
##D # Linear effect                      -0.583***        -0.038            0.137**
##D #                                    (0.063)          (0.041)          (0.045)
##D #  x Intermediate/Manual worker       0.632***        -0.029           -0.015
##D #                                    (0.026)          (0.020)          (0.019)
##D #  x Service class/Manual worker      1.158***         0.084**          0.000
##D #                                    (0.040)          (0.032)          (0.030)
##D #  x Self-employed/Manual worker      1.140***         0.363***         0.112***
##D #                                    (0.035)          (0.027)          (0.026)
##D # Var(mvoteint)                       1.080***
##D #                                    (0.000)
##D # Var(mvoteint x eb)                  0.118***
##D #                                    (0.000)
##D # ----------------------------------------------------------------------------------
##D # Dispersion                              1.561
##D # Deviance                            15007.0
##D # N                                  173445
##D # ==================================================================================
## End(Not run)




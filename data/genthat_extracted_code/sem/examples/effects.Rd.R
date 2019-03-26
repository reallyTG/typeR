library(sem)


### Name: effects.sem
### Title: Total, Direct, and Indirect Effects for Structural Equation
###   Models
### Aliases: effects.sem effects.msem print.semeffects print.semeffectsList
### Keywords: models

### ** Examples

    ## Not run: 
##D 
##D # These examples are from Fox (1980)
##D 
##D # In the first pair of examples, readMoments() and specifyModel() read from the
##D # input stream. These examples cannot be executed via example() but can be entered
##D # at the command prompt. The Blau and Duncan example is repeated using file input;
##D # this example can be executed via example(). 
##D 
##D # The recursive Blau and Duncan basic stratification model:
##D #  x1 is father's education, x2 father's SES, y3 respondent's education,
##D #  y4 SES of respondent's first job, y5 respondent's SES in 1962
##D 
##D R.bd <- readMoments(names=c("x1", "x2", "y3", "y4", "y5"))
##D 1
##D .516 1
##D .453 .438 1
##D .332 .417 .538 1
##D .322 .405 .596 .541 1
##D 
##D mod.bd <- specifyModel()
##D y3 <- x1, gam31
##D y3 <- x2, gam32
##D y4 <- x2, gam42
##D y4 <- y3, beta43
##D y5 <- x2, gam52
##D y5 <- y3, beta53
##D y5 <- y4, beta54
##D 
##D sem.bd <- sem(mod.bd, R.bd, N=20700, fixed.x=c("x1", "x2"))
##D summary(sem.bd)
##D effects(sem.bd)
##D 
##D 
##D # The nonrecursive Duncan, Haller, and Portes peer-influences model for observed variables:
##D 
##D R.DHP <- readMoments(diag=FALSE, names=c("ROccAsp", "REdAsp", "FOccAsp", 
##D "FEdAsp", "RParAsp", "RIQ", "RSES", "FSES", "FIQ", "FParAsp"))
##D .6247     
##D .3269  .3669       
##D .4216  .3275  .6404
##D .2137  .2742  .1124  .0839
##D .4105  .4043  .2903  .2598  .1839
##D .3240  .4047  .3054  .2786  .0489  .2220
##D .2930  .2407  .4105  .3607  .0186  .1861  .2707
##D .2995  .2863  .5191  .5007  .0782  .3355  .2302  .2950
##D .0760  .0702  .2784  .1988  .1147  .1021  .0931 -.0438  .2087
##D 
##D model.dhp <- specifyModel()
##D RIQ      -> ROccAsp, gam51,  NA
##D RSES     -> ROccAsp, gam52,  NA
##D FSES     -> FOccAsp, gam63,  NA
##D FIQ      -> FOccAsp, gam64,  NA
##D FOccAsp  -> ROccAsp, beta56, NA
##D ROccAsp  -> FOccAsp, beta65, NA
##D ROccAsp <-> ROccAsp, ps55,   NA
##D FOccAsp <-> FOccAsp, ps66,   NA
##D ROccAsp <-> FOccAsp, ps56,   NA
##D 
##D 
##D # Note: The following generates a warning because not all of the variables
##D #       in the correlation matrix are used
##D sem.dhp <- sem(model.dhp, R.DHP, 329,
##D                 fixed.x=c('RIQ', 'RSES', 'FSES', 'FIQ'))
##D summary(sem.dhp)
##D effects(sem.dhp)
##D     
## End(Not run)
    
## the following example may be executed via example()

etc <- system.file(package="sem", "etc") # path to data and model files

# The recursive Blau and Duncan basic stratification model:
#  x1 is father's education, x2 father's SES, y3 respondent's education,
#  y4 SES of respondent's first job, y5 respondent's SES in 1962

(R.bd <- readMoments(file=file.path(etc, "R-Blau-Duncan.txt"),
					names=c("x1", "x2", "y3", "y4", "y5")))
(mod.bd <- specifyModel(file=file.path(etc, "model-Blau-Duncan.txt")))
sem.bd <- sem(mod.bd, R.bd, N=20700, fixed.x=c("x1", "x2"))
summary(sem.bd)
effects(sem.bd)




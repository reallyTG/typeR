library(sem)


### Name: sem
### Title: General Structural Equation Models
### Aliases: sem sem.semmod sem.default sem.semmodList sem.msemmod
###   startvalues startvalues2 coef.sem vcov.sem df.residual.sem coef.msem
###   vcov.msem df.residual.msem
### Keywords: models

### ** Examples


# The following example illustrates the use the text argument to 
#   readMoments() and specifyEquations():

R.DHP <- readMoments(diag=FALSE, names=c("ROccAsp", "REdAsp", "FOccAsp", 
                "FEdAsp", "RParAsp", "RIQ", "RSES", "FSES", "FIQ", "FParAsp"),
                text="
    .6247     
    .3269  .3669       
    .4216  .3275  .6404
    .2137  .2742  .1124  .0839
    .4105  .4043  .2903  .2598  .1839
    .3240  .4047  .3054  .2786  .0489  .2220
    .2930  .2407  .4105  .3607  .0186  .1861  .2707
    .2995  .2863  .5191  .5007  .0782  .3355  .2302  .2950
    .0760  .0702  .2784  .1988  .1147  .1021  .0931 -.0438  .2087
")

model.dhp.1 <- specifyEquations(covs="RGenAsp, FGenAsp", text="
RGenAsp = gam11*RParAsp + gam12*RIQ + gam13*RSES + gam14*FSES + beta12*FGenAsp
FGenAsp = gam23*RSES + gam24*FSES + gam25*FIQ + gam26*FParAsp + beta21*RGenAsp
ROccAsp = 1*RGenAsp
REdAsp = lam21(1)*RGenAsp  # to illustrate setting start values
FOccAsp = 1*FGenAsp
FEdAsp = lam42(1)*FGenAsp
")

sem.dhp.1 <- sem(model.dhp.1, R.DHP, 329,
    fixed.x=c('RParAsp', 'RIQ', 'RSES', 'FSES', 'FIQ', 'FParAsp'))
summary(sem.dhp.1)

# Note: The following set of examples can't be run via example() because the default file
#  argument of specifyeEquations, specifyModel(), and readMoments() requires that the model 
#  specification and covariances, correlations, or raw moments be entered in an interactive
#  session at the command prompt. The examples can be copied and run in the R console,
#  however. See ?specifyModel and ?readMoments for further information.
#  These examples are repeated below using file input to specifyModel() and
#  readMoments(). The second version of the examples may be executed through example().

    ## Not run: 
##D 
##D # ------------- Duncan, Haller and Portes peer-influences model ----------------------
##D # A nonrecursive SEM with unobserved endogenous variables and fixed exogenous variables
##D 
##D R.DHP <- readMoments(diag=FALSE, names=c("ROccAsp", "REdAsp", "FOccAsp", 
##D                 "FEdAsp", "RParAsp", "RIQ", "RSES", "FSES", "FIQ", "FParAsp"))
##D     .6247     
##D     .3269  .3669       
##D     .4216  .3275  .6404
##D     .2137  .2742  .1124  .0839
##D     .4105  .4043  .2903  .2598  .1839
##D     .3240  .4047  .3054  .2786  .0489  .2220
##D     .2930  .2407  .4105  .3607  .0186  .1861  .2707
##D     .2995  .2863  .5191  .5007  .0782  .3355  .2302  .2950
##D     .0760  .0702  .2784  .1988  .1147  .1021  .0931 -.0438  .2087
##D             
##D # Fit the model using a symbolic ram specification
##D 
##D model.dhp <- specifyModel()
##D     RParAsp  -> RGenAsp, gam11,  NA
##D     RIQ      -> RGenAsp, gam12,  NA
##D     RSES     -> RGenAsp, gam13,  NA
##D     FSES     -> RGenAsp, gam14,  NA
##D     RSES     -> FGenAsp, gam23,  NA
##D     FSES     -> FGenAsp, gam24,  NA
##D     FIQ      -> FGenAsp, gam25,  NA
##D     FParAsp  -> FGenAsp, gam26,  NA
##D     FGenAsp  -> RGenAsp, beta12, NA
##D     RGenAsp  -> FGenAsp, beta21, NA
##D     RGenAsp  -> ROccAsp,  NA,     1
##D     RGenAsp  -> REdAsp,  lam21,  NA
##D     FGenAsp  -> FOccAsp,  NA,     1
##D     FGenAsp  -> FEdAsp,  lam42,  NA
##D     RGenAsp <-> RGenAsp, ps11,   NA
##D     FGenAsp <-> FGenAsp, ps22,   NA
##D     RGenAsp <-> FGenAsp, ps12,   NA
##D     ROccAsp <-> ROccAsp, theta1, NA
##D     REdAsp  <-> REdAsp,  theta2, NA
##D     FOccAsp <-> FOccAsp, theta3, NA
##D     FEdAsp  <-> FEdAsp,  theta4, NA
##D     
##D # an equivalent specification, allowing specifyModel() to generate
##D #  variance parameters for endogenous variables (and suppressing the
##D #  unnecessary NAs):
##D  
##D model.dhp <- specifyModel()
##D RParAsp  -> RGenAsp, gam11
##D RIQ      -> RGenAsp, gam12
##D RSES     -> RGenAsp, gam13
##D FSES     -> RGenAsp, gam14
##D RSES     -> FGenAsp, gam23
##D FSES     -> FGenAsp, gam24
##D FIQ      -> FGenAsp, gam25
##D FParAsp  -> FGenAsp, gam26
##D FGenAsp  -> RGenAsp, beta12
##D RGenAsp  -> FGenAsp, beta21
##D RGenAsp  -> ROccAsp,  NA,     1
##D RGenAsp  -> REdAsp,  lam21
##D FGenAsp  -> FOccAsp,  NA,     1
##D FGenAsp  -> FEdAsp,  lam42
##D RGenAsp <-> FGenAsp, ps12
##D 
##D # Another equivalent specification, telling specifyModel to add paths for 
##D #   variances and covariance of RGenAsp and FGenAsp:
##D  
##D model.dhp <- specifyModel(covs="RGenAsp, FGenAsp")
##D RParAsp  -> RGenAsp, gam11
##D RIQ      -> RGenAsp, gam12
##D RSES     -> RGenAsp, gam13
##D FSES     -> RGenAsp, gam14
##D RSES     -> FGenAsp, gam23
##D FSES     -> FGenAsp, gam24
##D FIQ      -> FGenAsp, gam25
##D FParAsp  -> FGenAsp, gam26
##D FGenAsp  -> RGenAsp, beta12
##D RGenAsp  -> FGenAsp, beta21
##D RGenAsp  -> ROccAsp,  NA,     1
##D RGenAsp  -> REdAsp,  lam21
##D FGenAsp  -> FOccAsp,  NA,     1
##D FGenAsp  -> FEdAsp,  lam42
##D 
##D # Yet another equivalent specification using specifyEquations():
##D 
##D model.dhp.1 <- specifyEquations(covs="RGenAsp, FGenAsp")
##D RGenAsp = gam11*RParAsp + gam12*RIQ + gam13*RSES + gam14*FSES + beta12*FGenAsp
##D FGenAsp = gam23*RSES + gam24*FSES + gam25*FIQ + gam26*FParAsp + beta21*RGenAsp
##D ROccAsp = 1*RGenAsp
##D REdAsp = lam21(1)*RGenAsp  # to illustrate setting start values
##D FOccAsp = 1*FGenAsp
##D FEdAsp = lam42(1)*FGenAsp
##D  
##D sem.dhp.1 <- sem(model.dhp.1, R.DHP, 329,
##D     fixed.x=c('RParAsp', 'RIQ', 'RSES', 'FSES', 'FIQ', 'FParAsp'))
##D summary(sem.dhp.1)
##D 
##D # Fit the model using a numerical ram specification (not recommended!)
##D 
##D ram.dhp <- matrix(c(
##D #               heads   to      from    param  start
##D                 1,       1,     11,      0,     1,
##D                 1,       2,     11,      1,     NA, # lam21
##D                 1,       3,     12,      0,     1,
##D                 1,       4,     12,      2,     NA, # lam42
##D                 1,      11,      5,      3,     NA, # gam11
##D                 1,      11,      6,      4,     NA, # gam12
##D                 1,      11,      7,      5,     NA, # gam13
##D                 1,      11,      8,      6,     NA, # gam14
##D                 1,      12,      7,      7,     NA, # gam23
##D                 1,      12,      8,      8,     NA, # gam24
##D                 1,      12,      9,      9,     NA, # gam25
##D                 1,      12,     10,     10,     NA, # gam26
##D                 1,      11,     12,     11,     NA, # beta12
##D                 1,      12,     11,     12,     NA, # beta21
##D                 2,       1,      1,     13,     NA, # theta1
##D                 2,       2,      2,     14,     NA, # theta2
##D                 2,       3,      3,     15,     NA, # theta3
##D                 2,       4,      4,     16,     NA, # theta4
##D                 2,      11,     11,     17,     NA, # psi11
##D                 2,      12,     12,     18,     NA, # psi22
##D                 2,      11,     12,     19,     NA  # psi12
##D                 ), ncol=5, byrow=TRUE)
##D 
##D params.dhp <- c('lam21', 'lam42', 'gam11', 'gam12', 'gam13', 'gam14',
##D                  'gam23',  'gam24',  'gam25',  'gam26',
##D                  'beta12', 'beta21', 'theta1', 'theta2', 'theta3', 'theta4',
##D                  'psi11', 'psi22', 'psi12')
##D                  
##D vars.dhp <- c('ROccAsp', 'REdAsp', 'FOccAsp', 'FEdAsp', 'RParAsp', 'RIQ',
##D                 'RSES', 'FSES', 'FIQ', 'FParAsp', 'RGenAsp', 'FGenAsp')
##D                 
##D sem.dhp.2 <- sem(ram.dhp, R.DHP, 329, param.names=params.dhp, var.names=vars.dhp, 
##D 	fixed.x=5:10)
##D summary(sem.dhp.2)
##D 
##D 
##D # -------------------- Wheaton et al. alienation data ----------------------
##D     
##D 
##D S.wh <- readMoments(names=c('Anomia67','Powerless67','Anomia71',
##D                                     'Powerless71','Education','SEI'))
##D    11.834                                    
##D     6.947    9.364                            
##D     6.819    5.091   12.532                    
##D     4.783    5.028    7.495    9.986            
##D    -3.839   -3.889   -3.841   -3.625   9.610     
##D   -21.899  -18.831  -21.748  -18.775  35.522  450.288
##D 
##D # This is the model in the SAS manual for PROC CALIS: A Recursive SEM with
##D # latent endogenous and exogenous variables.
##D # Curiously, both factor loadings for two of the latent variables are fixed.
##D 
##D model.wh.1 <- specifyModel()
##D     Alienation67   ->  Anomia67,      NA,     1
##D     Alienation67   ->  Powerless67,   NA,     0.833
##D     Alienation71   ->  Anomia71,      NA,     1
##D     Alienation71   ->  Powerless71,   NA,     0.833 
##D     SES            ->  Education,     NA,     1     
##D     SES            ->  SEI,           lamb,   NA
##D     SES            ->  Alienation67,  gam1,   NA
##D     Alienation67   ->  Alienation71,  beta,   NA
##D     SES            ->  Alienation71,  gam2,   NA
##D     Anomia67       <-> Anomia67,      the1,   NA
##D     Anomia71       <-> Anomia71,      the1,   NA
##D     Powerless67    <-> Powerless67,   the2,   NA
##D     Powerless71    <-> Powerless71,   the2,   NA
##D     Education      <-> Education,     the3,   NA
##D     SEI            <-> SEI,           the4,   NA
##D     Anomia67       <-> Anomia71,      the5,   NA
##D     Powerless67    <-> Powerless71,   the5,   NA
##D     Alienation67   <-> Alienation67,  psi1,   NA
##D     Alienation71   <-> Alienation71,  psi2,   NA
##D     SES            <-> SES,           phi,    NA
##D                            
##D sem.wh.1 <- sem(model.wh.1, S.wh, 932)
##D summary(sem.wh.1)
##D 
##D # The same model in equation format:
##D 
##D model.wh.1 <- specifyEquations()
##D Anomia67 = 1*Alienation67
##D Powerless67 = 0.833*Alienation67
##D Anomia71 = 1*Alienation71
##D Powerless71 = 0.833*Alienation71
##D Education = 1*SES
##D SEI = lamb*SES
##D Alienation67 = gam1*SES
##D Alienation71 = gam2*SES + beta*Alienation67
##D V(Anomia67) = the1
##D V(Anomia71) = the1
##D V(Powerless67) = the2
##D V(Powerless71) = the2
##D V(SES) = phi
##D C(Anomia67, Anomia71) = the5
##D C(Powerless67, Powerless71) = the5
##D 
##D # The same model, but treating one loading for each latent variable as free
##D # (and equal to each other).
##D 
##D model.wh.2 <- specifyModel()
##D     Alienation67   ->  Anomia67,      NA,        1
##D     Alienation67   ->  Powerless67,   lamby,    NA
##D     Alienation71   ->  Anomia71,      NA,        1
##D     Alienation71   ->  Powerless71,   lamby,    NA 
##D     SES            ->  Education,     NA,        1     
##D     SES            ->  SEI,           lambx,    NA
##D     SES            ->  Alienation67,  gam1,     NA
##D     Alienation67   ->  Alienation71,  beta,     NA
##D     SES            ->  Alienation71,  gam2,     NA
##D     Anomia67       <-> Anomia67,      the1,     NA
##D     Anomia71       <-> Anomia71,      the1,     NA
##D     Powerless67    <-> Powerless67,   the2,     NA
##D     Powerless71    <-> Powerless71,   the2,     NA
##D     Education      <-> Education,     the3,     NA
##D     SEI            <-> SEI,           the4,     NA
##D     Anomia67       <-> Anomia71,      the5,     NA
##D     Powerless67    <-> Powerless71,   the5,     NA
##D     Alienation67   <-> Alienation67,  psi1,     NA
##D     Alienation71   <-> Alienation71,  psi2,     NA
##D     SES            <-> SES,           phi,      NA 
##D 
##D 
##D sem.wh.2 <- sem(model.wh.2, S.wh, 932)
##D summary(sem.wh.2)
##D 
##D # And again, in equation format:
##D 
##D model.wh <- specifyEquations()
##D Anomia67 = 1*Alienation67
##D Powerless67 = lamby*Alienation67
##D Anomia71 = 1*Alienation71
##D Powerless71 = lamby*Alienation71
##D Education = 1*SES
##D SEI = lambx*SES
##D Alienation67 = gam1*SES
##D Alienation71 = gam2*SES + beta*Alienation67
##D V(Anomia67) = the1
##D V(Anomia71) = the1
##D V(Powerless67) = the2
##D V(Powerless71) = the2
##D V(SES) = phi
##D C(Anomia67, Anomia71) = the5
##D C(Powerless67, Powerless71) = the5
##D 
##D 
##D # Compare the two models by a likelihood-ratio test:
##D 
##D anova(sem.wh.1, sem.wh.2)
##D 
##D 
##D # ----------------------- Thurstone data ---------------------------------------
##D #  Second-order confirmatory factor analysis, from the SAS manual for PROC CALIS
##D 
##D R.thur <- readMoments(diag=FALSE, names=c('Sentences','Vocabulary',
##D         'Sent.Completion','First.Letters','4.Letter.Words','Suffixes',
##D         'Letter.Series','Pedigrees', 'Letter.Group'))
##D     .828                                              
##D     .776   .779                                        
##D     .439   .493    .46                                 
##D     .432   .464    .425   .674                           
##D     .447   .489    .443   .59    .541                    
##D     .447   .432    .401   .381    .402   .288              
##D     .541   .537    .534   .35    .367   .32   .555        
##D     .38   .358    .359   .424    .446   .325   .598   .452  
##D             
##D model.thur <- specifyModel()
##D     F1 -> Sentences,                      lam11
##D     F1 -> Vocabulary,                     lam21
##D     F1 -> Sent.Completion,                lam31
##D     F2 -> First.Letters,                  lam42
##D     F2 -> 4.Letter.Words,                 lam52
##D     F2 -> Suffixes,                       lam62
##D     F3 -> Letter.Series,                  lam73
##D     F3 -> Pedigrees,                      lam83
##D     F3 -> Letter.Group,                   lam93
##D     F4 -> F1,                             gam1
##D     F4 -> F2,                             gam2
##D     F4 -> F3,                             gam3
##D     F1 <-> F1,                            NA,     1
##D     F2 <-> F2,                            NA,     1
##D     F3 <-> F3,                            NA,     1
##D     F4 <-> F4,                            NA,     1
##D 
##D sem.thur <- sem(model.thur, R.thur, 213)
##D summary(sem.thur)
##D 
##D # The model in equation format:
##D 
##D model.thur <- specifyEquations()
##D Sentences = lam11*F1
##D Vocabulary = lam21*F1
##D Sent.Completion = lam31*F1
##D First.Letters = lam42*F2
##D 4.Letter.Words = lam52*F2
##D Suffixes = lam62*F2
##D Letter.Series = lam73*F3
##D Pedigrees = lam83*F3
##D Letter.Group = lam93*F3
##D F1 = gam1*F4
##D F2 = gam2*F4
##D F3 = gam3*F4
##D V(F1) = 1
##D V(F2) = 1
##D V(F3) = 1
##D V(F4) = 1
##D 
##D 
##D #------------------------- Kerchoff/Kenney path analysis ---------------------
##D # An observed-variable recursive SEM from the LISREL manual
##D 
##D R.kerch <- readMoments(diag=FALSE, names=c('Intelligence','Siblings',
##D                         'FatherEd','FatherOcc','Grades','EducExp','OccupAsp'))
##D     -.100                                
##D      .277  -.152                          
##D      .250  -.108  .611                     
##D      .572  -.105  .294   .248               
##D      .489  -.213  .446   .410   .597         
##D      .335  -.153  .303   .331   .478   .651   
##D     
##D model.kerch <- specifyModel()
##D     Intelligence -> Grades,       gam51
##D     Siblings -> Grades,           gam52
##D     FatherEd -> Grades,           gam53
##D     FatherOcc -> Grades,          gam54
##D     Intelligence -> EducExp,      gam61
##D     Siblings -> EducExp,          gam62
##D     FatherEd -> EducExp,          gam63
##D     FatherOcc -> EducExp,         gam64
##D     Grades -> EducExp,            beta65
##D     Intelligence -> OccupAsp,     gam71
##D     Siblings -> OccupAsp,         gam72
##D     FatherEd -> OccupAsp,         gam73
##D     FatherOcc -> OccupAsp,        gam74
##D     Grades -> OccupAsp,           beta75
##D     EducExp -> OccupAsp,          beta76
##D                        
##D sem.kerch <- sem(model.kerch, R.kerch, 737, 
##D     fixed.x=c('Intelligence', 'Siblings', 'FatherEd', 'FatherOcc'))
##D summary(sem.kerch)
##D 
##D # The model in equation format:
##D 
##D model.kerch <- specifyEquations()
##D Grades = gam51*Intelligence + gam52*Siblings + gam53*FatherEd 
##D            + gam54*FatherOcc
##D EducExp = gam61*Intelligence + gam62*Siblings + gam63*FatherEd 
##D             + gam64*FatherOcc + beta65*Grades
##D OccupAsp = gam71*Intelligence + gam72*Siblings + gam73*FatherEd 
##D             + gam74*FatherOcc + beta75*Grades + beta76*EducExp
##D 
##D 
##D #------------------- McArdle/Epstein latent-growth-curve model -----------------
##D # This model, from McArdle and Epstein (1987, p.118), illustrates the use of a 
##D # raw moment matrix to fit a model with an intercept. (The example was suggested
##D # by Mike Stoolmiller.)
##D 
##D M.McArdle <- readMoments(
##D     names=c('WISC1', 'WISC2', 'WISC3', 'WISC4', 'UNIT'))
##D     365.661                                      
##D     503.175     719.905                           
##D     675.656     958.479    1303.392                
##D     890.680    1265.846    1712.475    2278.257     
##D      18.034      25.819      35.255      46.593     1.000
##D  
##D mod.McArdle <- specifyModel()
##D     C -> WISC1, NA, 6.07
##D     C -> WISC2, B2, NA
##D     C -> WISC3, B3, NA
##D     C -> WISC4, B4, NA
##D     UNIT -> C, Mc, NA
##D     C <-> C, Vc, NA,
##D     WISC1 <-> WISC1, Vd, NA
##D     WISC2 <-> WISC2, Vd, NA
##D     WISC3 <-> WISC3, Vd, NA
##D     WISC4 <-> WISC4, Vd, NA
##D 
##D sem.McArdle <- sem(mod.McArdle, M.McArdle, 204, fixed.x="UNIT", raw=TRUE)
##D summary(sem.McArdle)
##D 
##D # The model in equation format:
##D 
##D mod.McArdle <- specifyEquations()
##D WISC1 = 6.07*C
##D WISC2 = B2*C
##D WISC3 = B3*C
##D WISC4 = b4*C
##D C = Mc*UNIT
##D v(C) = Vc
##D v(WISC1) = Vd
##D v(WISC2) = Vd
##D v(WISC3) = Vd
##D v(WISC4) = Vd
##D 
##D     
##D #------------ Bollen industrialization and democracy example -----------------
##D # This model, from Bollen (1989, Ch. 8), illustrates the use in sem() of a
##D # case-by-variable data (see ?Bollen) set rather than a covariance or moment matrix
##D 
##D model.bollen <- specifyModel()
##D 	Demo60 -> y1, NA, 1
##D 	Demo60 -> y2, lam2, 
##D 	Demo60 -> y3, lam3, 
##D 	Demo60 -> y4, lam4, 
##D 	Demo65 -> y5, NA, 1
##D 	Demo65 -> y6, lam2, 
##D 	Demo65 -> y7, lam3, 
##D 	Demo65 -> y8, lam4, 
##D 	Indust -> x1, NA, 1
##D 	Indust -> x2, lam6, 
##D 	Indust -> x3, lam7, 
##D 	y1 <-> y5, theta15
##D 	y2 <-> y4, theta24
##D 	y2 <-> y6, theta26
##D 	y3 <-> y7, theta37
##D 	y4 <-> y8, theta48
##D 	y6 <-> y8, theta68
##D 	Indust -> Demo60, gamma11, 
##D 	Indust -> Demo65, gamma21, 
##D 	Demo60 -> Demo65, beta21, 
##D 	Indust <-> Indust, phi
##D 	
##D sem.bollen <- sem(model.bollen, data=Bollen)
##D summary(sem.bollen)
##D summary(sem.bollen, robust=TRUE) # robust SEs and tests
##D summary(sem.bollen, analytic.se=FALSE) # uses numeric rather than analytic Hessian
##D 
##D   # GLS rather than ML estimator:
##D sem.bollen.gls <- sem(model.bollen, data=Bollen, objective=objectiveGLS) 
##D summary(sem.bollen.gls)
##D 
##D # The model in equation format:
##D 
##D model.bollen <- specifyEquations()
##D y1 = 1*Demo60
##D y2 = lam2*Demo60
##D y3 = lam3*Demo60
##D y4 = lam4*Demo60
##D y5 = 1*Demo65
##D y6 = lam2*Demo65
##D y7 = lam3*Demo65
##D y8 = lam4*Demo65
##D x1 = 1*Indust
##D x2 = lam6*Indust
##D x3 = lam7*Indust
##D c(y1, y5) = theta15
##D c(y2, y4) = theta24
##D c(y2, y6) = theta26
##D c(y3, y7) = theta37
##D c(y4, y8) = theta48
##D c(y6, y8) = theta68
##D Demo60 = gamma11*Indust
##D Demo65 = gamma21*Indust + beta21*Demo60
##D v(Indust) = phi
##D 
##D 
##D # -------------- A simple CFA model for the Thurstone mental tests data --------------
##D 
##D R.thur <- readMoments(diag=FALSE, 
##D   names=c('Sentences','Vocabulary',
##D           'Sent.Completion','First.Letters','4.Letter.Words','Suffixes',
##D           'Letter.Series','Pedigrees', 'Letter.Group'))
##D .828                                              
##D .776   .779                                        
##D .439   .493    .46                                 
##D .432   .464    .425   .674                           
##D .447   .489    .443   .59    .541                    
##D .447   .432    .401   .381    .402   .288              
##D .541   .537    .534   .35    .367   .32   .555        
##D .38   .358    .359   .424    .446   .325   .598   .452
##D 
##D 	#  (1) in CFA format:
##D 
##D mod.cfa.thur.c <- cfa(reference.indicators=FALSE)
##D FA: Sentences, Vocabulary, Sent.Completion
##D FB: First.Letters, 4.Letter.Words, Suffixes
##D FC: Letter.Series, Pedigrees, Letter.Group
##D 
##D cfa.thur.c <- sem(mod.cfa.thur.c, R.thur, 213)
##D summary(cfa.thur.c)
##D 
##D 	#  (2) in equation format:
##D 
##D mod.cfa.thur.e <- specifyEquations(covs="F1, F2, F3")
##D Sentences = lam11*F1
##D Vocabulary = lam21*F1
##D Sent.Completion = lam31*F1
##D First.Letters = lam42*F2
##D 4.Letter.Words = lam52*F2
##D Suffixes = lam62*F2
##D Letter.Series = lam73*F3
##D Pedigrees = lam83*F3
##D Letter.Group = lam93*F3
##D V(F1) = 1
##D V(F2) = 1
##D V(F3) = 1
##D 
##D cfa.thur.e <- sem(mod.cfa.thur.e, R.thur, 213)
##D summary(cfa.thur.e)
##D 
##D 	#  (3) in path format:
##D 
##D mod.cfa.thur.p <- specifyModel(covs="F1, F2, F3")
##D F1 -> Sentences,                      lam11
##D F1 -> Vocabulary,                     lam21
##D F1 -> Sent.Completion,                lam31
##D F2 -> First.Letters,                  lam41
##D F2 -> 4.Letter.Words,                 lam52
##D F2 -> Suffixes,                       lam62
##D F3 -> Letter.Series,                  lam73
##D F3 -> Pedigrees,                      lam83
##D F3 -> Letter.Group,                   lam93
##D F1 <-> F1,                            NA,     1
##D F2 <-> F2,                            NA,     1
##D F3 <-> F3,                            NA,     1
##D 
##D cfa.thur.p <- sem(mod.cfa.thur.p, R.thur, 213)
##D summary(cfa.thur.p)
##D 
##D # -----  a CFA model fit by FIML to the mental-tests dataset with missing data -----
##D 
##D mod.cfa.tests <- cfa(raw=TRUE)
##D verbal: x1, x2, x3
##D math: y1, y2, y3
##D 
##D cfa.tests <- sem(mod.cfa.tests, data=Tests, na.action=na.pass, 
##D                 objective=objectiveFIML, fixed.x="Intercept")
##D summary(cfa.tests)
##D summary(cfa.tests, saturated=TRUE) # takes time to fit saturated model for comparison
##D 
##D 
##D # ---  a multigroup CFA model fit to the Holzinger-Swineford mental-tests data  -----
##D 
##D library(MBESS) # for data
##D data(HS.data)
##D 
##D mod.hs <- cfa()
##D spatial: visual, cubes, paper, flags
##D verbal: general, paragrap, sentence, wordc, wordm
##D memory: wordr, numberr, figurer, object, numberf, figurew
##D math: deduct, numeric, problemr, series, arithmet
##D 
##D mod.mg <- multigroupModel(mod.hs, groups=c("Female", "Male")) 
##D 
##D sem.mg <- sem(mod.mg, data=HS.data, group="Gender",
##D               formula = ~ visual + cubes + paper + flags +
##D               general + paragrap + sentence + wordc + wordm +
##D               wordr + numberr + figurer + object + numberf + figurew +
##D               deduct + numeric + problemr + series + arithmet
##D               )
##D summary(sem.mg)
##D 
##D 	# with cross-group equality constraints:
##D 	
##D mod.mg.eq <- multigroupModel(mod.hs, groups=c("Female", "Male"), allEqual=TRUE)
##D 
##D sem.mg.eq <- sem(mod.mg.eq, data=HS.data, group="Gender",
##D               formula = ~ visual + cubes + paper + flags +
##D                 general + paragrap + sentence + wordc + wordm +
##D                 wordr + numberr + figurer + object + numberf + figurew +
##D                 deduct + numeric + problemr + series + arithmet
##D               )
##D summary(sem.mg.eq)
##D 
##D anova(sem.mg, sem.mg.eq) # test equality constraints
##D 	
## End(Not run)

## ===============================================================================
	
# The following examples use file input and may be executed via example():

etc <- system.file(package="sem", "etc") # path to data and model files

#   to get all fit indices (not recommended, but for illustration):

opt <- options(fit.indices = c("GFI", "AGFI", "RMSEA", "NFI", "NNFI", 
         "CFI", "RNI", "IFI", "SRMR", "AIC", "AICc", "BIC", "CAIC"))

# ------------- Duncan, Haller and Portes peer-influences model ----------------------
# A nonrecursive SEM with unobserved endogenous variables and fixed exogenous variables

(R.DHP <- readMoments(file=file.path(etc, "R-DHP.txt"),
				diag=FALSE, names=c("ROccAsp", "REdAsp", "FOccAsp", 
                "FEdAsp", "RParAsp", "RIQ", "RSES", "FSES", "FIQ", "FParAsp")))
(model.dhp <- specifyModel(file=file.path(etc, "model-DHP.txt")))
sem.dhp.1 <- sem(model.dhp, R.DHP, 329,
    fixed.x=c('RParAsp', 'RIQ', 'RSES', 'FSES', 'FIQ', 'FParAsp'))
summary(sem.dhp.1)


# -------------------- Wheaton et al. alienation data ----------------------

(S.wh <- readMoments(file=file.path(etc, "S-Wheaton.txt"),
					names=c('Anomia67','Powerless67','Anomia71',
                            'Powerless71','Education','SEI')))

# This is the model in the SAS manual for PROC CALIS: A Recursive SEM with
# latent endogenous and exogenous variables.
# Curiously, both factor loadings for two of the latent variables are fixed.

(model.wh.1 <- specifyModel(file=file.path(etc, "model-Wheaton-1.txt")))                    
sem.wh.1 <- sem(model.wh.1, S.wh, 932)
summary(sem.wh.1)

# The same model, but treating one loading for each latent variable as free
# (and equal to each other).

(model.wh.2 <- specifyModel(file=file.path(etc, "model-Wheaton-2.txt")))
sem.wh.2 <- sem(model.wh.2, S.wh, 932)
summary(sem.wh.2)

# Compare the two models by a likelihood-ratio test:

anova(sem.wh.1, sem.wh.2)


# ----------------------- Thurstone data ---------------------------------------

#  Second-order confirmatory factor analysis, from the SAS manual for PROC CALIS

(R.thur <- readMoments(file=file.path(etc, "R-Thurstone.txt"),
		diag=FALSE, names=c('Sentences','Vocabulary',
        'Sent.Completion','First.Letters','4.Letter.Words','Suffixes',
        'Letter.Series','Pedigrees', 'Letter.Group')))
(model.thur <- specifyModel(file=file.path(etc, "model-Thurstone.txt")))
sem.thur <- sem(model.thur, R.thur, 213)
summary(sem.thur)


#------------------------- Kerchoff/Kenney path analysis ---------------------

# An observed-variable recursive SEM from the LISREL manual

(R.kerch <- readMoments(file=file.path(etc, "R-Kerchoff.txt"),
					   diag=FALSE, names=c('Intelligence','Siblings',
                        'FatherEd','FatherOcc','Grades','EducExp','OccupAsp')))
(model.kerch <- specifyModel(file=file.path(etc, "model-Kerchoff.txt")))
sem.kerch <- sem(model.kerch, R.kerch, 737, 
    fixed.x=c('Intelligence', 'Siblings', 'FatherEd', 'FatherOcc'))
summary(sem.kerch)


#------------------- McArdle/Epstein latent-growth-curve model -----------------

# This model, from McArdle and Epstein (1987, p.118), illustrates the use of a 
# raw moment matrix to fit a model with an intercept. (The example was suggested
# by Mike Stoolmiller.)

(M.McArdle <- readMoments(file=file.path(etc, "M-McArdle.txt"),
    names=c('WISC1', 'WISC2', 'WISC3', 'WISC4', 'UNIT')))
(mod.McArdle <- specifyModel(file=file.path(etc, "model-McArdle.txt")))
sem.McArdle <- sem(mod.McArdle, M.McArdle, 204, fixed.x="UNIT", raw=TRUE)
summary(sem.McArdle)


#------------ Bollen industrialization and democracy example -----------------

# This model, from Bollen (1989, Ch. 8), illustrates the use in sem() of a
# case-by-variable data set (see ?Bollen) rather than a covariance or moment matrix

(model.bollen <- specifyModel(file=file.path(etc, "model-Bollen.txt")))
sem.bollen <- sem(model.bollen, data=Bollen)
summary(sem.bollen)
summary(sem.bollen, robust=TRUE) # robust SEs and tests
summary(sem.bollen, analytic.se=FALSE) # uses numeric rather than analytic Hessian

  # GLS rather than ML estimator:
sem.bollen.gls <- sem(model.bollen, data=Bollen, objective=objectiveGLS) 
summary(sem.bollen.gls)

# -----  a CFA model fit by FIML to the mental-tests dataset with missing data -----

(mod.cfa.tests <- cfa(file=file.path(etc, "model-Tests.txt"), raw=TRUE))
cfa.tests <- sem(mod.cfa.tests, data=Tests, na.action=na.pass, 
                optimizer=optimizerNlm, objective=objectiveFIML, fixed.x="Intercept")
summary(cfa.tests)

#------------ Holzinger and Swineford muiltigroup CFA example ----------------

if (require(MBESS)){ # for data
	data(HS.data)
	
	mod.hs <- cfa(file=file.path(etc, "model-HS.txt"))
	
	mod.mg <- multigroupModel(mod.hs, groups=c("Female", "Male")) 
	
	sem.mg <- sem(mod.mg, data=HS.data, group="Gender",
	              formula = ~ visual + cubes + paper + flags +
	              general + paragrap + sentence + wordc + wordm +
	              wordr + numberr + figurer + object + numberf + figurew +
	              deduct + numeric + problemr + series + arithmet
	              )
	summary(sem.mg)
	
		# with cross-group equality constraints:
		
	mod.mg.eq <- multigroupModel(mod.hs, groups=c("Female", "Male"), allEqual=TRUE)
	
	sem.mg.eq <- sem(mod.mg.eq, data=HS.data, group="Gender",
	              formula = ~ visual + cubes + paper + flags +
	                general + paragrap + sentence + wordc + wordm +
	                wordr + numberr + figurer + object + numberf + figurew +
	                deduct + numeric + problemr + series + arithmet
	              )
	summary(sem.mg.eq)
	
	anova(sem.mg, sem.mg.eq) # test equality constraints
    
    options(opt) # restore fit.indices option
	}




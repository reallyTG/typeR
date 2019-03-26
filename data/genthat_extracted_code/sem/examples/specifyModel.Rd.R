library(sem)


### Name: specifyModel
### Title: Specify a Structural Equation Model
### Aliases: specifyModel specifyEquations cfa multigroupModel print.semmod
###   print.semmodList classifyVariables removeRedundantPaths combineModels
###   combineModels.semmod update.semmod edit.semmod
### Keywords: models

### ** Examples


# example using the text argument:

model.dhp <- specifyModel(text="
    RParAsp  -> RGenAsp, gam11,  NA
    RIQ      -> RGenAsp, gam12,  NA
    RSES     -> RGenAsp, gam13,  NA
    FSES     -> RGenAsp, gam14,  NA
    RSES     -> FGenAsp, gam23,  NA
    FSES     -> FGenAsp, gam24,  NA
    FIQ      -> FGenAsp, gam25,  NA
    FParAsp  -> FGenAsp, gam26,  NA
    FGenAsp  -> RGenAsp, beta12, NA
    RGenAsp  -> FGenAsp, beta21, NA
    RGenAsp  -> ROccAsp,  NA,     1
    RGenAsp  -> REdAsp,  lam21,  NA
    FGenAsp  -> FOccAsp,  NA,     1
    FGenAsp  -> FEdAsp,  lam42,  NA
    RGenAsp <-> RGenAsp, ps11,   NA
    FGenAsp <-> FGenAsp, ps22,   NA
    RGenAsp <-> FGenAsp, ps12,   NA
    ROccAsp <-> ROccAsp, theta1, NA
    REdAsp  <-> REdAsp,  theta2, NA
    FOccAsp <-> FOccAsp, theta3, NA
    FEdAsp  <-> FEdAsp,  theta4, NA
")    
model.dhp

   # same model in equation form:
model.dhp.1 <- specifyEquations(covs="RGenAsp, FGenAsp", text="
RGenAsp = gam11*RParAsp + gam12*RIQ + gam13*RSES + gam14*FSES + beta12*FGenAsp
FGenAsp = gam23*RSES + gam24*FSES + gam25*FIQ + gam26*FParAsp + beta21*RGenAsp
ROccAsp = 1*RGenAsp
REdAsp = lam21(1)*RGenAsp  # to illustrate setting start values
FOccAsp = 1*FGenAsp
FEdAsp = lam42(1)*FGenAsp
")
model.dhp

# Note: The following examples can't be run via example() because the 
#  default file argument requires that the model specification be entered
#  at the command prompt. The examples can be copied and run in an interactive 
#  session in the R console, however.

    ## Not run: 
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
##D model.dhp
##D     
##D # an equivalent specification, allowing specifyModel() to generate
##D #  variance parameters for endogenous variables (and suppressing
##D #  the unnecessary trailing NAs):
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
##D model.dhp
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
##D model.dhp
##D 
##D # The same model in equation format:
##D 
##D model.dhp.1 <- specifyEquations(covs="RGenAsp, FGenAsp")
##D RGenAsp = gam11*RParAsp + gam12*RIQ + gam13*RSES + gam14*FSES + beta12*FGenAsp
##D FGenAsp = gam23*RSES + gam24*FSES + gam25*FIQ + gam26*FParAsp + beta21*RGenAsp
##D ROccAsp = 1*RGenAsp
##D REdAsp = lam21(1)*RGenAsp  # to illustrate setting start values
##D FOccAsp = 1*FGenAsp
##D FEdAsp = lam42(1)*FGenAsp
##D 
##D model.dhp
##D 
##D classifyVariables(model.dhp)
##D 
##D # updating the model to impose equality constraints
##D #  and to rename the latent variables and gamma parameters
##D 
##D model.dhp.eq <- update(model.dhp)
##D delete, RSES -> FGenAsp
##D delete, FSES -> FGenAsp
##D delete, FIQ  -> FGenAsp
##D delete, FParAsp -> FGenAs
##D delete, RGenAsp  -> FGenAsp
##D add, RSES     -> FGenAsp, gam14,  NA
##D add, FSES     -> FGenAsp, gam13,  NA
##D add, FIQ      -> FGenAsp, gam12,  NA
##D add, FParAsp  -> FGenAsp, gam26,  NA
##D add, RGenAsp  -> FGenAsp, beta12, NA
##D replace, gam, gamma
##D replace, Gen, General
##D 
##D model.dhp.eq
##D 
##D # A three-factor CFA model for the Thurstone mental-tests data, 
##D #    specified three equivalent ways:
##D 
##D R.thur <- readMoments(diag=FALSE, 
##D     names=c('Sentences','Vocabulary',
##D             'Sent.Completion','First.Letters','4.Letter.Words','Suffixes',
##D             'Letter.Series','Pedigrees', 'Letter.Group'))
##D .828                                              
##D .776   .779                                        
##D .439   .493    .46                                 
##D .432   .464    .425   .674                           
##D .447   .489    .443   .59    .541                    
##D .447   .432    .401   .381    .402   .288              
##D .541   .537    .534   .35    .367   .32   .555        
##D .38   .358    .359   .424    .446   .325   .598   .452
##D 
##D 	#  (1a) in CFA format:
##D 
##D mod.cfa.thur.c <- cfa(reference.indicators=FALSE)
##D FA: Sentences, Vocabulary, Sent.Completion
##D FB: First.Letters, 4.Letter.Words, Suffixes
##D FC: Letter.Series, Pedigrees, Letter.Group
##D 
##D cfa.thur.c <- sem(mod.cfa.thur.c, R.thur, 213)
##D summary(cfa.thur.c)
##D 
##D 	#  (1b) in CFA format, using reference indicators:
##D 	
##D mod.cfa.thur.r <- cfa()
##D FA: Sentences, Vocabulary, Sent.Completion
##D FB: First.Letters, 4.Letter.Words, Suffixes
##D FC: Letter.Series, Pedigrees, Letter.Group
##D 
##D cfa.thur.r <- sem(mod.cfa.thur.r, R.thur, 213)
##D summary(cfa.thur.r)
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
##D # The Thursstone CFA model with equality constraints on the
##D #  factor loadings and error variances
##D 
##D mod.cfa.thur.ceq <- cfa(reference.indicators=FALSE)
##D FA: Sentences = Vocabulary = Sent.Completion
##D FB: First.Letters = 4.Letter.Words = Suffixes
##D FC: Letter.Series = Pedigrees = Letter.Group
##D var: Sentences = Vocabulary = Sent.Completion
##D var: First.Letters = 4.Letter.Words = Suffixes
##D var: Letter.Series = Pedigrees = Letter.Group
##D 
##D cfa.thur.ceq <- sem(mod.cfa.thur.ceq, R.thur, 213)
##D summary(cfa.thur.ceq)
##D anova(cfa.thur.c, cfa.thur.ceq)
##D pathDiagram(cfa.thur.ceq, ignore.double=FALSE, ignore.self=TRUE,
##D     min.rank="FA, FB, FC", edge.labels="values")
##D 
##D # a multigroup CFA model fit to the Holzinger-Swineford
##D #   mental-tests data (from the MBESS package)
##D 
##D library(MBESS)
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
## End(Not run)




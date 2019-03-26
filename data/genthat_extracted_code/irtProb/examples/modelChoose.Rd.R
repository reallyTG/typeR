library(irtProb)


### Name: modelChoose
### Title: Functions For Choosing The m4pl Best Model(s)
### Aliases: meanModels modelChoose modelChooseAdd
### Keywords: distribution

### ** Examples

## Not run: 
##D ## GENERATION OF VECTORS OF RESPONSE
##D  # NOTE THE USUAL PARAMETRIZATION OF THE ITEM DISCRIMINATION,
##D  # THE VALUE OF THE PERSONNAL FLUCTUATION FIXED AT 0,
##D  # AND THE VALUE OF THE PERSONNAL PSEUDO-GUESSING FIXED AT 0.30.
##D  # IT COULD BE TYPICAL OF PLAGIARISM BEHAVIOR.
##D  nItems <- 40
##D  a      <- rep(1.702,nItems); b <- seq(-5,5,length=nItems)
##D  c      <- rep(0,nItems); d <- rep(1,nItems)
##D  nSubjects <- 1; rep <- 100
##D  theta     <- seq(-1,-1,length=nSubjects)
##D  S         <- runif(n=nSubjects,min=0.0,max=0.0)
##D  C         <- runif(n=nSubjects,min=0.3,max=0.3)
##D  D         <- runif(n=nSubjects,min=0,max=0)
##D  set.seed(seed = 100)
##D  X         <- ggrm4pl(n=nItems, rep=rep,
##D                       theta=theta, S=S, C=C, D=D,
##D                       s=1/a, b=b,c=c,d=d)
##D 
##D ## Results for each subjects for each models
##D  essai <- m4plModelShow(X, b=b, s=1/a, c=c, d=d, m=0, prior="uniform")
##D 
##D ## Means of choosen variables from m4plModleShow previous call
##D  round(meanModels(essai, statistic=c("LL","BIC","T","C")), 2)
##D 
##D ## Which model(s) are the best for each subject (LL criteria)
##D  res <- modelChoose(essai, criteria = "LL", tol = 0.2); res
##D  
##D ## Which model(s) are the best for each of the first 20 subjects (BIC criteria)
##D  res <- modelChoose(essai[which(essai$ID < 20) ,], criteria="BIC"); res
##D 
##D ## A look at the 15th subject parameters estimation for each models
##D  essai[which(essai$ID == 15) ,]
##D  
##D ## Add the logical critLL variable to the data frame
##D  criteria <- "LL"
##D  res1    <- modelChooseAdd(essai, criteria=criteria)
##D  # Create a charcater string composed from "crit" and criteria
##D  crit    <- paste("crit",criteria,sep="")
##D  # To Show only the lines where the models is choosen according to critLL
##D  res2    <- res1[which(res1[crit] == TRUE),]; mean(res2$T);sd(res2$T,na.rm=TRUE);res2
##D  # Give the mean for choosen variables from m4plModelShow
##D  meanModels(essai, statistic=c("LL","BIC","T","SeT","S","C","D"))
##D  # Tabulate only the choosen models
##D  table(res2$MODEL)
##D  # Show the information for the subject for which the model TSCD was choosen
##D  res2[which(res2$MODEL == "TSCD") ,]
##D  # Show only the results for the 5th subject, the with the TSCD model choosen
##D  res1[which(res1$ID == 5) ,]
##D  # Same, but without critLL
##D  essai[which(essai$ID == 5) ,]
##D 
##D ## Simulation whith cheating
##D  # High proficiency students responding at random to 20##D 
##D  # easiest ones)
##D  XHProficiency             <- X
##D  pourcHasard               <- 0.20; nHasard <- abs(dim(X)[2]*pourcHasard)
##D  XHProficiency[,1:nHasard] <- rbinom(dim(X)[1]*nHasard, 1, 0.5)
##D  XHProficiency             <- m4plModelShow(XHProficiency, b=b, s=1/a, c=c, d=d,
##D                                             m=0, prior="uniform")
##D  XHProficiency             <- modelChooseAdd(XHProficiency, criteria=criteria)
##D  XHProficiency             <- XHProficiency[which(XHProficiency$critLL == TRUE),]
##D  mean(XHProficiency$T);sd(XHProficiency$T,na.rm=TRUE);XHProficiency[1:10,]
##D  meanModels(XHProficiency, statistic=c("LL","BIC","T","SeT","S","C","D"))
##D  table(XHProficiency$MODEL)
##D  
##D  # Low proficiency students responding at random to 20##D 
##D  # (more difficult ones)
##D  XLProficiency                             <- X
##D  pourcHasard                               <- 0.20
##D  nHasard                                   <- abs(dim(X)[2]*pourcHasard)
##D  XLProficiency[,(nItems-nHasard+1):nItems] <- rbinom(dim(X)[1]*nHasard, 1, 0.5)
##D  XLProficiency                             <- m4plModelShow(XLProficiency, b=b,
##D                                               s=1/a, c=c, d=d, m=0, prior="uniform")
##D  XLProficiency                             <- modelChooseAdd(XLProficiency,
##D                                                              criteria=criteria)
##D  XLProficiency <- XLProficiency[which(XLProficiency$critLL == TRUE),]
##D  mean(XLProficiency$T);sd(XLProficiency$T,na.rm=TRUE);XLProficiency[1:10,]
##D  meanModels(XLProficiency, statistic=c("LL","BIC","T","SeT","S","C","D"))
##D  table(XLProficiency$MODEL)
##D 
##D  # High proficiency students giving incorrect responses to 20##D 
##D  # (easiest ones)
##D  XHProficiency             <- X
##D  pourcCheat                <- 0.20; nCheat  <- abs(dim(X)[2]*pourcCheat)
##D  XHProficiency[,1:nCheat]  <- rep(0, dim(X)[1]*dim(X)[2]*pourcCheat)
##D  XHProficiency             <- m4plModelShow(XHProficiency, b=b, s=1/a, c=c, d=d,
##D                                             m=0, prior="uniform")
##D  XHProficiency             <- modelChooseAdd(XHProficiency, criteria=criteria)
##D  XHProficiency             <- XHProficiency[which(XHProficiency$critLL == TRUE),]
##D  mean(XHProficiency$T);sd(XHProficiency$T,na.rm=TRUE);XHProficiency[1:10,]
##D  meanModels(XHProficiency, statistic=c("LL","BIC","T","SeT","S","C","D"))
##D  table(XHProficiency$MODEL)
##D  
##D  # Low proficiency students giving correct responses to 20##D 
##D  # (more difficult ones)
##D  XLProficiency                             <- X
##D  pourcCheat                                <- 0.20
##D  nCheat                                    <- abs(dim(X)[2]*pourcCheat);
##D  XLProficiency[,(nItems-nCheat+1):nItems]  <- rep(1, dim(X)[1]*dim(X)[2]*pourcCheat)
##D  XLProficiency                             <- m4plModelShow(XLProficiency, b=b,
##D                                               s=1/a, c=c, d=d, m=0, prior="uniform")
##D  XLProficiency                             <- modelChooseAdd(XLProficiency,
##D                                                              criteria=criteria)
##D  XLProficiency <- XLProficiency[which(XLProficiency$critLL == TRUE),]
##D  mean(XLProficiency$T);sd(XLProficiency$T,na.rm=TRUE);XLProficiency[1:10,]
##D  meanModels(XLProficiency, statistic=c("LL","BIC","T","SeT","S","C","D"))
##D  table(XLProficiency$MODEL)
##D  
## End(Not run)
 



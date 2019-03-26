library(irtProb)


### Name: m4plModelShow
### Title: Results For Each Subject To Each Model
### Aliases: m4plModelShow
### Keywords: distribution

### ** Examples

## Not run: 
##D ## GENERATION OF VECTORS OF RESPONSES
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
##D  D         <- runif(n=nSubjects,min=0.0,max=0.0)
##D  set.seed(seed = 100)
##D  X         <- ggrm4pl(n=nItems, rep=rep,
##D                       theta=theta, S=S, C=C, D=D,
##D                       s=1/a, b=b,c=c,d=d)
##D 
##D ## Results for each subjects for each models
##D  essai <- m4plModelShow(X, b=b, s=1/a, c=c, d=d, m=0, prior="uniform")
##D  
##D ## Mean results for some speficic models
##D  median(essai[which(essai$MODEL == "TSCD") ,]$SeT, na.rm=TRUE)
##D  mean(  essai[which(essai$MODEL == "TSCD") ,]$SeT, na.rm=TRUE)
##D  mean(  essai[which(essai$MODEL ==   "TD") ,]$SeT, na.rm=TRUE)
##D  sd(    essai[which(essai$MODEL ==   "TD") ,]$T, na.rm=TRUE)
##D  
##D ## Result for each models for the first subject
##D  essai[which(essai$ID == 1) ,]
##D  max(essai[which(essai$ID == 1) ,]$LL)
##D 
##D ## Difference between the estimated values with the T and TSCD models for the
##D ## first subject
##D  essai[which(essai$ID == 1 & essai$MODEL == "T"),]$T
##D        - essai[which(essai$ID == 1 & essai$MODEL == "TSCD"),]$T
## End(Not run)




library(irtProb)


### Name: modelShowClassFunctions
### Title: Functions To Manipulate modelShow Class Objects
### Aliases: is.modelShow Round Round.modelShow summary.modelShow
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
##D  theta     <- seq(-2,-2,length=nSubjects)
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
##D ## Is essai of class modelShow?
##D  is.modelShow(essai)
##D  
##D ## Rounding to 2 decimals the first 5 results of essai
##D  Round(essai[1:5,], 2)
##D 
##D ## Means for each models rounded to 3 decimals
##D  summary(essai, report="means", statistics=c("LL","AIC","BIC","T","SeT"), digits=3)
##D 
##D ## Model choosen for each of the first 5 subjects
##D ## and the frequency of these choices with the BIC criteria
##D  summary(essai[which(essai$ID == (1:5)),], report="choose", criteria="BIC")
##D 
##D ## Frequency of the models choosen for all the subjects
##D ## with the LL, AIC and BIC criteria
##D ## Generally, BIC chooses the less models AIC the more.
##D  summary(essai, report="table", criteria="LL")
##D  summary(essai, report="table", criteria="AIC")
##D  summary(essai, report="table", criteria="BIC")
##D  
##D ## Frequency of the models choosen for all the subjects
##D ## with the BIC criteria, but with a histogram
##D  summary(essai, report="histogram", criteria="BIC", color="blue")
##D 
##D ## The choosen model is added to the essai modelShow object for all the subjects
##D ## with the LL, AIC and BIC criteria and statistics about theta are computed
##D ## Recall thet rhe generating theta was fixed at -2.00
##D ## The LL criteria seems the best one her according to bias and standard error
##D  resultLL  <- summary(essai, report="add", criteria="LL")
##D  resultAIC <- summary(essai, report="add", criteria="AIC")
##D  resultBIC <- summary(essai, report="add", criteria="BIC")
##D  # LL
##D  summary(resultLL[which(resultLL$critLL == TRUE),]$T)
##D  sd(resultLL[which(resultLL$critLL == TRUE),]$T, na.rm=TRUE)
##D  # AIC
##D  summary(resultAIC[which(resultAIC$critAIC == TRUE),]$T)
##D  sd(resultAIC[which(resultAIC$critAIC == TRUE),]$T, na.rm=TRUE)
##D  # BIC
##D  summary(resultBIC[which(resultBIC$critBIC == TRUE),]$T)
##D  sd(resultBIC[which(resultBIC$critBIC == TRUE),]$T, na.rm=TRUE)
##D  
## End(Not run)
 



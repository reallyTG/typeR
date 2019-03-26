library(irtProb)


### Name: m4plSummary
### Title: Summary of the Results of Estimation with the m4pl Models
### Aliases: m4plSummary m4plMoreSummary m4plNoMoreSummary
### Keywords: distribution

### ** Examples


## GENERATION OF VECTORS OF RESPONSE
 # NOTE THE USUAL PARAMETRIZATION OF THE ITEM DISCRIMINATION,
 # THE VALUE OF THE PERSONNAL FLUCTUATION FIXED AT 0,
 # AND THE VALUE OF THE PERSONNAL PSEUDO-GUESSING FIXED AT 0.30.
 # IT COULD BE TYPICAL OF PLAGIARISM BEHAVIOR.
 nSubjects <- 1
 nItems <- 40
 a      <- rep(1.702,nItems); b <- seq(-5,5,length=nItems)
 c      <- rep(0,nItems); d <- rep(1,nItems)
 theta     <- seq(-2,-2,length=nSubjects)
 S         <- runif(n=nSubjects,min=0.0,max=0.0)
 C         <- runif(n=nSubjects,min=0.3,max=0.3)
 D         <- runif(n=nSubjects,min=0.0,max=0.0)
 rep <- 100
 set.seed(seed = 10)
 X         <- ggrm4pl(n=nItems, rep=rep,
                      theta=theta, S=S, C=C, D=D,
                      s=1/a, b=b,c=c,d=d)

## Estimation of the model integrating the T and the C parameters
 model <- "C"
 test  <- m4plPersonParameters(x=X, b=b, s=1/a, c=c, d=d, m=0, model=model,
                               prior="uniform", more=TRUE)

## Summary of the preceding model (report and first 5 subjects)
 essai <- m4plSummary(X=test, out="report")
 # Rounding the result of the list to two decimals
 lapply(essai, round, 2)
 essai <- m4plSummary(X=test, out="result")[1:5,]
 lapply(essai, round, 2)
 essai <- m4plSummary(X=test, out="report", thetaInitial=theta)
 lapply(essai, round, 2)
 essai <- m4plSummary(X=test, out="result", thetaInitial=theta)[1:5,]
 lapply(essai, round, 2)

## Results directly from m4plMoreSummary()
 essai <- m4plMoreSummary(x=test, out="report")
 lapply(essai, round, 2)
 essai <- m4plMoreSummary(x=test, out="result")[1:5,]
 round(essai, 2)

## To obtain more general statistics on the result report
 essai <- m4plMoreSummary(x=test, out="result")
 m4plNoMoreSummary(essai)
 summary(m4plMoreSummary(x=test, out="result"))




library(cfa)


### Name: fCFA
### Title: Stepwise CFA approaches
### Aliases: fCFA kvCFA print.fCFA print.kvCFA summary.fCFA summary.kvCFA
### Keywords: models

### ** Examples


#Functional CFA for a internet terminal usage data set by Wurzer 
#(An application of configural frequency analysis: Evaluation of the
#usage of internet terminals, 2005, p.82)
dd <- data.frame(a1=gl(3,4),b1=gl(2,2,12),c1=gl(2,1,12))
X <- model.matrix(~a1+b1+c1,dd,contrasts=list(a1="contr.sum",b1="contr.sum",
    c1="contr.sum"))
ofreq <- c(121,13,44,37,158,69,100,79,24,0,26,3)
tabdim <- c(3,2,2)

res1 <- fCFA(ofreq, X, tabdim=tabdim)
res1
summary(res1)


# Kieser-Vector CFA for Children's temperament data from 
# von Eye  (Configural Frequency Analysis, 2002, p. 192) 
dd <- data.frame(a1=gl(3,9),b1=gl(3,3,27),c1=gl(3,1,27))
X <- model.matrix(~a1+b1+c1,dd,contrasts=list(a1="contr.sum",
    b1="contr.sum",c1="contr.sum"))
ofreq <- c(3,2,4,23,23,6,39,33,9,11,29,13,19,36,19,21,26,18,13,30,
         41,12,14,23,8,6,7)
tabdim <- c(3,3,3)

res2 <- kvCFA(ofreq, X, tabdim=tabdim)
res2
summary(res2)




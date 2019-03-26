library(imprProbEst)


### Name: ArgMinDist
### Title: A Minimum Distance Estimation
### Aliases: ArgMinDist
### Keywords: nonparametric

### ** Examples

f1 <- function(v){ ifelse( abs(v-1)<1e-10 ,1,0) }
f2 <- function(v){ ifelse( abs(v-2)<1e-10 ,1,0) }
f3 <- function(v){ ifelse( abs(v-3)<1e-10 ,1,0) }
f4 <- function(v){ 1-ifelse( abs(v-3)<1e-10 ,1,0) }

x <- matrix(c(1,2,3,4),nrow=1)

UpperPrevisions1 <- c(1/4-0.03,1/4-0.03,1/4+0.01,1)
ListOfFunctions1 <- list(f1,f2,f3,f4)
CohUpPrev1 <- list(ListOfFunctions1,UpperPrevisions1)

UpperPrevisions2 <- c(1/4-0.04,1/4+0.04,1/4-0.01)
ListOfFunctions2 <- list(f1,f2,f3)
CohUpPrev2 <- list(ListOfFunctions2,UpperPrevisions2)

ImpreciseModel <- list(CohUpPrev1,CohUpPrev2)

lbomega <- 1
ubomega <- 4
epsilon <- 0.01

ArgMinDist(x,lbomega,ubomega,epsilon,ImpreciseModel)




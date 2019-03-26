library(stepp)


### Name: stepp.KM
### Title: The constructor to create the stmodelKM object
### Aliases: stepp.KM
### Keywords: ~kwd1 ~kwd2

### ** Examples

#GENERATE TREATMENT VARIABLE:
N <- 1000
Txassign <- sample(c(1,2), N, replace=TRUE, prob=c(1/2, 1/2))
n1 <- length(Txassign[Txassign==1])
n2 <- N - n1
#GENERATE A COVARIATE:
covariate <- rnorm(N, 55, 7)
#GENERATE SURVIVAL AND CENSORING VARIABLES ASSUMING A TREATMENT COVARIATE INTERACTION:
Entry <- sort( runif(N, 0, 5) )
SurvT1 <- .5
beta0 <-  -65 / 75
beta1 <- 2 / 75
Surv <- rep(0, N)
lambda1 <- -log(SurvT1) / 4
Surv[Txassign==1] <- rexp(n1, lambda1)
Surv[Txassign==2] <- rexp(n2, (lambda1*(beta0+beta1*covariate[Txassign==2])))
EventTimes <- rep(0, N)
EventTimes <- Entry + Surv
censor <- rep(0, N)
time <- rep(0,N)
for ( i in 1:N )
   {
     censor[i] <- ifelse( EventTimes[i] <= 7, 1, 0 )
     time[i] <- ifelse( EventTimes[i] < 7, Surv[i], 7 - Entry[i] ) 
   }

modKM <- stepp.KM( coltrt=Txassign, survTime=time, censor=censor, trts=c(1,2), timePoint=4)





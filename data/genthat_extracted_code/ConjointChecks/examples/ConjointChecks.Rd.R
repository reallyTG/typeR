library(ConjointChecks)


### Name: ConjointChecks
### Title: Check Single and Double Cancellation in a sample of 3-matrices
### Aliases: ConjointChecks

### ** Examples

######################################################
#parole data
#page 244 (table 2) of Perline, Wright, and Wainer
#about 9% were bad in perline
matrix(c(15,47,61,84,82,86,60,47,8),9,9,byrow=FALSE)->N
per <-structure(c(0, 0.06, 0.07, 0.18, 0.13, 0.13, 0.17, 0.17,
 1, 0, 0.04, 0.15, 0.24, 0.33, 0.28, 0.47, 0.85, 1, 0, 0.04, 0.08,
 0.12, 0.3, 0.64, 0.85, 1, 1, 0, 0.19, 0.39, 0.4, 0.51, 0.58,
 0.82, 0.98, 1, 0, 0.06, 0.18, 0.52, 0.73, 0.95, 1, 1, 1, 0,
 0.23, 0.33, 0.51, 0.68, 0.91, 0.93, 1, 1, 0.27, 0.51, 0.61,
 0.64, 0.68, 0.77, 0.9, 1, 1, 0, 0.21, 0.52, 0.68, 0.84, 0.97,
 0.97, 1, 1, 0.73, 0.64, 0.67, 0.7, 0.78, 0.78, 0.9, 1, 1),
 .Dim = c(9L, 9L) )
round(per*N)->n
ConjointChecks(N,n,n.3mat=1)->out

######################################################
#Data from Rasch (1960) data
#page 250 (table 5) of Perline, Wright, and Wainer
#about 4% showed violations
matrix(c(49,112,32,76,82,102,119,133,123,94,61,17,10),13,7,byrow=FALSE)->N
per <-structure(c(0, 0, 0, 0, 0.02, 0.01, 0.02, 0.03, 0.06, 0.09,
 0.23, 0.35, 0.7, 0.01, 0, 0.04, 0.05, 0.09, 0.09, 0.16, 0.28, 0.39,
 0.66, 0.8, 0.91, 0.85, 0, 0.02, 0.07, 0.07, 0.24, 0.28, 0.45, 0.59,
 0.76, 0.87, 0.9, 1, 0.85, 0.01, 0.04, 0.12, 0.21, 0.42, 0.62, 0.73,
 0.83, 0.9, 0.93, 0.98, 1, 1, 0.06, 0.11, 0.4, 0.7, 0.7, 0.79, 0.84,
 0.88, 0.94, 0.95, 0.98, 1, 1, 0.48, 0.84, 0.84, 0.86, 0.86, 0.9,
 0.95, 0.96, 0.98, 0.99, 0.99, 1, 1, 0.92, 0.98, 0.98, 0.99, 0.98,
 0.99, 0.99, 1, 1, 1, 1, 1, 1), .Dim = c(13L, 7L))
round(per*N)->n
ConjointChecks(N,n,n.3mat=1)->out

###########
#simulated rasch example
n.3mat<-5000
n.items<-20
n.respondents<-2000
#simulate data
rnorm(n.items)->diff
rnorm(n.respondents)->abil
matrix(abil,n.respondents,n.items,byrow=FALSE)->m1
matrix(diff,n.respondents,n.items,byrow=TRUE)->m2
m1-m2 -> kern
exp(kern)/(1+exp(kern))->pv
runif(n.items*n.respondents)->test
ifelse(pv>test,1,0)->resp
##now check
PrepareChecks(resp)->tmp
#not run
#detectCores()->n.workers
#ConjointChecks(tmp$N,tmp$n,n.3mat=5000,
#  par.options=list(n.workers=n.workers,type="PSOCK"))->rasch5000




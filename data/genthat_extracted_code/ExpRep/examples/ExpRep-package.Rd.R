library(ExpRep)


### Name: ExpRep-package
### Title: Experiment Repetitions
### Aliases: ExpRep-package ExpRep

### ** Examples

ProbL<-Local_Theorem(n=100,m=50,p=0.02)
ProbL

ProbI<-Integral_Theorem(n=100,p=0.5,linf=0,lsup=50)
ProbI

ProbP<-Poisson_Theorem(n=100,m=50,p=0.002)
ProbP

beta<-ApplicIntegralTheo(Applic="beta",n=369,p=0.4,alpha=0.05) 
beta

alpha<-ApplicIntegralTheo(Applic="alpha",n=369,p=0.4,beta=0.95) 
alpha

n<-ApplicIntegralTheo(Applic="n",p=0.4,alpha=0.05,beta=0.95) 
n

S_Local_Limit_Theorem(n = 170, p = 0.5, Compare = TRUE, Table = TRUE, Graph = TRUE, 
      GraphE = TRUE)

S_Poisson_Theorem(n = 169, p = 0.002, Compare = TRUE, Table = TRUE, Graph = TRUE, 
      GraphE = TRUE)

S_Integral_Theorem(n=100, p=0.5, linf = 0, lsup = 50, Compare = TRUE, Table = TRUE, 
      Graph = TRUE, GraphE = TRUE) 

Buffon(p = 0.5, width = 0.2, r = c(100, 500, 1000, 1500))




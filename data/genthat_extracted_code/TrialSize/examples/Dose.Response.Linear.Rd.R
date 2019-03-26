library(TrialSize)


### Name: Dose.Response.Linear
### Title: Linear Contrast Test for Dose Response Study
### Aliases: Dose.Response.Linear
### Keywords: ~kwd1 ~kwd2

### ** Examples


mui=c(0.05,0.12,0.14,0.16);
ci=c(-6,1,2,3);

Example.11.1<-Dose.Response.Linear(alpha=0.05,beta=0.2,sigma=0.22,mui=mui,ci=ci,fi=1/4)
Example.11.1
#178





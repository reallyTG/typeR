library(ATE)


### Name: Cressie and Read objective functions
### Title: Cressie and Read objective functions
### Aliases: 'Cressie and Read function' cr.rho d.cr.rho dd.cr.rho

### ** Examples

#Cressie-Read Family example
data("nsw")
Y<-nsw$re78[301:500]
X<-nsw[301:500,-c(1,9)]
treat<-nsw$treat[301:500]

#Exponential tilting
ATE(Y,treat,X,theta = 0)

#Empirical likelihood
ATE(Y,treat,X,theta = -1)

#Quadratic loss
ATE(Y,treat,X, theta = 1)




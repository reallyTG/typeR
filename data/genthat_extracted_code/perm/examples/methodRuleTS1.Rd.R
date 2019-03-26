library(perm)


### Name: methodRuleTS1
### Title: Rule for determining method for permTS
### Aliases: methodRuleTS1
### Keywords: misc

### ** Examples

N<-100
set.seed(1)
methodRuleTS1(x=sample(1:2,N,replace=TRUE),group=sample(c(0,1),N,replace=TRUE),exact=NULL)
N<-100
methodRuleTS1(sample(1:500,N,replace=TRUE),sample(c(0,1),N,replace=TRUE),TRUE)




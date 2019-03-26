library(hmmm)


### Name: hmmm.model
### Title: define a hmm model
### Aliases: hmmm.model
### Keywords: models

### ** Examples
data(madsen)
# 1 = Influence; 2 = Satisfaction;  3 = Contact; 4 = Housing 
names<-c("Inf","Sat","Co","Ho")
y<-getnames(madsen,st=6)

# hmm model -- marginal sets: {3,4} {1,3,4} {2,3,4} {1,2,3,4}
margi<-c("m-m-l-l","l-m-l-l","m-l-l-l","l-l-l-l")
marginals<-marg.list(margi,mflag="m")
model<-hmmm.model(marg=marginals,lev=c(3,3,2,4),names=names)
summary(model)

# hmm model with equality constraints
# independencies 1_||_4|3 and 2_||_3|4 impose equality constraints 
sel<-c(12:23,26:27,34:39) # positions of the zero-constrained interactions 
model_eq<-hmmm.model(marg=marginals,lev=c(3,3,2,4),sel=sel,names=names)
summary(model_eq)

# hmm model with inequality constraints
# the distribution of 1 given 4 is stochastically decreasing wrt the categories of 3;
# the distribution of 2 given 3 is stochastically decreasing wrt the categories of 4:
marg134ineq<-list(marg=c(1,3,4),int=list(c(1,3)),types=c("l","marg","l","l"))
marg234ineq<-list(marg=c(2,3,4),int=list(c(2,4)),types=c("marg","l","l","l"))
ineq<-list(marg134ineq,marg234ineq)
model_ineq<-hmmm.model(marg=marginals,lev=c(3,3,2,4),dismarg=ineq,D=diag(-1,8),names=names)
summary(model_ineq)
# The argument D is used to turn the 8 inequalities from 
# non-negative (default) into non-positive constraints



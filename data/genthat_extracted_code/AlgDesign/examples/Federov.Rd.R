library(AlgDesign)


### Name: optFederov
### Title: Optimal design
### Aliases: optFederov
### Keywords: design

### ** Examples


# EXAMPLE 1
# A quadratic polynomial in three variables. The resulting D will be about 0.46.
# This may be compared with a standard central composite design obtained from
# rows 1,3,5,7,9,11,13,15,17,19,21,23,25,27 of dat, which has a D value of 0.46.
# The central composite design seems to be the optimal design for all three criteria.

dat<-gen.factorial(levels=3,nVars=3,varNames=c("A","B","C"))

desD<-optFederov(~quad(A,B,C),dat,nTrials=14,eval=TRUE)
desA<-optFederov(~quad(.),dat,nTrials=14,eval=TRUE,crit="A")
desI<-optFederov(~quad(.),dat,nTrials=14,eval=TRUE,crit="I")

rows<-c(1,3,5,7,9,11,13,15,17,19,21,23,25,27)
desO<-optFederov(~quad(.),dat,nTrials=14,eval=TRUE,rows=rows)

# The I criterion may be seen to decrease as the space is expanded. 

levels<-seq(-1,1,by=.1)
dat<-expand.grid(list(A=levels,B=levels,C=levels))

desL<-optFederov(~quad(.),dat,nTrials=14,eval=TRUE)

# This is not the case for A or D. For A and D, the support points are the points 
# of the grid with the three levels above. Points not on this grid move
# the criteria in a non-optimal direction; hence, the enlarging space has no effect.

# EXAMPLES 2
# Standard designs are usually optimal designs. If nTrials is set to that for
# a standard design, and if nRepeats is large enough, the standard design will 
# often be found For example, a half replicate of a 2^4 will be obtained by the 
# following. 

dat<-gen.factorial(levels=2,nVars=3,varNames=c("A","B","C"))
desH<-optFederov(~.,dat,8)

# A third replicate of a 3^3 will be obtained by the following:

dat<-gen.factorial(levels=3,nVars=3,factor=1:3)
desT<-optFederov(~.,dat,9)

# An orthogonal design similar to a 12 run Plackett-Burman design can be 
# created by the following. 

dat<-gen.factorial(levels=2,nVars=11,varNames=c("A","B","C","D","E","F","G","H","J","K","L"))
desPB<-optFederov(~.,dat,12,nRepeats=20)

# The above calculation is numerically difficult for the A and I criteria, 
# and nRepeats=100 or more may be needed. 

# It is instructive to examine a case in which the standard design is not found.
# The following is an attempt to create a Latin square design. It is not always successful.

lv<-factor(1:5)
dat<-expand.grid(A=lv,B=lv,C=lv)
desL<-optFederov(~.,dat,nTrials=25,nRep=100)

# It may be summarized as follows.

cs<-xtabs(~.,desL$design)
{xx<-matrix(0,5,5); for (i in 1:5) xx=xx+cs[1:5,1:5,i]*i;xx}
 


# EXAMPLE 3
# Mixture variables have a constant sum, usually 1. This causes a linear dependency
# among terms of polynomial models. In particular the constant term is dependent.
# Squared terms in a quadratic model are confounded with interaction terms, so that
# a quadratic model for three mixture variables is ~0+(A+B+C)^2. The following
# calculation generates a set of candidate varibles using gen.mixture() with
# four values on each axis, and then creates a 15 run design. The design is optimal.
# Indeed, the candidate set produced by gen.mixture(2,5) is optimal. Note: 
# nullify=TRUE is used to ensure that this example will run withough error. The
# default value of 5 for nRepeats is sometimes not enought to find a starting
# design with a mixture problem.


dat<-gen.mixture(4,5)
desM<-optFederov(~(X1+X2+X3+X4+X5)^2-1,dat,15,nullify=TRUE)

# EXAMPLES 4
# Design augmenation can be obtained by setting augment=TRUE, and placing the row numbers
# of the design to be agmented in rows. Augmentation is often used to (1) add a new variable
# to an existing design or (2) to increase the complexity of the model. The following illustrates
# adding a variable to an existing design using desD above. It is assumed that all runs of the
# existing design have been made at the -1 level of the new variable:

dat<-gen.factorial(levels=3,nVars=3,varNames=c("A","B","C"))
desA<-optFederov(~quad(.),dat,nTrials=25,augment=TRUE,rows=desD$rows)

# The half fraction in desH, can be augmented to support an additional term:

dat<-gen.factorial(levels=2,nVars=4,varNames=c("A","B","C","D"))
desH<-optFederov(~.,dat,8)
desH2<-optFederov(~A+B+C+D+I(A*B),dat,10,aug=TRUE,rows=desH$rows)

# EXAMPLES 5
# Optimal approximate theory designs have non-zero probabilities only on support points.
# For the first example above the approximate theory design is as follows. It shows
# that all points in the cubic lattice are support points. The D for this 
# design is 0.474 which may be compared with the D of 0.463 of the first example to
# indicate that that exact design had a D-efficiency of 97%. The lower bound Dea
# was 82%.

dat<-gen.factorial(levels=3,nVars=3,varNames=c("A","B","C")) 
desDA<-optFederov(~quad(A,B,C),dat,eval=TRUE,approx=TRUE)

# The largest proportions will be rounded if nTrials is specified.

desDAN<-optFederov(~quad(A,B,C),dat,eval=TRUE,approx=TRUE,nTrials=15)




library(kappalab)


### Name: ls.sorting.treatment
### Title: Least squares capacity identification in the framework of a
###   sorting procedure: evaluation of the determined capacity
### Aliases: ls.sorting.treatment
### Keywords: math

### ** Examples


## generate a random problem with 10 prototypes and 4 criteria
n.proto <- 10 ## prototypes
n <- 4  ## criteria
P <- matrix(runif(n.proto*n,0,1),n.proto,n)

## the corresponding global scores, based on a randomly generated
## capacity a
glob.eval <- numeric(n.proto)
a <- capacity(c(0:(2^n-3),(2^n-3),(2^n-3))/(2^n-3))
for (i in 1:n.proto)
  glob.eval[i] <- Choquet.integral(a,P[i,])

## based on these global scores, let us create a classification (3 classes)
cl.proto<-numeric(n.proto)
cl.proto[glob.eval <= 0.33] <- 1
cl.proto[glob.eval > 0.33 & glob.eval<=0.66] <-2
cl.proto[glob.eval > 0.66] <- 3

## search for a capacity which satisfies the constraints
lsc <- ls.sorting.capa.ident(n ,4, P, cl.proto, 0.1)

## output of the QP
lsc$how

## analyse the quality of the model (classify the prototypes by the
## model and compare both assignments)
lst <- ls.sorting.treatment(P,cl.proto,lsc$solution,P,cl.proto)

## assignments of the prototypes
lst$class.A
## assignment types
lst$correct.A
## evaluation
lst$eval.correct

## generate a second set of random alternatives (A)
## their "correct" class is determined as beforehand with the
## randomly generated capacity a
## the goal is to see if we can reproduce this classification
## by the capacity learnt from the prototypes

## a randomly generated criteria matrix of 10 alternatives
A <- matrix(runif(10*n,0,1),10,n)
cl.orig.A <-numeric(10)
	
## the corresponding global scores
glob.eval.A <- numeric(10)
for (i in 1:10)
  glob.eval.A[i] <- Choquet.integral(a,A[i,])

## based on these global scores, let us determine a classification
cl.orig.A[glob.eval.A <= 0.33] <- 1
cl.orig.A[glob.eval.A>0.33 & glob.eval.A<=0.66] <-2
cl.orig.A[glob.eval.A > 0.66] <- 3

## let us now classify the alternatives of A according to the model
## built on P

lst <- ls.sorting.treatment(P,cl.proto,lsc$solution,A,cl.orig.A)

## assignment of the alternatives of A
lst$class.A
## type of assignments
lst$correct.A
## evaluation
lst$eval.correct

## show the learnt capacity
## x11()
## barplot(Shapley.value(lsc$solution), main="Learnt capacity", sub="Shapley")
## summary of the learnt capacity
lsc$solution
summary(lsc$solution)





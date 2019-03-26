library(sensitivityfull)


### Name: mscoref
### Title: Computes M-scores for a Full Match
### Aliases: mscoref

### ** Examples

# The artificial example that follows has I=9
# matched sets.  The first 3 sets have one treated
# individual and two controls with treated subjects
# in column 1.  The next 3 sets are
# matched pairs, with treated subjects in column 1.
# The next 3 sets have one control and two treated
# subjects, with the control in column 1.  Simulated
# from a Normal distribution with an additive effect
# of tau=1.

y<-c(2.2, 1.4, 1.6, 2.4, 0.7, 1.3, 1.2, 0.6, 0.3,
0.5, -0.1, -1.3, -0.3, 0.1, 0.4, 3.0, 1.1, 1.4, -0.8,
0.1, 0.8, NA, NA, NA, 1.1, 0.5, 1.8)
y<-matrix(y,9,3)
treated1<-c(rep(TRUE,6),rep(FALSE,3))

mscoref(y,treated1) # Huber scores
mscoref(y,treated1,inner=0.5,trim=3) #inner trimmed scores
mscoref(y,treated1,qu=.9,trim=1) #trimming the outer 10 percent

# For an additional example, install and load package sensitivitymv
# The following example is a match with variable controls.
# Both mscorev() (in sensitivitymv) and mscoref() (in sensitivityfull)
# reproduce the example in Rosenbaum (2007, Table 3).
# data(tbmetaphase)
# mscorev(tbmetaphase,trim=1)
# mscoref(tbmetaphase,rep(TRUE,15),trim=1)





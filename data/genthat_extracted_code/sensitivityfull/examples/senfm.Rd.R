library(sensitivityfull)


### Name: senfm
### Title: Sensitivity Analysis for a Full Match in an Observational Study.
### Aliases: senfm
### Keywords: htest robust

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

#Randomization test of no effect, Huber scores:
senfm(y,treated1)

#Sensitivity analysis, Huber scores:
senfm(y,treated1,gamma=2)

#Randomization test of tau=1 vs tau>1
senfm(y,treated1,tau=1)

#Randomization test of tau=1 vs tau<1
senfm(y,treated1,tau=1,alternative="less")

#Same randomization test of tau=1 vs tau<1
senfm(-y,treated1,tau=-1)

#Sensitivity analysis testing tau=1 at gamma=2
senfm(y,treated1,tau=1,gamma=2,alternative="greater")
senfm(y,treated1,tau=1,gamma=2,alternative="less")

# For an additional example, install and load package sensitivitymv
# The following example is a match with variable controls.
# So this example has one treated subject per matched set.
# Both mscorev (in sensitivitymv) and mscoref (in sensitivityfull)
# reproduce parts of the example in Rosenbaum (2007, Section 4).
# data(tbmetaphase)
# senmv(tbmetaphase,gamma=2,trim=1)
# senfm(tbmetaphase,rep(TRUE,15),gamma=2,trim=1)
# senmv(tbmetaphase,gamma=2,trim=1,tau=0.94)
# senfm(tbmetaphase,rep(TRUE,15),gamma=2,trim=1,tau=.94)
# senmv(tbmetaphase,gamma=2,trim=1,tau=0.945)
# senfm(tbmetaphase,rep(TRUE,15),gamma=2,trim=1,tau=.945)
# mscoref(tbmetaphase,rep(TRUE,15),trim=1)




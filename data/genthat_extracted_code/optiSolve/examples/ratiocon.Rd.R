library(optiSolve)


### Name: ratiocon
### Title: Rational Constraint
### Aliases: ratiocon

### ** Examples


### Constrained optimization with rational objective                  ### 
### function and linear and quadratic constraints                     ###
### Example from animal breeding                                      ###
### The mean kinship at native alleles in the offspring is minimized  ###
### The mean breeding value and the mean kinship are constrained      ###

data(phenotype)
data(myQ)
data(myQ1)
data(myQ2)

A <- t(model.matrix(~Sex+BV+MC-1, data=phenotype))
A[,1:5]
val <- c(0.5,  0.5,  0.4,  0.5 )
dir <- c("==", "==", ">=", "<=")

mycop <- cop(f  = quadfun(Q=myQ, d=0.001, name="Kinship", id=rownames(myQ)),
             lb = lbcon(0,  id=phenotype$Indiv), 
             ub = ubcon(NA, id=phenotype$Indiv),
             lc = lincon(A=A, dir=dir, val=val, id=phenotype$Indiv),
             rc = ratiocon(Q1=myQ1, Q2=myQ2, d1=0.0004, d2=0.00025, val=0.040, 
                           id=rownames(myQ1), name="nativeKinship")
             )

res <- solvecop(mycop, solver="slsqp", quiet=FALSE)

validate(mycop, res)

#            valid solver                status
#             TRUE  slsqp successful completion
#
#   Variable      Value      Bound    OK?
#   --------------------------------------
#   Kinship       0.0324 min        :      
#   --------------------------------------
#   lower bounds  all x  >=  lb     : TRUE 
#   Sexfemale     0.5    ==  0.5    : TRUE 
#   Sexmale       0.5    ==  0.5    : TRUE 
#   BV            0.4    >=  0.4    : TRUE 
#   MC            0.4668 <=  0.5    : TRUE 
#   nativeKinship 0.04   <=  0.04   : TRUE 
#   --------------------------------------





library(optiSolve)


### Name: quadfun
### Title: Quadratic Objective Function
### Aliases: quadfun

### ** Examples


### Quadratic programming with linear constraints       ###
### Example from animal breeding                        ###
### The mean kinship in the offspring x'Qx+d is minized ###
### and the mean breeding value is restricted.          ###

data(phenotype)
data(myQ)

A   <- t(model.matrix(~Sex+BV-1, data=phenotype))
A[,1:5]
val <- c(0.5, 0.5, 0.40)
dir <- c("==","==",">=")

mycop <- cop(f  = quadfun(Q=myQ, d=0.001, name="Kinship", id=rownames(myQ)), 
             lb = lbcon(0,  id=phenotype$Indiv), 
             ub = ubcon(NA, id=phenotype$Indiv),
             lc = lincon(A=A, dir=dir, val=val, id=phenotype$Indiv))

res <- solvecop(mycop, solver="cccp", quiet=FALSE)

validate(mycop, res)

#            valid solver  status
#             TRUE   cccp optimal
#
#   Variable     Value      Bound    OK?
#   -------------------------------------
#   Kinship      0.0322 min        :      
#   -------------------------------------
#   lower bounds all x  >=  lb     : TRUE 
#   Sexfemale    0.5    ==  0.5    : TRUE 
#   Sexmale      0.5    ==  0.5    : TRUE 
#   BV           0.4    >=  0.4    : TRUE 
#   -------------------------------------




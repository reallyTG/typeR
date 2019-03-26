library(optiSolve)


### Name: quadcon
### Title: Quadratic Constraint
### Aliases: quadcon

### ** Examples


### Linear programming with linear and quadratic constraints ###
### Example from animal breeding                             ###
### The mean breeding value BV is maximized whereas the      ###
### mean kinship in the offspring x'Qx+d is restricted       ###

data(phenotype)
data(myQ)

A   <- t(model.matrix(~Sex-1, data=phenotype))
A[,1:5]
val <- c(0.5, 0.5)
dir <- c("==","==")

mycop <- cop(f  = linfun(a=phenotype$BV, id=phenotype$Indiv, name="BV"),
             max= TRUE,
             lb = lbcon(0,  id=phenotype$Indiv), 
             ub = ubcon(NA, id=phenotype$Indiv),
             lc = lincon(A=A, dir=dir, val=val, id=phenotype$Indiv),
             qc = quadcon(Q=myQ, d=0.001, val=0.035, name="Kinship", id=rownames(myQ)))

res <- solvecop(mycop, solver="cccp2", quiet=FALSE)

validate(mycop, res)

#            valid solver  status
#             TRUE  cccp2 optimal
#
#   Variable     Value      Bound    OK?
#   -------------------------------------
#   BV           0.7667 max        :      
#   -------------------------------------
#   lower bounds all x  >=  lb     : TRUE 
#   Sexfemale    0.5    ==  0.5    : TRUE 
#   Sexmale      0.5    ==  0.5    : TRUE 
#   Kinship      0.035  <=  0.035  : TRUE 
#   -------------------------------------





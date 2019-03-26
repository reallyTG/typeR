library(optiSolve)


### Name: ratiofun
### Title: Rational Objective Function
### Aliases: ratiofun

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

Ax <- t(model.matrix(~Sex+BV+MC-1, data=phenotype))
Ax[,1:5]
val <- c(0.5,  0.5,  0.4,  0.5 )
dir <- c("==", "==", ">=", "<=")

mycop <- cop(f  = ratiofun(Q1=myQ1, Q2=myQ2, d1=0.0004, d2=0.00025, 
                           id=rownames(myQ1), name="nativeKinship"),
             lb = lbcon(0,  id=phenotype$Indiv), 
             ub = ubcon(NA, id=phenotype$Indiv),
             lc = lincon(A=Ax, dir=dir, val=val, id=phenotype$Indiv),
             qc = quadcon(Q=myQ, d=0.001, val=0.035, 
                          name="Kinship", id=rownames(myQ)))

res <- solvecop(mycop, quiet=FALSE)

validate(mycop, res)

#            valid solver                status
#             TRUE  slsqp successful completion
#
#   Variable      Value      Bound    OK?
#   --------------------------------------
#   nativeKinship 0.0366 min        :      
#   --------------------------------------
#   lower bounds  all x  >=  lb     : TRUE 
#   Sexfemale     0.5    ==  0.5    : TRUE 
#   Sexmale       0.5    ==  0.5    : TRUE 
#   BV            0.4    >=  0.4    : TRUE 
#   MC            0.4963 <=  0.5    : TRUE 
#   Kinship       0.035  <=  0.035  : TRUE 
#   --------------------------------------





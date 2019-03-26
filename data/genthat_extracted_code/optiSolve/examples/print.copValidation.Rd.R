library(optiSolve)


### Name: print.copValidation
### Title: Print Validation of a Solution
### Aliases: print.copValidation print

### ** Examples


### Quadratic programming with linear constraints      ###
### Example from animal breeding                       ###
### where the mean kinship in the offspring is minized ###

data(phenotype)
data(myQ)

A   <- t(model.matrix(~Sex+BV-1, data=phenotype))
rownames(A) <- c("male.cont","female.cont", "Breeding.Value")
val <- c(0.5, 0.5, 0.40)
dir <- c("==","==",">=")

mycop <- cop(f  = quadfun(Q=myQ, d=0.001, name="Kinship", id=rownames(myQ)), 
             lb = lbcon(0,  id=phenotype$Indiv), 
             ub = ubcon(NA, id=phenotype$Indiv),
             lc = lincon(A=A, dir=dir, val=val, id=phenotype$Indiv))

res <- solvecop(mycop, solver="cccp", quiet=FALSE, trace=FALSE)

head(res$x)

Evaluation <- validate(mycop, res, quiet=TRUE)

print(Evaluation)

#            valid solver  status
#             TRUE   cccp optimal
#
#   Variable       Value      Bound    OK?
#   ---------------------------------------
#   Kinship        0.0322 min        :      
#   ---------------------------------------
#   lower bounds   all x  >=  lb     : TRUE 
#   male.cont      0.5    ==  0.5    : TRUE 
#   female.cont    0.5    ==  0.5    : TRUE 
#   Breeding.Value 0.4    >=  0.4    : TRUE 
#   ---------------------------------------





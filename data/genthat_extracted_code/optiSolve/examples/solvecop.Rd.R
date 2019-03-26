library(optiSolve)


### Name: solvecop
### Title: Solve a Constrained Optimization Problem
### Aliases: solvecop

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

hist(res$x,breaks=50,xlim=c(0,0.5))

Evaluation <- validate(mycop, res)

Evaluation$summary

Evaluation$info

Evaluation$obj.fun

Evaluation$var

Evaluation$var$Breeding.Value





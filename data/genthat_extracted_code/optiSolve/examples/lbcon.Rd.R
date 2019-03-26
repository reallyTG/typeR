library(optiSolve)


### Name: lbcon
### Title: Lower Bounds
### Aliases: lbcon

### ** Examples


### Linear programming with linear and quadratic constraints ###
### Example from animal breeding                             ###
### The mean breeding value BV is maximized whereas the      ###
### mean kinship in the offspring x'Qx+d is restricted       ###
### Lower and upper bounds for females are identical, so     ###
### their contributions are not optimized.                   ###
### Lower and upper bounds for some males are defined.       ###

data(phenotype)
data(myQ)

A   <- t(model.matrix(~Sex-1, data=phenotype))
A[,1:5]
val <- c(0.5,  0.5)
dir <- c("==","==")
Nf  <- sum(phenotype$Sex=="female")
id  <- phenotype$Indiv

lbval <- setNames(rep(0,  length(id)), id)
ubval <- setNames(rep(NA, length(id)), id)
lbval[phenotype$Sex=="female"] <- 1/(2*Nf)
ubval[phenotype$Sex=="female"] <- 1/(2*Nf)
lbval["276000102379430"] <- 0.02
ubval["276000121507437"] <- 0.03

mycop <- cop(f  = linfun(a=phenotype$BV, id=id, name="BV"),
             max= TRUE,
             lb = lbcon(lbval, id=id), 
             ub = ubcon(ubval, id=id),
             lc = lincon(A=A, dir=dir, val=val, id=id),
             qc = quadcon(Q=myQ, d=0.001, val=0.045, 
                          name="Kinship", id=rownames(myQ)))

res <- solvecop(mycop, solver="cccp2", quiet=FALSE)

Evaluation <- validate(mycop, res)

#            valid solver  status
#             TRUE  cccp2 optimal
#
#   Variable     Value      Bound    OK?
#   -------------------------------------
#   BV           0.5501 max        :      
#   -------------------------------------
#   lower bounds all x  >=  lb     : TRUE 
#   upper bounds all x  <=  ub     : TRUE 
#   Sexfemale    0.5    ==  0.5    : TRUE 
#   Sexmale      0.5    ==  0.5    : TRUE 
#   Kinship      0.045  <=  0.045  : TRUE 
#   -------------------------------------

res$x["276000102379430"]

res$x["276000121507437"]





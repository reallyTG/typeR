library(TAM)


### Name: tamaanify
### Title: Function for Parsing 'TAM' Input
### Aliases: tamaanify
### Keywords: Model specification TAM language

### ** Examples

#############################################################################
# EXAMPLE 1: Examples dichotomous data data.read
#############################################################################

library(sirt)
data(data.read,package="sirt")
dat <- data.read

#*********************************************************************
#*** Model 1: 2PL estimation with some fixed parameters and
#             equality constraints
tammodel <- "
LAVAAN MODEL:
  F2=~ C1__C2 + 1.3*C3 + C4
  F1=~ A1__B1
  # fixed loading of 1.4 for item B2
  F1=~ 1.4*B2
  F1=~ B3
  F1 ~~ F1
  F2 ~~ F2
  F1 ~~ F2
  B1 | 1.23*t1 ; A3 | 0.679*t1
  A2 | a*t1 ; C2 | a*t1 ; C4 | a*t1
  C3 | x1*t1 ; C1 | x1*t1
ITEM TYPE:
  A1__A3 (Rasch) ;
  A4 (2PL) ;
  B1__C4 (Rasch) ;
    "
# process model
out <- TAM::tamaanify( tammodel, resp=dat)
# inspect some output
out$method          # used TAM function
out$lavpartable     # lavaan parameter table

#*********************************************************************
#*** Model 2: Latent class analysis with three classes
tammodel <- "
ANALYSIS:
  TYPE=LCA;
  NCLASSES(3);   # 3 classes
  NSTARTS(5,20); # 5 random starts with 20 iterations
LAVAAN MODEL:
  F=~ A1__C4
    "
# process syntax
out <- TAM::tamaanify( tammodel, resp=dat)
str(out$E)     # E design matrix for estimation with tam.mml.3pl function

## Not run: 
##D #*********************************************************************
##D #*** Model 3: Linear constraints for item intercepts and item loadings
##D tammodel <- "
##D LAVAAN MODEL:
##D   F=~ lam1__lam10*A1__C2
##D   F ~~ F
##D   A1 | a1*t1
##D   A2 | a2*t1
##D   A3 | a3*t1
##D   A4 | a4*t1
##D   B1 | b1*t1
##D   B2 | b2*t1
##D   B3 | b3*t1
##D   C1 | t1
##D MODEL CONSTRAINT:
##D   # defined parameters
##D   # only linear combinations are permitted
##D   b2==1.3*b1 + (-0.6)*b3
##D   a1==q1
##D   a2==q2 + t
##D   a3==q1 + 2*t
##D   a4==q2 + 3*t
##D   # linear constraints for loadings
##D   lam2==1.1*lam1
##D   lam3==0.9*lam1 + (-.1)*lam0
##D   lam8==lam0
##D   lam9==lam0
##D     "
##D # parse syntax
##D mod1 <- TAM::tamaanify( tammodel, resp=dat)
##D mod1$A          # design matrix A for intercepts
##D mod1$L[,1,]     # design matrix L for loadings
## End(Not run)

#############################################################################
# EXAMPLE 2: Examples polytomous data data.Students
#############################################################################

library(CDM)
data( data.Students, package="CDM")
dat <- data.Students[,3:13]

#*********************************************************************
#*** Model 1: Two-dimensional generalized partial credit model
tammodel <- "
LAVAAN MODEL:
  FA=~ act1__act5
  FS=~ sc1__sc4
  FA ~~ 1*FA
  FS ~~ 1*FS
  FA ~~ FS
  act1__act3 | t1
  sc2 | t2
    "
out <- TAM::tamaanify( tammodel, resp=dat)
out$A    # design matrix for item intercepts
out$Q    # loading matrix for items

#*********************************************************************
#*** Model 2: Linear constraints

# In the following syntax, linear equations for multiple constraints
# are arranged over multiple lines.
tammodel <- "
  LAVAAN MODEL:
    F=~ a1__a5*act1__act5
    F ~~ F
  MODEL CONSTRAINT:
      a1==delta +
                tau1
      a2==delta
      a3==delta + z1
      a4==1.1*delta +
              2*tau1
                + (-0.2)*z1
  "
# tamaanify model
res <- TAM::tamaanify( tammodel, dat )
res$MODELCONSTRAINT.dfr
res$modelconstraint.loading




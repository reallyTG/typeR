library(kappalab)


### Name: ls.sorting.capa.ident
### Title: Least squares capacity identification in the framework of a
###   sorting procedure
### Aliases: ls.sorting.capa.ident
### Keywords: math

### ** Examples


## generate a random problem with 10 prototypes and 4 criteria
n.proto <- 10 ## prototypes
n <- 4  ## criteria
k <- 4  
d <- 0.1
	
## generating random data for the prototypes
C <- matrix(runif(n.proto*n,0,1),n.proto,n)
cl <- numeric(n.proto)

## the corresponding global evaluations
glob.eval <- numeric(n.proto)
a <- capacity(c(0:(2^n-3),(2^n-3),(2^n-3))/(2^n-3))
for (i in 1:n.proto)
  glob.eval[i] <- Choquet.integral(a,C[i,])

## and the classes for the prototypes
cl[glob.eval <= 0.33] <- 1
cl[glob.eval > 0.33 & glob.eval <= 0.66] <-2
cl[glob.eval > 0.66] <- 3

cl

## Not run: 
##D # starting the calculations
##D # search for a capacity which satisfies the constraints
##D lsc <- ls.sorting.capa.ident(n ,k, C, cl, d)
##D 
##D ## output of the quadratic program (ipop, package kernlab)
##D lsc$how
##D 
##D ## the capacity satisfying the constraints
##D lsc$solution
##D summary(lsc$solution)
##D ## the global evaluations satisfying the constraints
##D lsc$glob.eval
## End(Not run)

## let us now add some constraints        

## a Shapley preorder constraint matrix
## Sh(1) > Sh(2)
## Sh(3) > Sh(4)
delta.S <-0.01
Asp <- rbind(c(1,2,delta.S), c(3,4,delta.S))

## a Shapley interval constraint matrix
## 0.1 <= Sh(1) <= 0.2 
Asi <- rbind(c(1,0.1,0.2))
        
## an interaction preorder constraint matrix
## such that I(12) > I(34)
delta.I <- 0.01
Aip <- rbind(c(1,2,3,4,delta.I))
        
## an interaction interval constraint matrix
## i.e. 0.2 <= I(12) <= 0.4 
## and 0 < I(34) <= 1
Aii <- rbind(c(1,2,0.2,0.4), c(3,4,delta.I,1))
        
## an inter-additive partition constraint
## criteria 1,2 and criteria 3,4 are independent 
Aiap <- c(1,1,2,2)


## starting the calculations
## search for a capacity which satisfies the constraints
lsc <- ls.sorting.capa.ident(n ,k, C, cl, d,
                                  A.Shapley.preorder = Asp,
                                  A.Shapley.interval = Asi,
                                  A.interaction.preorder = Aip,
                                  A.interaction.interval = Aii,
                                  A.inter.additive.partition = Aiap)

## output of ipop
lsc$how
## the capacity satisfying the constraints
lsc$solution
summary(lsc$solution)
## the global evaluations satisfying the constraints
lsc$glob.eval





library(fungible)


### Name: RnpdMAP
### Title: Generate Random NPD R matrices from a user-supplied population R
### Aliases: RnpdMAP
### Keywords: fungible

### ** Examples

library(MASS)

Nvar = 20
Nfac = 4
NSubj = 600
Seed = 123    

set.seed(Seed)

## Generate a vector of classical item difficulties
p <- runif(Nvar)

cat("\nClassical Item Difficulties:\n")

print(rbind(1:Nvar,round(p,2)) )

summary(p)


## Convert item difficulties to quantiles
b <- qnorm(p)


## fnc to compute root mean squared standard deviation
RMSD <- function(A, B){
  sqrt(mean( ( A[lower.tri(A, diag = FALSE)] - B[lower.tri(B, diag = FALSE)] )^2))
}


## Generate vector of eigenvalues with clear factor structure
  L <- eigGen(nDimensions = Nvar, 
            nMajorFactors = Nfac, 
            PrcntMajor = .60, 
            threshold  = .50)
          

## Generate a population R matrix with the eigenvalues in L
  Rpop <- rGivens(eigs = L)$R
  
## Generate continuous data that will reproduce Rpop (exactly)
  X <- mvrnorm(n = NSubj, mu = rep(0, Nvar), 
               Sigma = Rpop, empirical = TRUE)
               
if( any(colSums(X) == 0) ){
  stop("One or more variables have zero variance. Generate a new data set.")               
 }
 
## Cut X at thresholds given in b to produce binary data U
  U <- matrix(0, nrow(X), ncol(X))
  for(j in 1:Nvar){
    U[X[,j] <= b[j],j] <- 1
  }
  
## Compute tetrachoric correlations
  Rtet <- tetcor(U, Smooth = FALSE, PRINT = TRUE)$r
  # Calculate eigenvalues of tetrachoric R matrix
  Ltet <- eigen(Rtet)$values
  
  if(Ltet[Nvar] >= 0) stop("Rtet is P(S)D")
  
## Simulate NPD R matrix with minimum eigenvalue equal to 
  # min(Ltet)
  out <- RnpdMAP(Rpop, 
               Lp = Ltet[Nvar], 
               NNegEigs = Nvar/5,
               NSmoothPosEigs = Nvar/5, 
               NSubjects = 150, 
               NSamples = 1, 
               MaxIts = 15000, 
               PRINT = FALSE, 
               Seed = Seed) 

## RLp is a NPD pseudo R matrix with min eigenvalue = min(Ltet)
  RLp <- out[[1]]$Rnpd

## Calculate eigenvalues of simulated NPD R matrix (Rnpd)
  Lnpd <- eigen(RLp, only.values = TRUE)$values
  
## Scree plots for observed and simulated NPD R matrices.  
  ytop <- max(c(L,Lnpd,Ltet))
  pointSize = .8
  plot(1:Nvar, L, typ = "b", col = "darkgrey", lwd=3, 
       lty=1, 
       main = 
       "Eigenvalues of Rpop, Tet R, and Sim Tet R:
       \nSimulated vs Observed npd Tetrachoric R Matrices",
       ylim = c(-1, ytop),
       xlab = "Dimensions", 
       ylab = "Eigenvalues",
       cex = pointSize,cex.main = 1.2)
  points(1:Nvar, Lnpd, typ="b", 
         col = "red", lwd = 3, lty=2, cex=pointSize)
  points(1:Nvar, Ltet, typ="b", 
         col = "darkgreen", lwd = 3, lty = 3, cex= pointSize)
 
  legend("topright", 
         legend = c("eigs Rpop", "eigs Sim Rnpd", "eigs Emp Rnpd"), 
         col = c("darkgrey", "red","darkgreen"), 
         lty = c(1,2,3), 
         lwd = c(4,4,4), cex = 1.5)
  
  abline(h = 0, col = "grey", lty = 2, lwd = 4)
 
  cat("\nRMSD(Rpop, Rtet) = ", round(rmsd(Rpop, Rtet), 3))
  cat("\nRMSD(Rpop, RLp) = ",  round(rmsd(Rpop, RLp),  3))




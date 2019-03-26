library(fungible)


### Name: faAlign
### Title: Align the columns of two factor loading matrices
### Aliases: faAlign
### Keywords: fungible Statistics

### ** Examples

# This example demonstrates the computation of 
# non-parametric bootstrap confidence intervals
# for rotated factor loadings.


library(GPArotation)

data(HS9Var)

HS9 <- HS9Var[HS9Var$school == "Grant-White",7:15]

# Compute an R matrix for the HSVar9 Mental Abilities Data
R.HS9 <- cor(HS9)

varnames <- c( "vis.per", "cubes", 
            "lozenges", "paragraph.comp",
            "sentence.comp","word.mean",
            "speed.add", "speed.count.dots",
            "speed.discr")



# Extract and rotate a 3-factor solution
# via unweighted least squares factor extraction 
# and oblimin rotation. 

NFac <- 3
NVar <- 9
B <- 200      # Number of boostrap samples
NSubj <- nrow(HS9)

# Unrotated 3 factor uls solution 
 F3.uls <- fals(R = R.HS9, nfactors = NFac)
 
# Rotate via oblimin 
 F3.rot <- oblimin(F3.uls$loadings, 
                      gam = 0, 
                      normalize = FALSE)

 F3.loadings <- F3.rot$loadings
 F3.phi <- F3.rot$Phi
 
 # Reflect factors so that salient loadings are positive
 Dsgn <- diag(sign(colSums(F3.loadings^3)))
 F3.loadings <- F3.loadings %*% Dsgn
 F3.phi <- Dsgn %*% F3.phi %*% Dsgn
 
 rownames(F3.loadings) <- varnames
 colnames(F3.loadings) <- paste0("f", 1:3)
 colnames(F3.phi) <- rownames(F3.phi) <- paste0("f", 1:3)
 
 cat("\nOblimin rotated factor loadings for 9 Mental Abilities Variables")
 print( round(F3.loadings, 2))
 
 cat("\nFactor correlation matrix")
 print( round( F3.phi, 2))
 
  # Declare variables to hold bootstrap output
  Flist <- Philist <- as.list(rep(0, B))
  UniqueMatchVec <- rep(0, B)
  rows <- 1:NSubj
 
  # Analyze bootstrap samples and record results 
  for(i in 1:B){
    cat("\nWorking on sample ", i)
    set.seed(i)
    
    # Create bootstrap sanples
    bsRows <- sample(rows, NSubj, replace= TRUE)
    Fuls <- fals(R = cor(HS9[bsRows, ]), nfactors = NFac)
    # rotated loadings
    Fboot <- oblimin(Fuls$loadings,
                             gam = 0, 
                             normalize = FALSE)
    
    
    out <- faAlign(F1 = F3.loadings, 
                   F2 = Fboot$loadings, 
                   MatchMethod = "LS")
    
    Flist[[i]] <- out$F2 # aligned version of Fboot$loadings
    UniqueMatchVec[i] <- out$UniqueMatch
  }
  
  cat("\nNumber of Unique Matches: ", 
      100*round(mean(UniqueMatchVec),2),"%\n")

  
  #  Make a 3D array from list of matrices
  arr <- array( unlist(Flist) , c(NVar, NFac, B) )
  
  #  Get quantiles of factor elements over third dimension (samples)
  F95 <- apply( arr , 1:2 , quantile, .975 )
  F05 <- apply( arr , 1:2 , quantile, .025 )
  Fse <- apply( arr , 1:2, sd  )
  
  cat("\nUpper Bound 95% CI\n")
  print( round(F95,3))
  cat("\n\nLower Bound 95% CI\n")
  print( round(F05,3))
  
  # plot distribution of bootstrap estimates
  # for example element
  hist(arr[5,1,], xlim=c(.4,1),
       main = "Bootstrap Distribution for F[5,1]",
       xlab = "F[5,1]")
  
  print(round (F3.loadings, 2))
  cat("\nStandard Errors")
  print( round( Fse, 2))




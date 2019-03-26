## ---- eval=FALSE---------------------------------------------------------
#  B <- matrix(c(50, 67, 90, 98, 120,
#               55, 71, 93, 102, 129,
#               65, 76, 95, 105, 134,
#               50, 80, 102, 130, 138,
#               60, 82, 97, 135, 151,
#               65, 89, 106, 137, 153,
#               75, 95, 117, 133, 155), ncol=5, byrow=TRUE)
#  rownames(B) <- c("G1","G2","G3","G4","G5","G6","G7")
#  colnames(B) <- c("E1","E2","E3","E4","E5")
#  
#  B2 = B
#  B2[1,1] = B2[2,1] = NA
#  B2 <- as.matrix(B2)
#  
#  same <- function(a,b, tol=1e-3){
#    all.equal( abs(a), abs(b), tol=tol, check.attributes=FALSE)
#  }

## ---- eval=FALSE---------------------------------------------------------
#  library(ade4)
#  made <- ade4::nipals(B2, nf=5, rec=TRUE, niter=500, tol=1e-9)
#  
#  B2a <- apply(B2, 2, function(x) {
#    n <- sum(!is.na(x))
#    x <- x - mean(x, na.rm=TRUE)
#    x <- x / ( sd(x, na.rm=TRUE) * sqrt((n-1) / n ))
#  })
#  
#  mnip <- nipals::nipals(B2a, ncomp=5, center=FALSE, scale=FALSE,
#                         fitted=TRUE, maxiter=500, tol=1e-9, gramschmidt=FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  # data
#  same(B2a, as.matrix(made$tab))
#  # TRUE
#  
#  # eigenvalues, ade4 uses squared singular values / n-1
#  mnip$eig
#  # [1] 5.2913781 2.2555596 1.1651281 0.2590878 0.1563175
#  made$eig
#  # [1] 4.666454778 0.847924398 0.226254436 0.011187921 0.004072542
#  same(mnip$eig ^ 2 / (nrow(B2a)-1), made$eig)
#  # TRUE
#  
#  # P loadings
#  same(mnip$loadings, made$c1)
#  # TRUE
#  
#  # T scores. For nipals, sweep IN the eigenvalues
#  same( sweep(mnip$scores, 2, mnip$eig, "*"), made$li)
#  # TRUE
#  

## ---- eval=FALSE---------------------------------------------------------
#  library(plsdepot)
#  mpls <- plsdepot::nipals(B2, comps=5)
#  library(nipals)
#  mnip <- nipals::nipals(B2a, ncomp=5, maxiter=100, tol=1e-6, gramschmidt=FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  # eigenvalues
#  mnip$eig
#  # [1] 4.8762167 2.0442757 1.0728055 0.2369607 0.1432779
#  mpls$values[,1]
#  # [1] 3.963172007 0.696484184 0.191839875 0.009366425 0.003421661
#  same(mnip$eig, sqrt(mpls$values[,1] * 6) )
#  # TRUE
#  
#  # P loadings
#  mnip$loadings
#  mpls$loadings
#  same(mnip$loadings, mpls$loadings, tol=1e-2 )
#  # TRUE
#  
#  # T scores
#  mnip$scores
#  mpls$scores
#  same( sweep(mnip$scores, 2, mnip$eig, "*"), mpls$scores)
#  # TRUE

## ---- eval=FALSE---------------------------------------------------------
#  library(mixOmics)
#  library(nipals)
#  mnip <- nipals::nipals(B2, gramschmidt=FALSE)
#  mmix <- mixOmics::nipals(scale(B2), ncomp=5)

## ---- eval=FALSE---------------------------------------------------------
#  # eigenvalues
#  mnip$eig
#  mmix$eig
#  same(mnip$eig, mmix$eig)
#  # TRUE
#  
#  # P loadings
#  mnip$loadings
#  mmix$p
#  same(mnip$loadings, mmix$p, tol=1e-2)
#  # TRUE
#  
#  # T scores
#  mnip$scores
#  mmix$t
#  same(mnip$scores, mmix$t, tol=1e-2)
#  TRUE

## ---- eval=FALSE---------------------------------------------------------
#  set.seed(43)
#  Bbig <- matrix(rnorm(100*100), nrow=100)
#  Bbig2 <- Bbig
#  Bbig2[1,1] <- NA

## ---- eval=FALSE---------------------------------------------------------
#  system.time(ade4::nipals(Bbig2, nf=1)) # Only 1 factor!
#  ##  user  system elapsed
#  ## 42.09    0.00   42.14

## ---- eval=FALSE---------------------------------------------------------
#  system.time(plsdepot::nipals(Bbig2, comps=1)) # Only 1 factor !
#  #   user  system elapsed
#  #    0.5     0.0     0.5
#  system.time(plsdepot::nipals(Bbig2, comps=100)) # 100 factors
#  #   user  system elapsed
#  #  30.19    0.00   30.18

## ---- eval=FALSE---------------------------------------------------------
#  system.time(mixOmics::nipals(scale(Bbig2), ncomp=100)) # 100 factors
#  #   user  system elapsed
#  #  20.70    0.00   20.81

## ---- eval=FALSE---------------------------------------------------------
#  system.time(nipals::nipals(Bbig2, ncomp=100, gramschmidt=FALSE)) # 100 factors
#  #   user  system elapsed
#  #   2.74    0.00    2.75


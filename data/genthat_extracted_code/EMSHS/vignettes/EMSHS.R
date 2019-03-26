## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----EMSHS---------------------------------------------------------------
  EMSHS <- function(y,X,mus,nu,E=NULL,
                    a_sigma=1,b_sigma=1,a_omega=2,b_omega=1,
                    w=1,eps=1e-5){}

## ----EMSHS1--------------------------------------------------------------
 set.seed(100)

  X <- matrix(rnorm(25*50), ncol = 50) # An n by p design matrix
  B <- matrix(c(1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0), ncol = 1) # True beta
  e <- matrix(rnorm(25*1), ncol = 1) # error
  y <- matrix(X %*% B + e, ncol = 1) # An n by 1 response vector
  mus <- 2.3 # The shrinkage parameter
  nu <- 0.3 # The adaptivity parameter

## ----EMSHS2--------------------------------------------------------------
  E <- NULL # An e by 2 matrix of edges. NULL implies there are no edges

  a_sigma <- 1 # The shape parameter of the prior for residual variance
  b_sigma <- 1 # The rate parameter of the prior for residual variance
  a_omega <- 2 # The shape parameter of the prior for nonzero omega values
  b_omega <- 1# The rate parameter of the prior for nonzero omega values

  w <- 1 # A weight vector for samples
  eps <- 1e-5 # The algorithm stops if relative improvement goes below eps

## ----fig1, echo=FALSE, fig.align = "center", fig.cap="**Figure 1. Unstructured graph information**. This is a graphical visualization of unstructured nodes (i.e., $p$ = 50 human genes) with no prior information of connections among the genes.", out.width = '40%'----
knitr::include_graphics("graph.png")

## ----EMSHS3--------------------------------------------------------------
  em_no_edge <- EMSHS(y,X,mus,nu,E=NULL,
                    a_sigma=1,b_sigma=1,a_omega=2,b_omega=1,
                    w=1,eps=1e-5)

## ---- echo=FALSE, code=readLines("EMSHS.R")------------------------------
## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----EMSHS---------------------------------------------------------------
  EMSHS <- function(y,X,mus,nu,E=NULL,
                    a_sigma=1,b_sigma=1,a_omega=2,b_omega=1,
                    w=1,eps=1e-5){}

## ----EMSHS1--------------------------------------------------------------
 set.seed(100)

  X <- matrix(rnorm(25*50), ncol = 50) # An n by p design matrix
  B <- matrix(c(1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0), ncol = 1) # True beta
  e <- matrix(rnorm(25*1), ncol = 1) # error
  y <- matrix(X %*% B + e, ncol = 1) # An n by 1 response vector
  mus <- 2.3 # The shrinkage parameter
  nu <- 0.3 # The adaptivity parameter

## ----EMSHS2--------------------------------------------------------------
  E <- NULL # An e by 2 matrix of edges. NULL implies there are no edges

  a_sigma <- 1 # The shape parameter of the prior for residual variance
  b_sigma <- 1 # The rate parameter of the prior for residual variance
  a_omega <- 2 # The shape parameter of the prior for nonzero omega values
  b_omega <- 1# The rate parameter of the prior for nonzero omega values

  w <- 1 # A weight vector for samples
  eps <- 1e-5 # The algorithm stops if relative improvement goes below eps

## ----fig1, echo=FALSE, fig.align = "center", fig.cap="**Figure 1. Unstructured graph information**. This is a graphical visualization of unstructured nodes (i.e., $p$ = 50 human genes) with no prior information of connections among the genes.", out.width = '40%'----
knitr::include_graphics("graph.png")

## ----EMSHS3--------------------------------------------------------------
  em_no_edge <- EMSHS(y,X,mus,nu,E=NULL,
                    a_sigma=1,b_sigma=1,a_omega=2,b_omega=1,
                    w=1,eps=1e-5)


## ---- echo=FALSE, code=readLines("DWL.R")--------------------------------

#' Interal Use Only
#' @keywords internal
DWLENV <- new.env(parent=emptyenv())

#' Interal Use Only
#' @keywords internal
DWL.Init <- function()
{
  DWLENV$n <- nrow(DWLENV$X)
  DWLENV$p <- ncol(DWLENV$X)
  DWLENV$m <- min(DWLENV$n,DWLENV$p)

  DWLENV$XxMax <- min(3*DWLENV$n,DWLENV$p)
  DWLENV$Xx <- matrix(0,DWLENV$p,DWLENV$XxMax)
  DWLENV$XxIdx <- rep(0,DWLENV$p)
  DWLENV$XxCnt <- 0

  DWLENV$Xy <- as.vector(t(DWLENV$X) %*% DWLENV$y)
  DWLENV$yy <- sum(DWLENV$y^2)

  DWLENV$lam <- rep(max(abs(DWLENV$Xy))*1.2,DWLENV$p)
  DWLENV$A <- c()
  DWLENV$nA <- 0
  DWLENV$B <- c()
  DWLENV$S <- c()

  DWLENV$C <- DWLENV$Xy
  DWLENV$iXXa <- matrix(0,DWLENV$m,DWLENV$m)
  DWLENV$Idx <- rep(0,DWLENV$p)
}



#' Interal Use Only
#' @keywords internal
DWL <- function(lam)
{
  # Eat free lunch
  for ( i in 1:DWLENV$p )
  {
    if ( DWLENV$Idx[i] == 0 & DWLENV$lam[i] < lam[i] )
      DWLENV$lam[i] <- lam[i]
  }

  niter = 0
  repeat
  {
    niter = niter + 1
    dlam = lam - DWLENV$lam

    # calculate dB/dalpha and dC/dalpha
    if ( DWLENV$nA > 0 )
    {
      dB = -DWLENV$iXXa[1:DWLENV$nA,1:DWLENV$nA] %*% (DWLENV$S * dlam[DWLENV$A])
      dC = -DWL.getXXa(DWLENV$A) %*% dB
    }
    else
    {
      dB = numeric()
      dC = rep(0,DWLENV$p)
    }

    # find breakpoint
    alpha = 1

    if ( DWLENV$nA > 0 )
    {
      pbp0 = -DWLENV$B/dB
      for ( l in 1:DWLENV$nA )
        if ( (DWLENV$B[l]+dB[l])*DWLENV$S[l] < 0 & pbp0[l] < alpha )
        {
          alpha = pbp0[l]
          type = 0
          idx = DWLENV$A[l]
        }
    }

    pbp1 = (DWLENV$lam-DWLENV$C)/(dC-dlam)
    pbp2 = -(DWLENV$lam+DWLENV$C)/(dC+dlam)
    for ( k in 1:DWLENV$p )
      if ( DWLENV$Idx[k] == 0 )
      {
        if ( DWLENV$C[k]+dC[k] > DWLENV$lam[k]+dlam[k] & pbp1[k] < alpha )
        {
          alpha = pbp1[k]
          type = 1
          idx = k
        }
        if ( DWLENV$C[k]+dC[k] < -DWLENV$lam[k]-dlam[k] & pbp2[k] < alpha )
        {
          alpha = pbp2[k]
          type = -1
          idx = k
        }
      }


    # Add or remove var
    if ( alpha < 1 )
      if ( type == 0 )
        DWL.remove(idx)
      else
      {
        DWLENV$B <- DWLENV$B + alpha*dB
        DWL.add(idx,type)
      }


    # compute B and C at alpha with new A and S
    DWLENV$lam <- DWLENV$lam + dlam*alpha
    if ( DWLENV$nA > 0 )
    {
      DWLENV$B <- DWLENV$iXXa[1:DWLENV$nA,1:DWLENV$nA] %*% ( DWLENV$Xy[DWLENV$A] - DWLENV$S*DWLENV$lam[DWLENV$A] )
      DWLENV$C <- DWLENV$Xy - DWL.getXXa(DWLENV$A) %*% DWLENV$B
    }
    else
    {
      DWLENV$B <- c()
      DWLENV$C <- DWLENV$Xy
    }

    if ( alpha ==  1 )
      break
  }

  coef = rep(0,DWLENV$p)
  coef[DWLENV$A] = DWLENV$B

  list(coef=coef,niter=niter)
}

#' Interal Use Only
#' @keywords internal
DWL.add <- function(k,sgn)
{
  b = DWL.getXXa(k)

  if ( DWLENV$nA > 0 )
  {
    a = DWLENV$iXXa[1:DWLENV$nA,1:DWLENV$nA]
    del = drop(a %*% b[DWLENV$A])
    d = drop(b[k] - crossprod(del,b[DWLENV$A]))

    if ( d < 1e-8 )
    {
#      message("Warning: numerical instability")

      pos = which.max(del*sgn/DWLENV$B)
      DWL.remove(DWLENV$A[pos])

      if ( DWLENV$nA > 0 )
      {
        a = DWLENV$iXXa[1:DWLENV$nA,1:DWLENV$nA]
        del = drop(a %*% b[DWLENV$A])
        d = drop(b[k] - crossprod(del,b[DWLENV$A]))
      }
    }
  }

  # Now add k
  if ( DWLENV$nA > 0 )
  {
    DWLENV$iXXa[1:DWLENV$nA,1:DWLENV$nA] <- a + del %*% t(del) / d
    DWLENV$iXXa[1:DWLENV$nA,DWLENV$nA+1] <- -del / d
    DWLENV$iXXa[DWLENV$nA+1,1:DWLENV$nA] <- -del / d
    DWLENV$iXXa[DWLENV$nA+1,DWLENV$nA+1] <- 1/d
  }
  else
  {
    DWLENV$iXXa[1] <- 1/b[k]
  }
  DWLENV$Idx[k] <- DWLENV$nA+1
  DWLENV$nA <- DWLENV$nA+1
  DWLENV$A <- c(DWLENV$A,k)
  DWLENV$S <- c(DWLENV$S,sgn)
}


#' Interal Use Only
#' @keywords internal
DWL.remove <- function(k)
{
  l = DWLENV$Idx[k]
  m = DWLENV$nA
  DWLENV$Idx[k] <- 0
  if ( l<m )
    DWLENV$Idx[DWLENV$A[(l+1):m]] <- DWLENV$Idx[DWLENV$A[(l+1):m]] - 1
  DWLENV$nA <- m-1
  DWLENV$A <- DWLENV$A[-l]
  DWLENV$S <- DWLENV$S[-l]

  if ( m>1 )
  {
    a = DWLENV$iXXa[1:m,1:m]
    b = a[,l]
    DWLENV$iXXa[1:(m-1),1:(m-1)] <- a[-l,-l] - b[-l] %*% t(b[-l]) / b[l]
  }

  DWLENV$iXXa[,m] <- 0
  DWLENV$iXXa[m,] <- 0
}


#' Interal Use Only
#' @keywords internal
DWL.getXXa <- function(A)
{
  for ( k in A )
    if ( DWLENV$XxIdx[k] == 0 )
    {
      DWLENV$XxCnt <- DWLENV$XxCnt + 1
      if ( DWLENV$XxCnt > DWLENV$XxMax )
      {
        oldmax = DWLENV$XxMax
        oldXx = DWLENV$Xx
        DWLENV$XxMax <- min(oldmax*2,DWLENV$p)
        DWLENV$Xx <- matrix(0,DWLENV$p,DWLENV$XxMax)
        DWLENV$Xx[,1:oldmax] <- oldXx
      }
      DWLENV$XxIdx[k] <- DWLENV$XxCnt
      DWLENV$Xx[,DWLENV$XxCnt] <- t(DWLENV$X) %*% DWLENV$X[,k]
    }

  DWLENV$Xx[,DWLENV$XxIdx[A]]
}


#' Interal Use Only
#' @keywords internal
DWL.version <- function()
{
  print("0.2")
}

## ----EMSHS4, echo=FALSE--------------------------------------------------
  set.seed(100)

  X <- matrix(rnorm(25*50), ncol = 50) # An n by p design matrix
  B <- matrix(c(1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                0,0,0,0,0,0,0,0,0,0), ncol = 1) # True beta
  e <- matrix(rnorm(25*1), ncol = 1) # error
  y <- matrix(X %*% B + e, ncol = 1) # An n by 1 response vector
  mus <- 2.3 # The shrinkage parameter
  nu <- 0.3 # The adaptivity parameter

em_no_edge <- EMSHS(y,X,mus,nu,E=NULL,
                    a_sigma=1,b_sigma=1,a_omega=2,b_omega=1,
                    w=1,eps=1e-5)


## ----EMSHS5--------------------------------------------------------------
em_no_edge$beta

## ----fig2, echo=FALSE, fig.align = "center", fig.cap="**Figure 2. Structured graph information**. This is a graphical visualization - represented in a structural (a) and circular (b) layout - of nodes (i.e., significant genes) with prior information of edges (i.e., significant connections). Here, we can leverage the association structure of the genes and produce biologically meaningful outcomes, and lead to improvements in prediction and variable selection.", out.width = '55%'----
knitr::include_graphics("structured_layouts.png")

## ----EMSHS6--------------------------------------------------------------
  em_edge <- EMSHS(y,X,mus,nu,E,
                    a_sigma=1,b_sigma=1,a_omega=2,b_omega=1,
                    w=1,eps=1e-5)

## ----EMSHS7, echo=FALSE--------------------------------------------------



    X <- matrix(rnorm(25*50), ncol = 50)
    B <- matrix(c(1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                  0,0,0,0,0,0,0,0,0,0), ncol = 1)
    e <- matrix(rnorm(25*1), ncol = 1)
    y <- matrix(X %*% B + e, ncol = 1)
    mus <- 2.3
    nu <- 0.3
    EE <- matrix(c(1,4,
                   4,1,
                   1,2,
                   2,1,
                   1,5,
                   5,1,
                   2,3,
                   3,2,
                   3,5,
                   5,3,
                   10,11,
                   11,10,
                   19,11,
                   11,19,
                   36,35,
                   35,36,
                   31,35,
                   35,31,
                   31,22,
                   22,31,
                   22,45,
                   45,22,
                   45,32,
                   32,45,
                   22,21,
                   21,22,
                   31,21,
                   21,31,
                   21,25,
                   25,21,
                   21,18,
                   18,21,
                   18,49,
                   49,18,
                   49,47,
                   47,49,
                   47,37,
                   37,47,
                   37,21,
                   21,37,
                   18,25,
                   25,18), nrow = 42, ncol = 2, byrow = TRUE)

    # Sort edges by first column then second column

    E <- EE[do.call(order, lapply(1:ncol(EE), function(i) EE[,i])),]

    em_edge <- EMSHS(y, X, mus, nu, E,
                     a_sigma = 1, b_sigma = 1, a_omega = 2, b_omega = 1,
                     w = 1, eps = 1e-5)

## ----EMSHS8--------------------------------------------------------------
em_edge$beta


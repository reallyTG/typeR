################################################################################
## Utilities Spatio Temporal ##
################################################################################


################################################################################
## Detecting rows and columns to eliminate in the covarince matrix ##
################################################################################

FilasEliminar <- function(tiempos,vecTiemp,nCoor){

  elim <- NULL # Vector with the index of lines and rows to delete in the covariance matrix
  total <- nrow(tiempos)    # Number of temporal observations in the sample
  tamanho <- nrow(vecTiemp) # Number of unique temporal observations
  nk <- tamanho
  nj <- 1

  for (k in 1:nCoor){
    verificar <- tiempos[nj:nk,]
    indices <- seq(((k-1)*tamanho + 1),(k*tamanho),1)
    cont <- 1

    if (k==nCoor){
      for (j in 1:tamanho){
        if (is.na(verificar[j])){
          verificar[j] <- 0
        } # End if
      } # End for
    } # End if

    for (j in 1:tamanho){
      if (verificar[cont]!=vecTiemp[j]){
        elim <- c(elim,indices[j])
      } else {
        cont <- cont + 1
      } # End else
    } # End for

    nj <- k*tamanho - length(elim) + 1
    nk <- min(nj + tamanho - 1,total)
  }# End for

  return (elim)
}

################################################################################
## Spatial correlation matrix ##
################################################################################
# 5 models: 1. exponential: Exponential model
#           2. gaussian: Gaussianmodel
#           3. matern: Matern model
#           4. pow.exp: Powered Exponential model
#           5. spherical: Spherical model

CorrSpatial <- function(H, phi, kappa=0, type="exponential"){
  W <- H       # Distance matrix (spatial component)
  n <- nrow(H) # Number of rows in the distance matrix

  if (type=="exponential") {R <- exp(-(abs(H)/phi))}

  if (type=="gaussian") {R <- exp(-(abs(H)/phi)^2)}

  if (type=="matern"){
    H[H==0]<-1
    R <- 1/(2^(kappa-1)*gamma(kappa))*(abs(H)/phi)^(kappa)*besselK(abs(H)/phi,kappa)
  }

  if (type=="pow.exp") {R <- exp(-(abs(H)/phi)^(kappa))}

  if (type=="spherical") {
    R <- (matrix(1,n,n) - 1.5*(abs(H)/phi) + 0.5*(abs(H)/phi)^3)
    Haux <- (abs(H)>phi) + 0
    R[Haux==1] <- 0
  }

  R[W==0] <- 1
  return(R)
}

################################################################################
## First and second derivative of spatial correlation function ##
################################################################################

DevCorMatrix <- function(H, phi, kappa=0, type="exponential"){

  if (type=="exponential"){
    H1 <- (abs(H)/phi^2)*exp(-(abs(H)/phi))
    H2 <- abs(H)*(abs(H)-2*phi)*exp(-(abs(H)/phi))/(phi^4)
  }

  if (type=="gaussian"){
    H1 <- (2*abs(H)^2/phi^3)*exp(-(abs(H)/phi)^2)
    H2 <- (4*abs(H)^4 - 6*abs(H)^2*phi^2)*exp(-(abs(H)/phi)^2)/(phi^6)
  }

  if (type=="matern"){
    H[H==0] <- 1
    Ak <- besselK(abs(H)/phi,(kappa-1)) + besselK(abs(H)/phi,(kappa+1))
    Bk <- besselK(abs(H)/phi,(kappa-2)) + 2*besselK(abs(H)/phi,kappa) + besselK(abs(H)/phi,(kappa+2))
    H1 <- -1/((2^kappa)*(phi^2)*gamma(kappa))*(abs(H)/phi)^kappa*(2*kappa*phi*besselK(abs(H)/phi,kappa) - abs(H)*Ak)
    H2 <- (abs(H)^kappa)/(2^(kappa+1)*gamma(kappa)*phi^(kappa+4))*(4*kappa*(kappa+1)*(phi^2)*besselK(abs(H)/phi,kappa)
                                                                   - 4*(kappa+1)*phi*abs(H)*Ak + abs(H)^2*Bk)
  }

  if (type=="pow.exp"){
    H1 <- (kappa/phi)*(abs(H)/phi)^(kappa)*exp(-(abs(H)/phi)^(kappa))
    H2 <- H1*(kappa*abs(H)^kappa/(phi^(kappa+1)) - (kappa+1)/phi)
  }

  if (type=="spherical"){
    H1 <- 1.5*(abs(H)/phi^2) - 1.5*(abs(H)^3/phi^4)
    Haux <- (abs(H)>phi) + 0
    H1[Haux==1] <- 0
    H2 <- 6*(abs(H)^3)/(phi^5) - 3*abs(H)/(phi^3)
    H2[Haux==1] <- 0
  }
  diag(H1) <- 0 # First derivative correlation matrix
  diag(H2) <- 0 # Second derivative correlation matrix

  return(list(dev1=H1, dev2=H2))
}

################################################################################
## Temporal correlation matrix ##
################################################################################

CorrTemporal <- function(disTime, rho){
  W <- disTime # Distance matrix (Temporal component)

  Rt <- rho^abs(disTime) # Following the correlation matrix of an autorregressive model AR(1)
  Rt[W==0] <- 1
  return(Rt)
}

################################################################################
## First and second derivative of temporal correlation matrix ##
################################################################################

DevTempCorMatrix <- function(disTime, rho){

  dRT1 <- abs(disTime)*rho^(abs(disTime) - 1)
  dRT2 <- abs(disTime)*(abs(disTime) - 1)*rho^(abs(disTime) - 2)
  diag(dRT1) <- 0 # First derivative correlation matrix
  diag(dRT2) <- 0 # Second derivative correlation matrix

  return(list(devt1=dRT1, devt2=dRT2))
}

################################################################################
## Covariance Matrix for balanced or unbalanced model ##
################################################################################

CovarianceMatrix <- function(phi, rho, tau2, sigma2, distSpa, disTemp, elim, kappa, type.S){

  cs1 <- CorrSpatial(distSpa,phi,kappa,type.S) # Purely spatial correlation matrix of dimension n
  ct1 <- CorrTemporal(disTemp,rho)             # Purely temporal correlation matrix of dimension T
  In <- diag(nrow(cs1)*nrow(ct1))              # Identity matrix of dimension m = n*T
  Psi1 <- (cs1%x%ct1) + (tau2/sigma2)*In

  if (length(elim)==0){
    Psi <- Psi1 # Balanced data
  } else {
    Psi <- Psi1[-elim,-elim] # Unbalanced data
  }

  Psi <- (Psi + t(Psi))/2 # Correct rounding problems
  Psi <- round(Psi,9)
  PsiInv <- solve(Psi)
  PsiInv <- (PsiInv + t(PsiInv))/2 # Correct rounding problems

  return(list(psi=Psi, psiInv=PsiInv))
}

CovM <- function(phi, rho, tau2, sigma2, distSpa, disTemp, kappa, type.S){

  cs1 <- CorrSpatial(distSpa,phi,kappa,type.S) # Purely spatial correlation matrix of dimension n
  ct1 <- CorrTemporal(disTemp,rho)             # Purely temporal correlation matrix of dimension T
  In <- diag(nrow(cs1)*nrow(ct1))              # Identity matrix of dimension m = n*T
  Cov <- sigma2*(cs1%x%ct1) + tau2*In

  return(Cov)
}

################################################################################
## Function to estimate phi, rho and tau2 ##
################################################################################

FCiNlminb <- function(rhoG, media, sigma2, yb, yyb, dSpatial, dTemp, elimin, kappa, type.S){
  phi <- rhoG[1]
  rho <- rhoG[2]
  tau2 <- rhoG[3]
  vero1 <- numeric()

  y1 <- yb
  yy1 <- yyb
  mat <- CovarianceMatrix(phi,rho,tau2,sigma2,dSpatial,dTemp,elimin,kappa,type.S)
  Psi <- mat$psi # Matrix Psi
  PsiInv <- mat$psiInv # Inverse matrix Psi
  if (det(Psi)>.Machine$double.xmax){detPsi <- .Machine$double.xmax}
  else{if (det(Psi)<.Machine$double.xmin){detPsi <- .Machine$double.xmin}else{detPsi <- det(Psi)}}

  AA <- (sum(diag(yy1%*%PsiInv)) - t(media)%*%PsiInv%*%y1 - t(y1)%*%PsiInv%*%media + t(media)%*%PsiInv%*%media)
  vero1 <- -(log(detPsi) + AA/sigma2)/2 # Log-likelihood to be maximize

  return(-vero1)
}

################################################################################
## Function to estimate phi and rho ##
################################################################################

FCi <- function(rhoG, media, sigma2, tau2, yb, yyb, dSpat, dTemp, elimin, kappa, type.S){
  phi <- rhoG[1]
  rho <- rhoG[2]
  vero1 <- numeric()

  y1 <- yb
  yy1 <- yyb
  mat <- CovarianceMatrix(phi,rho,tau2,sigma2,dSpat,dTemp,elimin,kappa,type.S)
  Psi <- mat$psi # Matrix Psi
  PsiInv <- mat$psiInv # Inverse matrix Psi
  if (det(Psi)>.Machine$double.xmax){detPsi <- .Machine$double.xmax}
  else{if (det(Psi)<.Machine$double.xmin){detPsi <- .Machine$double.xmin}else{detPsi <- det(Psi)}}

  AA <- (sum(diag(yy1%*%PsiInv)) - t(media)%*%PsiInv%*%y1 - t(y1)%*%PsiInv%*%media + t(media)%*%PsiInv%*%media)
  vero1 <- -(log(detPsi) + AA/sigma2)/2 # Log-likelihood to be maximize

  return(-vero1)
}

################################################################################
## Function to estimate tau2 ##
################################################################################

FCik <- function(rhoG, media, sigma2, phi, rho, yb, yyb, dSpa, dTemp, elimin, kappa, type.S){
  tau2 <- rhoG
  vero1 <- numeric()

  y1 <- yb
  yy1 <- yyb
  mat <- CovarianceMatrix(phi,rho,tau2,sigma2,dSpa,dTemp,elimin,kappa,type.S)
  Psi <- mat$psi # Matrix Psi
  PsiInv <- mat$psiInv # Inverse matrix Psi
  if (det(Psi)>.Machine$double.xmax){detPsi <- .Machine$double.xmax}
  else{if (det(Psi)<.Machine$double.xmin){detPsi <- .Machine$double.xmin}else{detPsi <- det(Psi)}}

  AA <- (sum(diag(yy1%*%PsiInv)) - t(media)%*%PsiInv%*%y1 - t(y1)%*%PsiInv%*%media + t(media)%*%PsiInv%*%media)
  vero1 <- -(log(detPsi) + AA/sigma2)/2 # Log-likelihood to be maximize

  return(-vero1)
}

################################################################################
## Likelihood function ##
################################################################################

LogVerosCens<-function(cc, y, media, Psi, LI, LS){

  GB <- GenzBretz(maxpts = 5e4, abseps = 1e-9, releps = 0)
  m1 <- length(y)  # Number of spatio-temporal observations
  gammai <- media # Mean = X%*%beta
  ver = numeric()

  if(sum(cc)==0){
     if (det(Psi)>.Machine$double.xmax){detP <- .Machine$double.xmax}
    else{if (det(Psi)<.Machine$double.xmin){detP <- .Machine$double.xmin}else{detP <- det(Psi)}}
     ver <- (-1/2)*(length(y)*log(2*pi) + log(detP) + t(y - media)%*%solve(Psi)%*%(y - media))
  } # Observations without censored

  if(sum(cc)>0){
    if(sum(cc)==m1){
      ver1 <- pmvnorm(lower=LI,upper=LS,mean=as.vector(gammai),sigma=Psi)
      if (ver1>.Machine$double.xmax){ver1 <- .Machine$double.xmax}
      else{if (ver1<.Machine$double.xmin){ver1 <- .Machine$double.xmin}else{ver1 <- ver1}}
      ver <- log(ver1)
    } # All observations are censored

    if (sum(cc)==(m1-1)){
      InvPsioo <- (1/Psi[cc==0,cc==0])
      muc <- gammai[cc==1,] + (y[cc==0] - gammai[cc==0,])*InvPsioo*Psi[cc==1,cc==0]
      Sc <- Psi[cc==1,cc==1] - InvPsioo*matrix(Psi[cc==1,cc==0],ncol=1)%*%t(matrix(Psi[cc==0,cc==1],ncol=1))
      Sc <- (Sc + t(Sc))/2 # Correct rounding problems

      ver1 <- pmvnorm(lower=LI[cc==1],upper=LS[cc==1],mean=as.vector(muc),sigma=Sc)
      if (ver1>.Machine$double.xmax){ver1 <- .Machine$double.xmax}
      else{if (ver1<.Machine$double.xmin){ver1 <- .Machine$double.xmin}else{ver1 <- ver1}}
      ver <- log(dnorm(x=y[cc==0],mean=as.numeric(gammai[cc==0,]),sd=sqrt(Psi[cc==0,cc==0]))) + log(ver1)
    } # One observation is not censored

    if(sum(cc)<(m1-1)){
      InvPsioo <- solve(Psi[cc==0,cc==0])
      muc <- gammai[cc==1,] + Psi[cc==1,cc==0]%*%InvPsioo%*%(y[cc==0] - gammai[cc==0,])
      Sc <- Psi[cc==1,cc==1] - Psi[cc==1,cc==0]%*%InvPsioo%*%Psi[cc==0,cc==1]
      Sc <- (Sc + t(Sc))/2 # Correct rounding problems

      ver1 <- pmvnorm(lower=LI[cc==1],upper=LS[cc==1],mean=as.vector(muc),sigma=Sc)
      if (ver1>.Machine$double.xmax){ver1 <- .Machine$double.xmax}
      else{if (ver1<.Machine$double.xmin){ver1 <- .Machine$double.xmin}else{ver1 <- ver1}}
      if (det(Psi[cc==0,cc==0])>.Machine$double.xmax){detP <- .Machine$double.xmax}
      else{if (det(Psi[cc==0,cc==0])<.Machine$double.xmin){detP <- .Machine$double.xmin}
        else{detP <- det(Psi[cc==0,cc==0])}}

      ver <- (-1/2)*(nrow(InvPsioo)*log(2*pi) + log(detP) +
                       t(y[cc==0] - gammai[cc==0,])%*%InvPsioo%*%(y[cc==0] - gammai[cc==0,])) + log(ver1)
    } # Otherwise
  } # At least one censored observations
  obj.out <- list(ver = ver)

  return(obj.out)
}

################################################################################
## Gibbs Sampler ##
################################################################################

amostradordegibbs <- function(M, M0, cc1, y1, media, Gama, LI, LS){

  nj <- length(y1) # Number of spatio-temporal observations
  gammai <- media	 # Mean
  draws <- matrix(NA,nrow=M,ncol=nj) # Matrix with the samples
  draws[1,] <- y1
  t1 <- rep(0,nj)

  if(sum(cc1)==0){
    for(i in 2:M){
      t1 <- y1
      draws[i,] <- t1
    }
  } # Non-censored observations

  if(sum(cc1)>0 & sum(cc1)==nj){
    g <- as.vector(gammai)

    for(i in 2:M){
      t1 <- as.vector(rtmvnorm(1,mean=g,sigma=Gama,lower=LI,upper=LS,algorithm="gibbs",thinning=2))
      draws[i,] <- t1
    }
  } # All observations are censored

  if(sum(cc1)>0 & sum(cc1)<nj){
    if(sum(cc1)==1){
      g <- as.vector(gammai)
      InvPsioo <- solve(Gama[cc1==0,cc1==0])
      t1[cc1==0] <- y1[cc1==0]

      muc <- g[cc1==1] + Gama[cc1==1,cc1==0]%*%InvPsioo%*%(y1[cc1==0] - g[cc1==0])
      muc <- as.numeric(muc)
      Sc <- Gama[cc1==1,cc1==1] - Gama[cc1==1,cc1==0]%*%InvPsioo%*%Gama[cc1==0,cc1==1]
      Sc <- as.numeric(Sc)

      for(i in 2:M){
        y_r <- rtnorm(1,mean=muc,sd=(sqrt(Sc)),lower=LI[cc1==1],upper=LS[cc1==1])
        t1[cc1==1] <- y_r
        draws[i,] <- t1
      }
    } # One observation is censored
    else{
      g <- as.vector(gammai)
      InvPsioo <- solve(Gama[cc1==0,cc1==0])
      t1[cc1==0] <- y1[cc1==0]

      muc <- g[cc1==1] + Gama[cc1==1,cc1==0]%*%InvPsioo%*%(y1[cc1==0] - g[cc1==0])
      muc <- as.vector(muc)
      Sc <- Gama[cc1==1,cc1==1] - Gama[cc1==1,cc1==0]%*%InvPsioo%*%Gama[cc1==0,cc1==1]
      Sc <- (Sc + t(Sc))/2 # Correct rounding problems

      for(i in 2:M){
        y_r <- rtmvnorm(1,mean=muc,sigma=Sc,lower=LI[cc1==1],upper=LS[cc1==1],algorithm="gibbs",thinning=2)
        t1[cc1==1] <- y_r
        draws[i,] <- t1
      }
    } # Otherwise
  } # At least one censored observation

  # Amostra com burnin (M0)
  amostragibbs <- draws[(M0+1):M,] # Delete the M0 initials samples
  obj.out <- list(amostragibbs = amostragibbs)

  return(obj.out)
}

################################################################################
## Score vector for the complete data ##
################################################################################

ScoreVector <- function(yb, x, beta, sigma2, media, PsiInv, Omega, d1Spat, d1Temp,tauF){
  yb <- matrix(yb,ncol=1)

  # First derivatives
  if(tauF=="FALSE"){
  dbeta   <- (1/sigma2)*t(x)%*%PsiInv%*%(yb - media)
  dsigma2 <- (-1/(2*sigma2))*sum(diag(PsiInv%*%Omega)) + (1/(2*sigma2^2))*t(yb - media)%*%PsiInv%*%Omega%*%PsiInv%*%(yb - media)
  dtau2   <- (-1/(2*sigma2))*sum(diag(PsiInv)) + (1/(2*sigma2^2))*t(yb - media)%*%PsiInv%*%PsiInv%*%(yb - media)
  dphi    <- (-1/2)*sum(diag(PsiInv%*%d1Spat)) + (1/(2*sigma2))*t(yb - media)%*%PsiInv%*%d1Spat%*%PsiInv%*%(yb - media)
  drho    <- (-1/2)*sum(diag(PsiInv%*%d1Temp)) + (1/(2*sigma2))*t(yb - media)%*%PsiInv%*%d1Temp%*%PsiInv%*%(yb - media)

  score <- c(dbeta,dsigma2,dtau2,dphi,drho)
  }else{
    dbeta   <- (1/sigma2)*t(x)%*%PsiInv%*%(yb - media)
    dsigma2 <- (-1/(2*sigma2))*sum(diag(PsiInv%*%Omega)) + (1/(2*sigma2^2))*t(yb - media)%*%PsiInv%*%Omega%*%PsiInv%*%(yb - media)
    dphi    <- (-1/2)*sum(diag(PsiInv%*%d1Spat)) + (1/(2*sigma2))*t(yb - media)%*%PsiInv%*%d1Spat%*%PsiInv%*%(yb - media)
    drho    <- (-1/2)*sum(diag(PsiInv%*%d1Temp)) + (1/(2*sigma2))*t(yb - media)%*%PsiInv%*%d1Temp%*%PsiInv%*%(yb - media)

    score <- c(dbeta,dsigma2,dphi,drho)
  }
  return (score)
}

################################################################################
## Hessian Matrix ##
################################################################################

HessianMatrix <- function(yb, yyb, x, beta, sigma2, PsiInv, Omega, d1Spat, d1Temp, dSpaTem, d2Spat, d2Temp, tauF){

  p1 <- length(beta) # Number of beta parameters
  media1 <- x%*%beta # Mean
  yb <- matrix(yb,ncol=1)

  E0 <- PsiInv%*%Omega%*%PsiInv
  E1 <- PsiInv%*%PsiInv
  E2 <- PsiInv%*%d1Spat%*%PsiInv
  E3 <- PsiInv%*%d1Temp%*%PsiInv

  # Second derivatives
  if (tauF=="FALSE"){
  d2beta      <- t(x)%*%PsiInv%*%x/sigma2
  DbetaDsigma <- t(x)%*%E0%*%(yb - media1)/(sigma2^2)
  DbetaDtau2  <- t(x)%*%E1%*%(yb - media1)/(sigma2^2)
  DbetaDphi   <- t(x)%*%E2%*%(yb - media1)/sigma2
  DbetaDrho   <- t(x)%*%E3%*%(yb - media1)/sigma2

  d2sigma     <- -sum(diag(E0%*%Omega))/(2*sigma2^2) + (1/sigma2^3)*(sum(diag(yyb%*%E0%*%Omega%*%PsiInv)) - t(media1)%*%E0%*%Omega%*%PsiInv%*%(2*yb - media1))
  DsigmaDtau2 <- -sum(diag(E0))/(2*sigma2^2) + (1/sigma2^3)*(sum(diag(yyb%*%E0%*%PsiInv)) - t(media1)%*%E0%*%PsiInv%*%(2*yb - media1))
  DsigmaDphi  <- sum(diag((PsiInv - E0)%*%d1Spat))/(2*sigma2) + (1/(2*sigma2^2))*(sum(diag(yyb%*%(2*PsiInv%*%Omega%*%E2 - E2))) - t(media1)%*%(2*PsiInv%*%Omega%*%E2 - E2)%*%(2*yb - media1))
  DsigmaDrho  <- sum(diag((PsiInv - E0)%*%d1Temp))/(2*sigma2) + (1/(2*sigma2^2))*(sum(diag(yyb%*%(2*PsiInv%*%Omega%*%E3 - E3))) - t(media1)%*%(2*PsiInv%*%Omega%*%E3 - E3)%*%(2*yb - media1))

  d2tau2      <- -sum(diag(E1))/(2*sigma2^2) + (1/sigma2^3)*(sum(diag(yyb%*%PsiInv%*%E1)) - t(media1)%*%PsiInv%*%E1%*%(2*yb - media1))
  Dtau2Dphi   <- -sum(diag(E2))/(2*sigma2) + (1/sigma2^2)*(sum(diag(yyb%*%E2%*%PsiInv)) - t(media1)%*%E2%*%PsiInv%*%(2*yb - media1))
  Dtau2Drho   <- -sum(diag(E3))/(2*sigma2) + (1/sigma2^2)*(sum(diag(yyb%*%E3%*%PsiInv)) - t(media1)%*%E3%*%PsiInv%*%(2*yb - media1))

  d2phi       <- sum(diag(PsiInv%*%d2Spat - E2%*%d1Spat))/2 + (1/(2*sigma2))*(sum(diag(yyb%*%(2*E2%*%d1Spat%*%PsiInv - PsiInv%*%d2Spat%*%PsiInv))) - t(media1)%*%(2*E2%*%d1Spat%*%PsiInv - PsiInv%*%d2Spat%*%PsiInv)%*%(2*yb - media1))
  DphiDrho    <- sum(diag(PsiInv%*%dSpaTem - E3%*%d1Spat))/2 + (1/(2*sigma2))*(sum(diag(yyb%*%(2*E3%*%d1Spat%*%PsiInv - PsiInv%*%dSpaTem%*%PsiInv))) - t(media1)%*%(2*E3%*%d1Spat%*%PsiInv - PsiInv%*%dSpaTem%*%PsiInv)%*%(2*yb - media1))

  d2rho       <- sum(diag(PsiInv%*%d2Temp - E3%*%d1Temp))/2 + (1/(2*sigma2))*(sum(diag(yyb%*%(2*E3%*%d1Temp%*%PsiInv - PsiInv%*%d2Temp%*%PsiInv))) - t(media1)%*%(2*E3%*%d1Temp%*%PsiInv - PsiInv%*%d2Temp%*%PsiInv)%*%(2*yb - media1))

  # Second derivative matrix
  HessMatrix <- rbind(cbind(d2beta,DbetaDsigma,DbetaDtau2,DbetaDphi,DbetaDrho),
                      matrix(c(t(DbetaDsigma),d2sigma,DsigmaDtau2,DsigmaDphi,DsigmaDrho,
                               t(DbetaDtau2),DsigmaDtau2,d2tau2,Dtau2Dphi,Dtau2Drho,
                               t(DbetaDphi),DsigmaDphi,Dtau2Dphi,d2phi,DphiDrho,
                               t(DbetaDrho),DsigmaDrho,Dtau2Drho,DphiDrho,d2rho),nrow=4,ncol=(p1+4),byrow = TRUE))
  }else{
    d2beta      <- t(x)%*%PsiInv%*%x/sigma2
    DbetaDsigma <- t(x)%*%E0%*%(yb - media1)/(sigma2^2)
    DbetaDphi   <- t(x)%*%E2%*%(yb - media1)/sigma2
    DbetaDrho   <- t(x)%*%E3%*%(yb - media1)/sigma2

    d2sigma     <- -sum(diag(E0%*%Omega))/(2*sigma2^2) + (1/sigma2^3)*(sum(diag(yyb%*%E0%*%Omega%*%PsiInv)) - t(media1)%*%E0%*%Omega%*%PsiInv%*%(2*yb - media1))
    DsigmaDphi  <- sum(diag((PsiInv - E0)%*%d1Spat))/(2*sigma2) + (1/(2*sigma2^2))*(sum(diag(yyb%*%(2*PsiInv%*%Omega%*%E2 - E2))) - t(media1)%*%(2*PsiInv%*%Omega%*%E2 - E2)%*%(2*yb - media1))
    DsigmaDrho  <- sum(diag((PsiInv - E0)%*%d1Temp))/(2*sigma2) + (1/(2*sigma2^2))*(sum(diag(yyb%*%(2*PsiInv%*%Omega%*%E3 - E3))) - t(media1)%*%(2*PsiInv%*%Omega%*%E3 - E3)%*%(2*yb - media1))

    d2phi       <- sum(diag(PsiInv%*%d2Spat - E2%*%d1Spat))/2 + (1/(2*sigma2))*(sum(diag(yyb%*%(2*E2%*%d1Spat%*%PsiInv - PsiInv%*%d2Spat%*%PsiInv))) - t(media1)%*%(2*E2%*%d1Spat%*%PsiInv - PsiInv%*%d2Spat%*%PsiInv)%*%(2*yb - media1))
    DphiDrho    <- sum(diag(PsiInv%*%dSpaTem - E3%*%d1Spat))/2 + (1/(2*sigma2))*(sum(diag(yyb%*%(2*E3%*%d1Spat%*%PsiInv - PsiInv%*%dSpaTem%*%PsiInv))) - t(media1)%*%(2*E3%*%d1Spat%*%PsiInv - PsiInv%*%dSpaTem%*%PsiInv)%*%(2*yb - media1))

    d2rho       <- sum(diag(PsiInv%*%d2Temp - E3%*%d1Temp))/2 + (1/(2*sigma2))*(sum(diag(yyb%*%(2*E3%*%d1Temp%*%PsiInv - PsiInv%*%d2Temp%*%PsiInv))) - t(media1)%*%(2*E3%*%d1Temp%*%PsiInv - PsiInv%*%d2Temp%*%PsiInv)%*%(2*yb - media1))

    # Second derivative matrix
    HessMatrix <- rbind(cbind(d2beta,DbetaDsigma,DbetaDphi,DbetaDrho),
                        matrix(c(t(DbetaDsigma),d2sigma,DsigmaDphi,DsigmaDrho,
                                 t(DbetaDphi),DsigmaDphi,d2phi,DphiDrho,
                                 t(DbetaDrho),DsigmaDrho,DphiDrho,d2rho),nrow=3,ncol=(p1+3),byrow = TRUE))
  }
  return(list(HessM=HessMatrix)) # Return the negative of the second derivatives matrix of Q function
}


################################################################################
## Estimate model parameter values ##
################################################################################

saemST <- function(y,x,cc,tempo,coord,inits.phi,inits.rho,inits.tau2,tau2.fixo=FALSE,type.Data="balanced",
                   cens.type="left",method="nlminb",kappa=0,type.S="exponential",IMatrix=TRUE,lower.lim=c(0.01,-0.99,0.01),
                   upper.lim=c(30,0.99,20),M=20,perc=0.25,MaxIter=300,pc=0.2,error=10^-6){

  m <- length(y) # Number of spatio-temporal observations
  marcador <- 30 # Let use an alternative fuction to maximize when using nlminb

  # Censored
  if (cens.type=="right"){
    LI <- ifelse(cc==1,y,-Inf)         # LI for right censored variables
    LI <- ifelse(is.na(LI)==1,-Inf,LI) # Correcting when exist missing values
    LS <- rep(Inf,m)
  }
  if (cens.type=="left"){
    LI <- rep(-Inf,m)
    LS <- ifelse(cc==1,y,Inf)         # LS for left censored variables
    LS <- ifelse(is.na(LS)==1,Inf,LS) # Correcting when exist missing values
  }
  if (cens.type=="missing"|cens.type=="none"){
    LI <- rep(-Inf,m)
    LS <- rep(Inf,m)
  }

  # Starting values
  na.y <- ifelse(is.na(y)==1,1,0) # Detecting missing values
  beta1 <- solve(t(x[na.y==0,])%*%x[na.y==0,])%*%t(x[na.y==0,])%*%y[na.y==0] # Calcule the beta parameters without the missing values
  p <- length(beta1) # Number of beta parameter
  media <- x%*%beta1 # Mean
  sigma2 <- as.numeric(t(y[na.y==0] - media[na.y==0])%*%(y[na.y==0] - media[na.y==0])/(m-sum(na.y))) # Calcule sigma^2 without the missing values
  tau2 <- inits.tau2
  phi <- inits.phi
  rho <- inits.rho
  teta <- c(beta1,sigma2,tau2,phi,rho) # Initial values

  Theta <- matrix(NA,MaxIter,length(teta)) # Matrix with the values for the parameters in each iteration

  # Covariance matrix
  vec <- as.matrix(unique(cbind(coord)))              # Matrix of unique coordinates (without repetitions)
  tiempo <- as.matrix(sort(as.matrix(unique(tempo)))) # Vector of unique times index (without repetitions)
  MDist <- as.matrix(distances(vec))                  # Distance matrix of spatial coordinates (without coordinates repetitions)
  disTem <- as.matrix(distances(tiempo))              # Distance matrix of temporal index (without repetitions)

  if (type.Data=="balanced"){
    eliminar <- NULL
  }
  if (type.Data=="unbalanced"){
    eliminar <- FilasEliminar(tempo,tiempo,nrow(vec)) # Finding the number of the row where exist a missing time index
  } # End if

  matCor <- CovarianceMatrix(phi,rho,tau2,sigma2,MDist,disTem,eliminar,kappa,type.S)
  V <- matCor$psiInv       # Inverse matrix Psi
  Cov <- sigma2*matCor$psi # Covariance matrix sigma2*Psi
  Cov <- (Cov + t(Cov))/2  # Correct rounding problems

  criterio <- 1
  count <- 0

  ################################ SAEM algorithm ################################

  MG <- round(M/(1 - perc),0) # Number of samples to gernerate
  M0 <- MG - M                # Number of burn samples

  # Sequence of decreasing positive numbers to SAEM smoothing parameter
  if(pc==1){
    seqq <- rep(1,MaxIter)
  } else {
    seqq <- c(1/((((pc*MaxIter)+1):MaxIter)-(pc*MaxIter)))
    seqq <- c(rep(1,MaxIter-length(seqq)),seqq)
  }

  SAEM_ss <- 0
  SAEM_xy <- matrix(0,p,1)
  SAEM_y  <- matrix(0,m,1)
  SAEM_yy <- matrix(0,m,m)
  if (IMatrix==TRUE){if(tau2.fixo==FALSE){Louis <- matrix(0,(p+4),(p+4))}else{Louis <- matrix(0,(p+3),(p+3))}} else {Louis <- NULL}

  while(criterio > error){

    count <- count + 1
    #print(count)

    # Simulation step (S-step): generating from the truncated conditional distribution
    t1 <- y
    gibbs <- amostradordegibbs(MG,M0,cc,t1,media,Cov,LI,LS)

    uyi <- matrix(gibbs$amostragibbs[,1:m],nrow=M,ncol=m)

    if (IMatrix==TRUE){
      ## Approximation of the second term of the observed information matrix by the Louis'method
      cs <- CorrSpatial(MDist,phi,kappa,type.S) # Spatial correlation matrix
      ct <- CorrTemporal(disTem,rho) # Temporal correlation matrix
      Omega  <- cs%x%ct              # Spatio-temporal correlation matrix
      d1Spat <- (DevCorMatrix(MDist,phi,kappa,type.S)$dev1)%x%ct # First spatial derivative of the spatio-temporal correlation matrix
      d1Temp <- cs%x%(DevTempCorMatrix(disTem,rho)$devt1)        # First temporal derivative of the spatio-temporal correlation matrix

      if (length(eliminar)>0){
        Omega  <- Omega[-eliminar,-eliminar]
        d1Spat <- d1Spat[-eliminar,-eliminar]
        d1Temp <- d1Temp[-eliminar,-eliminar]
      } # Using is we are leading with unbalanced data

      if (tau2.fixo==FALSE){soma <- matrix(0,ncol=(p+4),nrow=(p+4))}else{soma <- matrix(0,ncol=(p+3),nrow=(p+3))}
      for (i in 1:M){
        yi <- matrix(uyi[i,],nrow=m,ncol=1)
        score <- ScoreVector(yi,x,beta1,sigma2,media,V,Omega,d1Spat,d1Temp,tau2.fixo)
        soma <- soma + score%*%t(score)
      }
      Louis <- Louis + seqq[count]*(soma/M - Louis)
    }

    # Approximation step (A-step)
    somass <- 0
    somaxy <- matrix(0,p,1)
    somay <- matrix(0,m,1)
    somayy <- matrix(0,m,m)

    for(k in 1:M){
      yi <- matrix(uyi[k,],nrow=m,ncol=1)
      somaxy <- somaxy + (t(x)%*%V%*%yi)
      somay <- somay + yi
      somayy <- somayy + (yi%*%t(yi))
    }
    E_xy <- (1/M)*somaxy
    E_y <- (1/M)*somay
    E_yy <- (1/M)*somayy

    ## Stochastic approximation
    SAEM_xy <- SAEM_xy + seqq[count]*(E_xy - SAEM_xy)
    SAEM_y  <- SAEM_y + seqq[count]*(E_y - SAEM_y)
    SAEM_yy <- SAEM_yy + seqq[count]*(E_yy - SAEM_yy)

    ## Conditional maximization (CM-step)
    beta1 <- solve(t(x)%*%V%*%x)%*%SAEM_xy
    media <- x%*%beta1 # Update mean

    for(k in 1:M){
      yi <- matrix(uyi[k,],nrow=m,ncol=1)
      somass <- somass + (t(yi - media)%*%V%*%(yi - media))
    }
    E_ss <- (1/M)*somass
    SAEM_ss <- SAEM_ss + seqq[count]*(E_ss - SAEM_ss)
    sigma2 <- (1/m)*(SAEM_ss)
    sigma2 <- as.numeric(sigma2) # Update sigma2

    if (tau2.fixo=="TRUE"){

      if (method=="optim"){
        rhos <- optim(c(phi,rho),method="L-BFGS-B",fn=FCi,lower=lower.lim,upper=upper.lim,media=media,sigma2=sigma2,tau2=tau2,yb=SAEM_y,
                      yyb=SAEM_yy,dSpat=MDist,dTemp=disTem,elimin=eliminar,kappa=kappa,type.S=type.S)$par
        phi <- rhos[1] # Update phi
        rho <- rhos[2] # Update rho
      } # End if optim

      if (method=="nlminb"){
        rhos <- nlminb(c(phi,rho),objective=FCi,lower=lower.lim,upper=upper.lim,media=media,sigma2=sigma2,tau2=tau2,yb=SAEM_y,
                       yyb=SAEM_yy,dSpat=MDist,dTemp=disTem,elimin=eliminar,kappa=kappa,type.S=type.S)$par
        phi <- rhos[1] # Update phi
        rho <- rhos[2] # Update rho
      } # End if nlminb

    } # End if tau2.fixo==TRUE

    if (tau2.fixo=="FALSE") {

      if (method=="optim"){
        tau2 <- optimize(f=FCik,lower=lower.lim[3],upper=upper.lim[3],media=media,sigma2=sigma2,phi=phi,rho=rho,yb=SAEM_y,yyb=SAEM_yy,dSpa=MDist,
                         dTemp=disTem,elimin=eliminar,kappa=kappa,type.S=type.S)$minimum # Update tau2

        rhos <- optim(c(phi,rho),method="L-BFGS-B",fn=FCi,lower=lower.lim[1:2],upper=upper.lim[1:2],media=media,sigma2=sigma2,tau2=tau2,
                      yb=SAEM_y,yyb=SAEM_yy,dSpat=MDist,dTemp=disTem,elimin=eliminar,kappa=kappa,type.S=type.S)$par
        phi <- rhos[1] # Update phi
        rho <- rhos[2] # Update rho
      } # End if optim

      if (method=="nlminb"){
        if (marcador == 5){
          tau2 <- optimize(f=FCik,lower=lower.lim[3],upper=upper.lim[3],media=media,sigma2=sigma2,phi=phi,rho=rho,yb=SAEM_y,yyb=SAEM_yy,dSpa=MDist,
                           dTemp=disTem,elimin=eliminar,kappa=kappa,type.S=type.S)$minimum # Update tau2

          rhos <- nlminb(c(phi,rho),objective=FCi,lower=lower.lim[1:2],upper=upper.lim[1:2],media=media,sigma2=sigma2,tau2=tau2,yb=SAEM_y,
                         yyb=SAEM_yy,dSpat=MDist,dTemp=disTem,elimin=eliminar,kappa=kappa,type.S=type.S)$par
          phi <- rhos[1] # Update phi
          rho <- rhos[2] # Update rho
        } else {
          rhos <- nlminb(c(phi,rho,tau2),objective=FCiNlminb,lower=lower.lim,upper=upper.lim,media=media,sigma2=sigma2,yb=SAEM_y,
                         yyb=SAEM_yy,dSpatial=MDist,dTemp=disTem,elimin=eliminar,kappa=kappa,type.S=type.S)$par
          phi <- rhos[1] # Update phi
          rho <- rhos[2] # Update rho
          tau2 <- rhos[3] # Update tau2

          # Condition to try the result the optimization problem using the combiation of functions nlminb+optimize
          if (abs(phi - (upper.lim[1]+lower.lim[1])/2) > (upper.lim[1]-lower.lim[1]-0.10)/2 | abs(rho - (upper.lim[2]+lower.lim[2])/2) > (upper.lim[2]-lower.lim[2]-0.02)/2 | abs(tau2 - (upper.lim[3]+lower.lim[3])/2) > (upper.lim[3]-lower.lim[3]-0.10)/2){
            beta1 <- solve(t(x[na.y==0,])%*%x[na.y==0,])%*%t(x[na.y==0,])%*%y[na.y==0] # Calcule the initial values of beta without the missing values
            media <- x%*%beta1  # Mean
            sigma2 <- as.numeric(t(y[na.y==0] - media[na.y==0])%*%(y[na.y==0] - media[na.y==0])/(m-sum(na.y))) # Calcule the initial valeu of sigma^2 without the missing values
            tau2 <- inits.tau2  # Initialize the tau2 value
            phi <- inits.phi    # Initialize the phi value
            rho <- inits.rho    # Initialize the rho value
            marcador <- 5       # Let to use other function to find the parameters that maximize the log-likelihood
            count <- 0          # Initialize the total number of iterations
          } # Restarting initial values
        }
      } # End if nlminb
    } # End if tau2.fixo==FALSE

    # Update covariance matrix
    matCor <- CovarianceMatrix(phi,rho,tau2,sigma2,MDist,disTem,eliminar,kappa,type.S)
    V <- matCor$psiInv # Inverse matrix Psi
    Cov <- sigma2*matCor$psi # Covariace matrix
    Cov <- (Cov + t(Cov))/2 # Correct rounding problems

    teta1 <- c(beta1,sigma2,tau2,phi,rho)
    #print(teta1)

    if (count>1){
      criterio <- sqrt((teta1/teta-1)%*%(teta1/teta-1))
    }

    if (count==(MaxIter-1)){
      criterio <- 0.00000000001
    }

    Theta[count,] <- teta1
    teta <- teta1
  } # End while SAEM

  ############################## End SAEM Algorithm ##############################

 # Criterios AIC, BIC, AICc
  Theta <- Theta[1:count,]
  npar <- length(c(teta1))
  loglik <- LogVerosCens(cc,y,media,Cov,LI,LS)$ver
  AICc <- -2*loglik + 2*npar
  AICcorr <- AICc + ((2*npar*(npar + 1))/(m - npar - 1))
  BICc <- -2*loglik + log(m)*npar

  HessianM <- NULL
  LouisM <- NULL

  if (IMatrix==TRUE){
    ## The last approximation of the observed information matrix by the Louis' method
    t1 <- y
    gibbs <- amostradordegibbs(MG,M0,cc,t1,media,Cov,LI,LS)

    uyi <- matrix(gibbs$amostragibbs[,1:m],nrow=M,ncol=m)

    cs <- CorrSpatial(MDist,phi,kappa,type.S) # Spatial correlation matrix
    ct <- CorrTemporal(disTem,rho)            # Temporal correlation matrix
    Omega  <- cs%x%ct                         # Spatio-temporal correlation matrix
    dSpatial <- DevCorMatrix(MDist,phi,kappa,type.S) # Derivatives of the spatial correlation matrix
    dTemporal <- DevTempCorMatrix(disTem,rho)        # Derivatives of the temporal correlation matrix

    d1Spat <- (dSpatial$dev1)%x%ct   # First spatial derivative of the spatio-temporal correlation matrix
    d1Temp <- cs%x%(dTemporal$devt1) # First temporal derivative of the spatio-temporal correlation matrix
    dSpaTe <- (dSpatial$dev1)%x%(dTemporal$devt1) # Second spatio-temporal derivative of the spatio-temporal correlation matrix
    d2Spat <- (dSpatial$dev2)%x%ct   # Second spatial derivative of the spatio-temporal correlation matrix
    d2Temp <- cs%x%(dTemporal$devt2) # Second temporal derivative of the spatio-temporal correlation matrix

    if (length(eliminar)>0){
      Omega  <- Omega[-eliminar,-eliminar]
      d1Spat <- d1Spat[-eliminar,-eliminar]
      d1Temp <- d1Temp[-eliminar,-eliminar]
      dSpaTe <- dSpaTe[-eliminar,-eliminar]
      d2Spat <- d2Spat[-eliminar,-eliminar]
      d2Temp <- d2Temp[-eliminar,-eliminar]
    } # Using is we are leading with unbalanced data

    somay <- matrix(0,m,1)
    somayy <- matrix(0,m,m)
    if (tau2.fixo==FALSE){soma <- matrix(0,ncol=(p+4),nrow=(p+4))}else{soma <- matrix(0,ncol=(p+3),nrow=(p+3))}
    for (i in 1:M){
      yi <- matrix(uyi[i,],nrow=m,ncol=1)
      somay <- somay + yi
      somayy <- somayy + (yi%*%t(yi))
      score <- ScoreVector(yi,x,beta1,sigma2,media,V,Omega,d1Spat,d1Temp,tau2.fixo)
      soma <- soma + score%*%t(score)
    }
    Louis <- Louis + seqq[(count + 1)]*(soma/M - Louis)
    SAEM_y  <- SAEM_y + seqq[(count + 1)]*(somay/M - SAEM_y) # Update the approximation of the first moment
    SAEM_yy <- SAEM_yy + seqq[(count + 1)]*(somayy/M - SAEM_yy) # Update the approximation of the second moment

    ### The negative of the conditional expected second derivative matrix given the observed values
    HessianM <- HessianMatrix(SAEM_y,SAEM_yy,x,beta1,sigma2,V,Omega,d1Spat,d1Temp,dSpaTe,d2Spat,d2Temp,tau2.fixo)$HessM

    ### The observed information matrix using the Louis' method
    LouisM <- HessianM - Louis
  } # End IMatrix == TRUE

  # Results
  data.model <- list(y=y,cc=cc,x=x,time=tempo,coord=coord,kappa=kappa,type.S=type.S,method=method,lower=lower.lim,upper=upper.lim,censType=cens.type,
                     initphi=inits.phi,initrho=inits.rho,initau=inits.tau2,tauFixo=tau2.fixo,eliminar=eliminar,M=M,perc=perc,MaxIter=MaxIter,pc=pc,error=error)

  results.model <- list(theta=teta1,Theta=Theta,beta=beta1,sigma2=sigma2,tau2=tau2,phi=phi,rho=rho,PsiInv=V,Cov=Cov,SAEMy=SAEM_y,SAEMyy=SAEM_yy,
                       Hessian=HessianM,Louis=LouisM,loglik=loglik,AIC=AICc,BIC=BICc,AICcorr=AICcorr,iteration=count)

  return(list(m.data=data.model,m.results=results.model))

} # End SpatioTemporal function

################################################################################
## Function to predict values ##
################################################################################

PredictNewValues <- function(modelo,locPre,timePre,xpre){

  # Data
  locObs <- modelo$m.data$coord
  timeObs <- data.frame(modelo$m.data$time)
  yobs <- modelo$m.results$SAEMy
  xobs <- modelo$m.data$x
  p <- length(modelo$m.results$beta) # Number of beta parameters

  localidades <- rbind(locPre,locObs) # Total locations (include repetitions)
  tiempos     <- rbind(as.matrix(timePre,ncol=1),as.matrix(timeObs,ncol=1)) # Total time index (include repetitions)
  Ipre        <- c(rep(1,nrow(locPre)),rep(0,nrow(locObs))) # Indicator variable that takes 1 if a value to predict
  Iorder      <- c(seq(1,nrow(locPre)),rep(0,nrow(locObs))) # Indicate the position of the value to predict in the original order
  xtotal      <- rbind(xpre,xobs)
  ytotal      <- ifelse(Ipre==1,0,yobs)

  dados   <- cbind(localidades, tiempos, Ipre, xtotal, ytotal,Iorder) # Dataset
  indices <- order(dados[,1],dados[,2],dados[,3]) # Index to order the dataset
  dados   <- dados[indices,] # Ordered dataset
  localidades <- dados[,1:2]
  tiempos <- as.matrix(dados[,3],ncol=1)

  vec1 <- as.matrix(localidades[!duplicated(localidades),])
  tiemp <- as.matrix(sort(tiempos[!duplicated(tiempos)]))

  # Covariance matrix
  MD <- as.matrix(distances(vec1))
  dTem <- as.matrix(distances(tiemp))

  eliminar <- FilasEliminar(tiempos,tiemp,nrow(vec1))

  matCor <- CovarianceMatrix(modelo$m.results$phi,modelo$m.results$rho,modelo$m.results$tau2,modelo$m.results$sigma2,MD,dTem,eliminar,modelo$m.data$kappa,modelo$m.data$type.S)
  Cov <- modelo$m.results$sigma2*(matCor$psi)
  Cov <- (Cov + t(Cov))/2 # Correct rounding problems

  # Predicted values
  dados <- as.matrix(dados)
  sigmaPreOb <- Cov[dados[,4]==1,dados[,4]==0]
  sigmaObOb  <- Cov[dados[,4]==0,dados[,4]==0]
  yPred   <- dados[dados[,4]==1,5:(4+p)]%*%modelo$m.results$beta + sigmaPreOb%*%solve(sigmaObOb)%*%(dados[dados[,4]==0,(p+5)] - dados[dados[,4]==0,5:(4+p)]%*%modelo$m.results$beta)
  VarPred <- Cov[dados[,4]==1,dados[,4]==1]- sigmaPreOb%*%solve(sigmaObOb)%*%t(sigmaPreOb)

  ind2 <- dados[dados[,4]==1,ncol(dados)]
  yPred <- yPred[order(ind2)] # Come back to the initial order
  VarPred <- VarPred[order(ind2),order(ind2)] # Come back to the initial order

  return( list(predValues=yPred, VarPred=VarPred))

}

################################################################################
## Mean Squared Prediction Error ##
################################################################################

CrossValidation <- function(yobs,ypred){
  nj <- length(yobs)
  bias <- (ypred - yobs)

  mspe <- sum(bias^2)/nj # Mean squared prediction error
  rmspe <- sqrt(mspe) # Root mean squared prediction error
  mae <- sum(abs(bias))/nj # Mean absolute error

  return(list(Bias=bias, Mspe=mspe, Rmspe=rmspe, Mae=mae))
}

################################################################################
## Global Influence Analysis ##
################################################################################

GlobalInf <- function(model, type="individual"){

  y <- model$m.data$y
  cc <- model$m.data$cc
  x <- model$m.data$x
  time <- model$m.data$time
  coord <- model$m.data$coord
  p <- length(model$m.results$beta)
  tauFixo <- model$m.data$tauFixo

  if(tauFixo==FALSE){parametro <- model$m.results$theta}else{parametro <- model$m.results$theta[-(p+2)]}

  hess <- model$m.results$Hessian

  if(type=="individual"){
    n <- length(y)
    pb <- txtProgressBar(min = 0, max =n, style = 3)
    GD <- matrix(0,nrow=n,ncol=(length(parametro)+1))
    for (i in 1:n){
      setTxtProgressBar(pb,i)
      newTheta <- saemST(y[-i],x[-i,],cc[-i],matrix(time[-i,],ncol=1),coord[-i,],model$m.data$initphi,model$m.data$initrho,model$m.data$initau,tau2.fixo=tauFixo,type.Data="unbalanced",model$m.data$censType,
                         model$m.data$method,model$m.data$kappa,model$m.data$type.S,IMatrix=FALSE,model$m.data$lower,model$m.data$upper,M=model$m.data$M,perc=model$m.data$perc,MaxIter=model$m.data$MaxIter,
                         pc=model$m.data$pc,error=model$m.data$error)

      if(tauFixo==FALSE){newTheta1 <- newTheta$m.results$theta}else{newTheta1 <- newTheta$m.results$theta[-(p+2)]}

      GlobalDiag <- t(newTheta1 - parametro)%*%(hess)%*%(newTheta1 - parametro)
      GD[i,] <- c(newTheta1,GlobalDiag)
    } # End for
  } # End if type=="individual"

  if (type=="time"){
    tiempo <- as.matrix(sort(as.matrix(unique(time))))
    n <- length(tiempo)
    pb <- txtProgressBar(min = 0, max =n, style = 3)
    GD <- matrix(0,nrow=n,ncol=(length(parametro)+1))
    for (i in 1:n){
      setTxtProgressBar(pb,i)
      k <- time!=tiempo[i]

      newTheta <- saemST(y[k],x[k,],cc[k],matrix(time[k,],ncol=1),coord[k,],model$m.data$initphi,model$m.data$initrho,model$m.data$initau,tau2.fixo=tauFixo,type.Data="unbalanced",model$m.data$censType,
                         model$m.data$method,model$m.data$kappa,model$m.data$type.S,IMatrix=FALSE,model$m.data$lower,model$m.data$upper,M=model$m.data$M,perc=model$m.data$perc,MaxIter=model$m.data$MaxIter,
                         pc=model$m.data$pc,error=model$m.data$error)

      if(tauFixo==FALSE){newTheta1 <- newTheta$m.results$theta}else{newTheta1 <- newTheta$m.results$theta[-(p+2)]}

      GlobalDiag <- t(newTheta1 - parametro)%*%(hess)%*%(newTheta1 - parametro)
      GD[i,] <- c(newTheta1,GlobalDiag)
    } # End for
  } # End if type=="time

  if (type=="location"){
    vec <- as.matrix(unique(cbind(coord)))
    n <- nrow(vec)
    pb <- txtProgressBar(min = 0, max =n, style = 3)
    GD <- matrix(0,nrow=n,ncol=(length(parametro)+1))

    for (i in 1:n){
      setTxtProgressBar(pb,i)
      k <- (coord[,1]!=vec[i,1]|coord[,2]!=vec[i,2])

      newTheta <- saemST(y[k],x[k,],cc[k],matrix(time[k,],ncol=1),coord[k,],model$m.data$initphi,model$m.data$initrho,model$m.data$initau,tau2.fixo=tauFixo,type.Data="unbalanced",model$m.data$censType,
                         model$m.data$method,model$m.data$kappa,model$m.data$type.S,IMatrix=FALSE,model$m.data$lower,model$m.data$upper,M=model$m.data$M,perc=model$m.data$perc,MaxIter=model$m.data$MaxIter,
                         pc=model$m.data$pc,error=model$m.data$error)

      if(tauFixo==FALSE){newTheta1 <- newTheta$m.results$theta}else{newTheta1 <- newTheta$m.results$theta[-(p+2)]}

      GlobalDiag <- t(newTheta1 - parametro)%*%(hess)%*%(newTheta1 - parametro)
      GD[i,] <- c(newTheta1,GlobalDiag)
    }
  } # End if type=="location"

  return (GD)
}

################################################################################
## ggplot view ##
################################################################################
vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)

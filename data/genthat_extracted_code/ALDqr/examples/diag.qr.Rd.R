library(ALDqr)


### Name: diag.qr
### Title: Diagnostics for Quantile Regression Using Asymmetric Laplace
###   Distribution
### Aliases: diag.qr
### Keywords: diagnostic

### ** Examples
## Not run: 
##D 
##D ##############################################################
##D ### Graphic of the generalized Cook distance for data(AIS) ###
##D ##############################################################
##D #Dados 
##D data(ais, package="sn")
##D attach(ais)
##D sexInd <- (sex=="female") + 0
##D x      <- cbind(1,LBM,sexInd)
##D y      <- BMI
##D 
##D 
##D #Percentile
##D  perc         <- 0.5
##D 
##D res           <- EM.qr(y,x,perc)
##D diag          <- diag.qr(y,x,perc,res$theta)
##D HessianMatrix <- diag$MatrizQ
##D Gradiente     <- diag$mdelta
##D GDI           <- c()
##D for (i in 1:202) {
##D  GDI[i] <- t(Gradiente[,i])##D 
##D }
##D 
##D   
##D #Seccion de los graficos
##D  par(mfrow = c(1,1))
##D  plot(seq(1:202),GDI,xlab='Index',ylab=expression(paste(GD[i])),main='p=0.1')
##D  abline(h=2*(4+1)/202,lty=2)
##D  identify(GDI,n=1) 
##D 
##D  plot(seq(1:202),GDI,xlab='Index',ylab=expression(paste(GD[i])),main='p=0.5')
##D  abline(h=2*(4+1)/202,lty=2)
##D  identify(GDI,n=1) 
##D 
##D  plot(seq(1:202),GDI,xlab='Index',ylab=expression(paste(GD[i])),main='p=0.9')
##D  abline(h=2*(4+1)/202,lty=2)
##D  identify(GDI,n=4) 
##D 
##D 
##D #############################################################
##D ### Graphic of the likelihood displacemente for data(AIS) ###
##D #############################################################
##D #Dados 
##D  data(ais, package="sn"); attach(ais); sexInd<-(sex=="female")+0; x=cbind(1,LBM,sexInd); y=BMI
##D 
##D #Percentile
##D  perc          <- 0.9
##D  n             <- nrow(x)
##D 
##D  res           <- EM.qr(y,x,perc)
##D  
##D  thetaest      <- res$theta
##D  sigmaest      <- thetaest[4]
##D  betaest       <- matrix(thetaest[1:3],3,1)
##D 
##D  taup2         <- (2/(perc*(1-perc)))
##D  thep          <- (1-2*peGraphic of the generalized Cook distance for data(AIS)rc)/(perc*(1-perc))
##D 
##D  diag          <- diag.qr(y,x,perc,thetaest)
##D 
##D  HessianMatrix <- diag$MatrizQ
##D  Gradiente     <- diag$mdelta
##D 
##D  sigma         <- sigmaest
##D  beta          <- betaest 
##D 
##D  muc           <- (y-x##D 
##D  delta2        <- (y-x##D 
##D  gamma2        <- (2+thep^2/taup2)/sigma
##D 
##D  vchpN         <- besselK(sqrt(delta2*gamma2), 0.5-1)
##D                   /(besselK(sqrt(delta2*gamma2), 0.5))*(sqrt(delta2/gamma2))^(-1)
##D  vchp1         <- besselK(sqrt(delta2*gamma2), 0.5+1)
##D                   /(besselK(sqrt(delta2*gamma2), 0.5))*(sqrt(delta2/gamma2))
##D  
##D  Q             <- -0.5*n*log(sigmaest)-0.5*(sigmaest*taup2)^{-1}*
##D                   (sum(vchpN*muc^2 - 2*muc*thep + vchp1*(thep^2+2*taup2)))  
##D  ########################################################
##D  theta_i       <- thetaest##D 
##D  sigmaest      <- theta_i[4,]
##D  betaest       <- theta_i[1:3,]
##D  sigma         <- sigmaest
##D  beta          <- betaest
##D  muc           <- (y-x##D 
##D  
##D  delta2        <- (y-x##D 
##D  gamma2        <- (2+thep^2/taup2)/sigma
##D  
##D  vchpN         <- besselK(sqrt(delta2*gamma2), 0.5-1)
##D                   /(besselK(sqrt(delta2*gamma2), 0.5))*(sqrt(delta2/gamma2))^(-1)
##D  vchp1         <- besselK(sqrt(delta2*gamma2), 0.5+1)
##D                   /(besselK(sqrt(delta2*gamma2), 0.5))*(sqrt(delta2/gamma2))
##D 
##D  Q1 <- c()
##D  for (i in 1:202)
##D  {
##D    Q1[i] <- -0.5*n*log(sigmaest[i])-sum(vchpN[,i]*muc[,i]^2 - 2*muc[,i]*thep
##D      + vchp1[,i]*(thep^2+2*taup2))/(2*(sigmaest[i]*taup2))
##D  }
##D 
##D  ######################################################## 
##D  QDi <- 2*(-Q+Q1)
##D 
##D  #Depois de escolger perc guardamos os valores de  QDi
##D  QDi0.1 <- QDi
##D  QDi0.5 <- QDi
##D  QDi0.9 <- QDi
##D 
##D #Seccion de los graficos
##D  par(mfrow = c(1,1))
##D  plot(seq(1:202),QDi0.1,xlab='Index',ylab=expression(paste(QD[i])),main='p=0.1')
##D  abline(h=mean(QDi0.1)+3.5*sd(QDi0.1),lty=2)
##D  identify(QDi0.1,n=3) 
##D 
##D  plot(seq(1:202),QDi0.5,xlab='Index',ylab=expression(paste(QD[i])),main='p=0.5')
##D  abline(h=mean(QDi0.5)+3.5*sd(QDi0.5),lty=2)
##D  identify(QDi0.5,n=3) 
##D 
##D  plot(seq(1:202),QDi0.9,xlab='Index',ylab=expression(paste(QD[i])),main='p=0.9')
##D  abline(h=mean(QDi0.9)+3.5*sd(QDi0.9),lty=2)
##D  identify(QDi0.9,n=4) 
## End(Not run) 




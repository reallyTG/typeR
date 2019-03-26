library(RobustAFT)


### Name: RobustAFT-package
### Title: Robust Accelerated Failure Time Model Fitting
### Aliases: RobustAFT-package RobustAFT
### Keywords: regression robust package

### ** Examples

# Example 1. This is the example described in Marazzi and Yohai (2004).
# ---------
# The two following auxiliary functions, not included in the library, 
#must be loaded.
# ------------- Auxiliary functions -------------------------------------

SDmux.lw <- function(x,theta,sigma,COV){
# Standard deviation of the conditional mean estimate: log-Weibull case
np <- length(theta); nc <- ncol(COV); nr <- nrow(COV)
if (np!=length(x)) cat("length(x) must be the same as length(theta)")
if (nc!=nr)        cat("COV is not a square matrix")
if (nc!=(np+1))    cat("ncol(COV) must be the same as length(theta)+1")
log.mu.x <- t(x)%*%theta+lgamma(1+sigma) # log of conditional mean estimate
mu.x     <- exp(log.mu.x)                # conditional mean estimate
dg       <- digamma(1+sigma)
COV.TT   <- COV[1:np,1:np]
Var.S    <- COV[(np+1),(np+1)]
COV.TS   <- COV[1:np,(np+1)]
V.mu.x   <- t(x)%*%COV.TT%*%x + dg^2*Var.S + 2*dg*(t(x)%*%COV.TS)
SD.mu.x  <- as.numeric((sqrt(V.mu.x))*mu.x)
SD.mu.x}

plt <- function(LOS,Cost,Adm,theta.fr,sigma.fr,sd0.fr,sd1.fr,theta.ml,
                sigma.ml,sd0.ml,sd1.ml){
# Plot of the conditional mean and confidence intervals: log-Weibull case
par(mfrow=c(1,2),oma=c(0,0,2,0))
plot(LOS,Cost,type="n")
points(LOS[Adm==0],Cost[Adm==0],pch=1)
points(LOS[Adm==1],Cost[Adm==1],pch=16,col=2)
x0t   <- x0%*%theta.fr; x1t <- x1t <- x1%*%theta.fr
lines(l0,exp(x0t)*gamma(1+sigma.fr))
lines(l0,exp(x1t)*gamma(1+sigma.fr),col=2)
z0min <- exp(x0t)*gamma(1+sigma.fr)-2.576*sd0.fr
z0max <- exp(x0t)*gamma(1+sigma.fr)+2.576*sd0.fr
z1min <- exp(x1t)*gamma(1+sigma.fr)-2.576*sd1.fr
z1max <- exp(x1t)*gamma(1+sigma.fr)+2.576*sd1.fr
lines(l0,z0min,lty=2,col=1)
lines(l0,z0max,lty=2,col=1)
lines(l0,z1min,lty=2,col=1)
lines(l0,z1max,lty=2,col=1)
polygon(c(l0,rev(l0)), c(z0min,rev(z0max)), border=FALSE, density=10, angle=90)
polygon(c(l0,rev(l0)), c(z1min,rev(z1max)), border=FALSE, density=12, angle=90,col=2)
plot(LOS,Cost,type="n")
points(LOS[Adm==0],Cost[Adm==0],pch=1)
points(LOS[Adm==1],Cost[Adm==1],pch=16,col=2)
x0t   <- x0%*%theta.ml; x1t <- x1t <- x1%*%theta.ml
lines(l0,exp(x0t)*gamma(1+sigma.ml))
lines(l0,exp(x1t)*gamma(1+sigma.ml),col=2)
z0min <- exp(x0t)*gamma(1+sigma.ml)-2.576*sd0.ml
z0max <- exp(x0t)*gamma(1+sigma.ml)+2.576*sd0.ml
z1min <- exp(x1t)*gamma(1+sigma.ml)-2.576*sd1.ml
z1max <- exp(x1t)*gamma(1+sigma.ml)+2.576*sd1.ml
lines(l0,z0min,lty=2,col=1)
lines(l0,z0max,lty=2,col=1)
lines(l0,z1min,lty=2,col=1)
lines(l0,z1max,lty=2,col=1)
polygon(c(l0,rev(l0)), c(z0min,rev(z0max)), border=FALSE, density=10, angle=90)
polygon(c(l0,rev(l0)), c(z1min,rev(z1max)), border=FALSE, density=12, angle=90,col=2)}

#------ End of auxiliary functions --------------------------------------------------

library(RobustAFT)

data(D243)
Cost <- D243$Cost                            # Cost (Swiss francs)
LOS <- D243$LOS                              # Length of stay (days)
Adm <- D243$Typadm; Adm <- (Adm==" Urg")*1   # Type of admission 
                                             # (0=on notification, 1=Emergency)
Ass <- D243$Typass; Ass <- (Ass=="P"   )*1   # Type of insurance (0=usual, 1=private)
Age <- D243$age                              # Age (years)
Dst <- D243$dest;   Dst <- (Dst=="DOMI")*1   # Destination (1=Home, 0=another hospital)
Sex <- D243$Sexe;   Sex <- (Sex=="M"   )*1   # Sex (1=Male, 0=Female)

## Not run: 
##D # Plot data
##D par(mfrow=c(1,2))
##D plot(LOS,Cost); plot(log(LOS),log(Cost))
##D 
##D # log-Weibull fits
##D # ----------------
##D # Full robust model
##D zwff     <- TML.noncensored(log(Cost)~log(LOS)+Adm+Ass+Age+Sex+Dst,
##D             errors="logWeibull")
##D summary(zwff)
##D 
##D # Reduced model
##D zwfr     <- update(zwff,log(Cost)~log(LOS)+Adm)
##D summary(zwfr)
##D 
##D # Residual plots
##D par(mfrow=c(1,2))
##D plot(zwfr,which=c(1,3))
##D 
##D # Plot robust predictions on log-log scale
##D par(mfrow=c(1,1))
##D l0       <- seq(from=2,to=60,by=0.5)
##D x0       <- as.matrix(cbind(1,log(l0),0))
##D x1       <- as.matrix(cbind(1,log(l0),1))
##D plot(log(LOS),log(Cost),type="n")
##D points(log(LOS[Adm==1]),log(Cost[Adm==1]),pch=16,col=2)
##D points(log(LOS[Adm==0]),log(Cost[Adm==0]),pch=1)
##D lines(log(l0),predict(zwfr,x0))
##D lines(log(l0),predict(zwfr,x1),col=2)
##D 
##D # Maximum likelihood : full model
##D zmlf     <- TML.noncensored(log(Cost)~log(LOS)+Adm+Ass+Age+Sex+Dst,
##D             errors="logWeibull",cu=100)
##D summary(zmlf)
##D 
##D # Maximum likelihood : reduced model
##D zmlr     <- update(zmlf,log(Cost)~log(LOS)+Adm)
##D summary(zmlr)
##D 
##D # Plot conditional means and confidence intervals
##D l0       <- seq(from=2,to=62,by=0.5)
##D x0       <- as.matrix(cbind(1,log(l0),0))
##D x1       <- as.matrix(cbind(1,log(l0),1))
##D theta.fr <- coef(zwfr)
##D sigma.fr <- zwfr$v1
##D COV.fr   <- vcov(zwfr)
##D sd0.fr   <- apply(x0,1,SDmux.lw,theta.fr,sigma.fr,COV.fr)
##D sd1.fr   <- apply(x1,1,SDmux.lw,theta.fr,sigma.fr,COV.fr)
##D theta.ml <- coef(zmlr)
##D sigma.ml <- zmlr$v1
##D COV.ml   <- zmlr$COV
##D sd0.ml   <- apply(x0,1,SDmux.lw,theta.ml,sigma.ml,COV.ml)
##D sd1.ml   <- apply(x1,1,SDmux.lw,theta.ml,sigma.ml,COV.ml)
##D plt(LOS,Cost,Adm,theta.fr,sigma.fr,sd0.fr,sd1.fr,theta.ml,sigma.ml,sd0.ml,sd1.ml)
##D 
##D # Gaussian fits (for comparison)
##D # ------------------------------
##D # Reduced model
##D zgfr <- TML.noncensored(log(Cost)~log(LOS)+Adm,errors="Gaussian")
##D summary(zgfr)
##D 
##D # Residual plots
##D par(mfrow=c(1,2))
##D plot(zgfr,which=c(1,3))
##D 
##D # Classical Gaussian fit
##D lr <- lm(log(Cost)~log(LOS)+Adm)
##D summary(lr)
##D 
##D # Compare several fits
##D # --------------------
##D comp <- fits.compare(TML.logWeibull=zwfr,ML.logWeibull=zmlr,least.squares=lr)
##D comp
##D plot(comp,leg.position=c("topleft","topleft","bottomleft")) # click on graphics
## End(Not run)
#
#------------------------------------------------------------------------------
#
# Example 2. This is the example described in Locatelli Marazzi and Yohai (2010).
# ---------
# This is the example described in Locatelli et al. (2010). 
# The estimates are slighty different due to changes in the algorithm for the 
# final estimate.
## Not run: 
##D # Remove data of Example 1
##D rm(Cost,LOS,Adm,Ass,Age,Dst,Sex)
##D 
##D data(MCI)
##D attach(MCI)
##D      
##D # Exploratory Analysis
##D 
##D par(mfrow=c(1,1)) 
##D 
##D plot(Age,log(LOS),type= "n",cex=0.7)
##D 
##D # (1) filled square   : regular,   complete   
##D # (2) empty  square   : regular,   censored
##D # (3) filled triangle : emergency, complete
##D # (4) empty  triangle : emergency, censored
##D 
##D points(Age[Dest==1 & TypAdm==0], log(LOS)[Dest==1 & TypAdm==0], pch=15,cex=0.7)  # (1)
##D points(Age[Dest==0 & TypAdm==0], log(LOS)[Dest==0 & TypAdm==0], pch=0, cex=0.7)  # (2)
##D points(Age[Dest==1 & TypAdm==1], log(LOS)[Dest==1 & TypAdm==1], pch=17,cex=0.7)  # (3)
##D points(Age[Dest==0 & TypAdm==1], log(LOS)[Dest==0 & TypAdm==1], pch=2, cex=0.7)  # (4)
##D 
##D # Maximum Likelihood
##D ML   <- survreg(Surv(log(LOS), Dest) ~ TypAdm*Age, dist="gaussian")
##D summary(ML)
##D B.ML <- ML$coef; S.ML <- ML$scale
##D abline(c(B.ML[1]        ,B.ML[3]        ),lwd=1,col="grey",lty=1)
##D abline(c(B.ML[1]+B.ML[2],B.ML[3]+B.ML[4]),lwd=1,col="grey",lty=1)
##D      
##D # Robust Accelerated Failure Time Regression with Gaussian errors
##D ctrol.S   <- list(N=150, q=5, sigma0=1, MAXIT=100, TOL=0.001,seed=123)
##D 
##D ctrol.ref <- list(maxit.sigma=2,tol.sigma=0.0001,maxit.Beta=2,tol.Beta=0.0001,
##D           Maxit.S=50, tol.S.sigma=0.001, tol.S.Beta=0.001,alg.sigma=1,nitmon=FALSE)
##D 
##D ctrol.tml <- list(maxit.sigma=50,tol.sigma=0.0001,maxit.Beta=50,tol.Beta=0.0001,
##D     Maxit.TML=50, tol.TML.sigma=0.001, tol.TML.Beta=0.001, alg.sigma=1,nitmon=FALSE)
##D 
##D WML       <- TML.censored(log(LOS)~TypAdm*Age,data=MCI,delta=Dest,otp="adaptive",
##D              control.S=ctrol.S,control.ref=ctrol.ref,control.tml=ctrol.tml)
##D 
##D summary(WML)
##D 
##D B.WML     <-coef(WML)
##D abline(c(B.WML[1]         ,B.WML[3]         ),lty=1, col="red")
##D abline(c(B.WML[1]+B.WML[2],B.WML[3]+B.WML[4]),lty=1, col="red")
##D #
##D detach(MCI)
## End(Not run)




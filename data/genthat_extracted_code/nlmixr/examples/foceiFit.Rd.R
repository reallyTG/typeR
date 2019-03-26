library(nlmixr)


### Name: foceiFit
### Title: FOCEi fit
### Aliases: foceiFit foceiFit.data.frame foceiFit.data.frame0

### ** Examples

## Not run: 
##D ## Comparison to Wang2007 objective functions
##D 
##D mypar2 = function ()
##D {
##D     k = theta[1] * exp(eta[1]);
##D }
##D 
##D mod <- RxODE({
##D     ipre = 10 * exp(-k * t)
##D })
##D pred <- function() ipre
##D 
##D errProp <- function(){
##D   return(prop(0.1))
##D }
##D 
##D inits <- list(THTA=c(0.5),
##D               OMGA=list(ETA[1] ~ 0.04));
##D 
##D w7 <- Wang2007
##D 
##D w7$DV <- w7$Y
##D w7$EVID <- 0
##D w7$AMT <- 0
##D 
##D ## Wang2007 prop error OBF 39.458 for NONMEM FOCEi, nlmixr matches.
##D fitPi <- foceiFit(w7, inits, mypar2,mod,pred,errProp,
##D      control=foceiControl(maxOuterIterations=0,covMethod=""))
##D 
##D print(fitPi$objective)
##D 
##D ## Wang2007 prop error OBF 39.207 for NONMEM FOCE; nlmixr matches.
##D fitP <- foceiFit(w7, inits, mypar2,mod,pred,errProp,
##D      control=foceiControl(maxOuterIterations=0,covMethod="",
##D      interaction=FALSE))
##D 
##D print(fitP$objective)
##D 
##D ## Wang 2007 prop error OBF 39.213 for NONMEM FO; nlmixr matches
##D fitPfo <- foceiFit(w7, inits, mypar2,mod,pred,errProp,
##D      control=foceiControl(maxOuterIterations=0,covMethod="",
##D      fo=TRUE))
##D 
##D print(fitPfo$objective)
##D 
##D ## Note if you have the etas you can evaluate the likelihood
##D ## of an arbitrary model.  It doesn't have to be solved by
##D ## FOCEi
##D 
##D etaMat <- matrix(fitPi$eta[,-1])
##D 
##D fitP2 <- foceiFit(w7, inits, mypar2,mod,pred,errProp, etaMat=etaMat,
##D       control=foceiControl(maxOuterIterations=0,maxInnerIterations=0,
##D       covMethod=""))
##D 
##D 
##D errAdd <- function(){
##D   return(add(0.1))
##D }
##D 
##D ## Wang2007 add error of -2.059 for NONMEM FOCE=NONMEM FOCEi;
##D ## nlmixr matches.
##D fitA <- foceiFit(w7, inits, mypar2,mod,pred,errAdd,
##D      control=foceiControl(maxOuterIterations=0,covMethod=""))
##D 
##D ## Wang2007 add error of 0.026 for NONMEM FO; nlmixr matches
##D 
##D fitAfo <- foceiFit(w7, inits, mypar2,mod,pred,errAdd,
##D      control=foceiControl(maxOuterIterations=0,fo=TRUE,covMethod=""))
##D 
##D ## Extending Wang2007 to add+prop with same dataset
##D errAddProp <- function(){
##D   return(add(0.1) + prop(0.1));
##D }
##D 
##D fitAP <- foceiFit(w7, inits, mypar2,mod,pred,errAddProp,
##D      control=foceiControl(maxOuterIterations=0,covMethod=""))
##D 
##D ## Checking lognormal
##D 
##D errLogn <- function(){
##D    return(lnorm(0.1));
##D }
##D 
##D ## First run the fit with the nlmixr lnorm error
##D 
##D fitLN <- foceiFit(w7, inits, mypar2,mod,pred,errLogn,
##D      control=foceiControl(maxOuterIterations=0,covMethod=""))
##D 
##D 
##D ## Next run on the log-transformed space
##D w72 <- w7; w72$DV <- log(w72$DV)
##D 
##D predL <- function() log(ipre)
##D 
##D fitLN2 <- foceiFit(w72, inits, mypar2,mod,predL,errAdd,
##D      control=foceiControl(maxOuterIterations=0,covMethod=""))
##D 
##D ## Correct the fitLN2's objective function to be on the normal scale
##D print(fitLN2$objective + 2*sum(w72$DV))
##D 
##D ## Note the objective function of the lognormal error is on the normal scale.
##D print(fitLN$objective)
##D 
##D mypar2 <- function ()
##D {
##D     ka <- exp(THETA[1] + ETA[1])
##D     cl <- exp(THETA[2] + ETA[2])
##D     v  <- exp(THETA[3] + ETA[3])
##D }
##D 
##D mod <- RxODE({
##D     d/dt(depot) <- -ka * depot
##D     d/dt(center) <- ka * depot - cl / v * center
##D     cp <- center / v
##D })
##D 
##D pred <- function() cp
##D 
##D err <- function(){
##D     return(add(0.1))
##D }
##D 
##D inits <- list(THTA=c(0.5, -3.2, -1),
##D               OMGA=list(ETA[1] ~ 1, ETA[2] ~ 2, ETA[3] ~ 1));
##D 
##D ## Remove 0 concentrations (should be lloq)
##D 
##D d <- theo_sd[theo_sd$EVID==0 & theo_sd$DV>0 | theo_sd$EVID>0,];
##D 
##D fit1 <- foceiFit(d, inits, mypar2,mod,pred,err)
##D 
##D ## you can also fit lognormal data with the objective function on the same scale
##D 
##D errl <- function(){
##D     return(lnorm(0.1))
##D }
##D 
##D fit2 <- foceiFit(d, inits, mypar2,mod,pred,errl)
##D 
##D ## You can also use the standard nlmixr functions to run FOCEi
##D 
##D library(data.table);
##D datr <- Infusion_1CPT;
##D datr$EVID<-ifelse(datr$EVID==1,10101,datr$EVID)
##D datr<-data.table(datr)
##D datr<-datr[EVID!=2]
##D datro<-copy(datr)
##D datIV<-datr[AMT>0][,TIME:=TIME+AMT/RATE][,AMT:=-1*AMT]
##D datr<-rbind(datr,datIV)
##D 
##D one.compartment.IV.model <- function(){
##D   ini({ # Where initial conditions/variables are specified
##D     # '<-' or '=' defines population parameters
##D     # Simple numeric expressions are supported
##D     lCl <- 1.6      #log Cl (L/hr)
##D     lVc <- log(90)  #log V (L)
##D     # Bounds may be specified by c(lower, est, upper), like NONMEM:
##D     # Residuals errors are assumed to be population parameters
##D     prop.err <- c(0, 0.2, 1)
##D     # Between subject variability estimates are specified by '~'
##D     # Semicolons are optional
##D     eta.Vc ~ 0.1   #IIV V
##D     eta.Cl ~ 0.1; #IIV Cl
##D   })
##D   model({ # Where the model is specified
##D     # The model uses the ini-defined variable names
##D     Vc <- exp(lVc + eta.Vc)
##D     Cl <- exp(lCl + eta.Cl)
##D     # RxODE-style differential equations are supported
##D     d / dt(centr) = -(Cl / Vc) * centr;
##D     ## Concentration is calculated
##D     cp = centr / Vc;
##D     # And is assumed to follow proportional error estimated by prop.err
##D     cp ~ prop(prop.err)
##D    })}
##D 
##D fitIVp <- nlmixr(one.compartment.IV.model, datr, "focei");
##D 
##D ## You can also use the Cox-Box Transform of both sides with
##D ## proportional error (Donse 2016)
##D 
##D one.compartment.IV.model <- function(){
##D ini({ # Where initial conditions/variables are specified
##D     ## '<-' or '=' defines population parameters
##D     ## Simple numeric expressions are supported
##D     lCl <- 1.6      #log Cl (L/hr)
##D     lVc <- log(90)  #log V (L)
##D     ## Bounds may be specified by c(lower, est, upper), like NONMEM:
##D     ## Residuals errors are assumed to be population parameters
##D     prop.err <- c(0, 0.2, 1)
##D     add.err <- c(0, 0.001)
##D     lambda <- c(-2, 1, 2)
##D     zeta <- c(0.1, 1, 10)
##D     ## Between subject variability estimates are specified by '~'
##D     ## Semicolons are optional
##D     eta.Vc ~ 0.1   #IIV V
##D     eta.Cl ~ 0.1; #IIV Cl
##D })
##D model({ ## Where the model is specified
##D     ## The model uses the ini-defined variable names
##D     Vc <- exp(lVc + eta.Vc)
##D     Cl <- exp(lCl + eta.Cl)
##D     ## RxODE-style differential equations are supported
##D     d / dt(centr) = -(Cl / Vc) * centr;
##D     ## Concentration is calculated
##D     cp = centr / Vc;
##D     ## And is assumed to follow proportional error estimated by prop.err
##D     cp ~ pow(prop.err, zeta) + add(add.err) + boxCox(lambda)
##D })}
##D 
##D fitIVtbs <- nlmixr(one.compartment.IV.model, datr, "focei")
##D 
##D ## If you want to use a variance normalizing distribution with
##D ## negative/positive data you can use the Yeo-Johnson transformation
##D ## as well.  This is implemented by the yeoJohnson(lambda) function.
##D one.compartment.IV.model <- function(){
##D ini({ # Where initial conditions/variables are specified
##D     ## '<-' or '=' defines population parameters
##D     ## Simple numeric expressions are supported
##D     lCl <- 1.6      #log Cl (L/hr)
##D     lVc <- log(90)  #log V (L)
##D     ## Bounds may be specified by c(lower, est, upper), like NONMEM:
##D     ## Residuals errors are assumed to be population parameters
##D     prop.err <- c(0, 0.2, 1)
##D     delta <- c(0.1, 1, 10)
##D     add.err <- c(0, 0.001)
##D     lambda <- c(-2, 1, 2)
##D     ## Between subject variability estimates are specified by '~'
##D     ## Semicolons are optional
##D     eta.Vc ~ 0.1   #IIV V
##D     eta.Cl ~ 0.1; #IIV Cl
##D })
##D model({ ## Where the model is specified
##D     ## The model uses the ini-defined variable names
##D     Vc <- exp(lVc + eta.Vc)
##D     Cl <- exp(lCl + eta.Cl)
##D     ## RxODE-style differential equations are supported
##D     d / dt(centr) = -(Cl / Vc) * centr;
##D     ## Concentration is calculated
##D     cp = centr / Vc;
##D     ## And is assumed to follow proportional error estimated by prop.err
##D     cp ~ pow(prop.err, delta) + add(add.err) + yeoJohnson(lambda)
##D })}
##D 
##D fitIVyj <- nlmixr(one.compartment.IV.model, datr, "focei")
##D 
##D ## In addition to using L-BFGS-B for FOCEi (outer problem) you may
##D ## use other optimizers.  An example is below
##D 
##D one.cmt <- function() {
##D   ini({
##D       tka <- .5   # log Ka
##D       tcl <- -3.2 # log Cl
##D       tv <- -1    # log V
##D       eta.ka ~ 1
##D       eta.cl ~ 2
##D       eta.v ~ 1
##D       add.err <- 0.1
##D   })
##D   model({
##D       ka <- exp(tka + eta.ka)
##D       cl <- exp(tcl + eta.cl)
##D       v <- exp(tv + eta.v)
##D       linCmt() ~ add(add.err)
##D   })
##D }
##D 
##D fit <- nlmixr(one.cmt, theo_sd, "focei", foceiControl(outerOpt="bobyqa"))
##D 
##D ## You may also make an arbitrary optimizer work by adding a wrapper function:
##D 
##D newuoa0 <- function(par, fn, gr, lower = -Inf, upper = Inf, control = list(), ...){
##D   ## The function requires par, fn, gr, lower, upper and control
##D   ##
##D   ## The par, fn, gr, lower and upper and sent to the function from nlmixr's focei.
##D   ## The  control is the foceiControl list
##D   ##
##D   ##  The following code modifies the list control list for no warnings.
##D   .ctl <- control;
##D   if (is.null(.ctl$npt)) .ctl$npt <- length(par) * 2 + 1
##D   ## nlmixr will print information this is to suppress the printing from the
##D   ## optimizer
##D   .ctl$iprint <- 0L;
##D   .ctl <- .ctl[names(.ctl) %in% c("npt", "rhobeg", "rhoend", "iprint", "maxfun")];
##D   ## This does not require gradient and is an unbounded optimization:
##D   .ret <- minqa::newuoa(par, fn, control=.ctl);
##D   ## The return statement must be a list with:
##D   ##    - x for the final parameter message
##D   ##    - message for a minimization message
##D   ##    - convergence for a convergence code
##D   .ret$x <- .ret$par;
##D   .ret$message <- .ret$msg;
##D   .ret$convergence <- .ret$ierr
##D   ## you can access the final list from the optimization by fit$optReturn
##D   return(.ret);
##D }
##D 
##D fit <- nlmixr(one.cmt, theo_sd, "focei", foceiControl(outerOpt=newuoa0))
##D 
## End(Not run)




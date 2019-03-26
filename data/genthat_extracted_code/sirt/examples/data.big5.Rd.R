library(sirt)


### Name: data.big5
### Title: Dataset Big 5 from 'qgraph' Package
### Aliases: data.big5 data.big5.qgraph
### Keywords: datasets

### ** Examples

## Not run: 
##D # list of needed packages for the following examples
##D packages <- scan(what="character")
##D      sirt   TAM   eRm   CDM   mirt  ltm   mokken  psychotools  psychomix
##D      psych
##D 
##D # load packages. make an installation if necessary
##D miceadds::library_install(packages)
##D 
##D #############################################################################
##D # EXAMPLE 1: Unidimensional models openness scale
##D #############################################################################
##D 
##D data(data.big5)
##D # extract first 10 openness items
##D items <- which( substring( colnames(data.big5), 1, 1 )=="O"  )[1:10]
##D dat <- data.big5[, items ]
##D I <- ncol(dat)
##D summary(dat)
##D   ##   > colnames(dat)
##D   ##    [1] "O3"  "O8"  "O13" "O18" "O23" "O28" "O33" "O38" "O43" "O48"
##D # descriptive statistics
##D psych::describe(dat)
##D 
##D #****************
##D # Model 1: Partial credit model
##D #****************
##D 
##D #-- M1a: rm.facets (in sirt)
##D m1a <- sirt::rm.facets( dat )
##D summary(m1a)
##D 
##D #-- M1b: tam.mml (in TAM)
##D m1b <- TAM::tam.mml( resp=dat )
##D summary(m1b)
##D 
##D #-- M1c: gdm (in CDM)
##D theta.k <- seq(-6,6,len=21)
##D m1c <- CDM::gdm( dat, irtmodel="1PL",theta.k=theta.k, skillspace="normal")
##D summary(m1c)
##D # compare results with loglinear skillspace
##D m1c2 <- CDM::gdm( dat, irtmodel="1PL",theta.k=theta.k, skillspace="loglinear")
##D summary(m1c2)
##D 
##D #-- M1d: PCM (in eRm)
##D m1d <- eRm::PCM( dat )
##D summary(m1d)
##D 
##D #-- M1e: gpcm (in ltm)
##D m1e <- ltm::gpcm( dat, constraint="1PL", control=list(verbose=TRUE))
##D summary(m1e)
##D 
##D #-- M1f: mirt (in mirt)
##D m1f <- mirt::mirt( dat, model=1, itemtype="1PL", verbose=TRUE)
##D summary(m1f)
##D coef(m1f)
##D 
##D #-- M1g: PCModel.fit (in psychotools)
##D mod1g <- psychotools::PCModel.fit(dat)
##D summary(mod1g)
##D plot(mod1g)
##D 
##D #****************
##D # Model 2: Generalized partial credit model
##D #****************
##D 
##D #-- M2a: rm.facets (in sirt)
##D m2a <- sirt::rm.facets( dat, est.a.item=TRUE)
##D summary(m2a)
##D # Note that in rm.facets the mean of item discriminations is fixed to 1
##D 
##D #-- M2b: tam.mml.2pl (in TAM)
##D m2b <- TAM::tam.mml.2pl( resp=dat, irtmodel="GPCM")
##D summary(m2b)
##D 
##D #-- M2c: gdm (in CDM)
##D m2c <- CDM::gdm( dat, irtmodel="2PL",theta.k=seq(-6,6,len=21),
##D                    skillspace="normal", standardized.latent=TRUE)
##D summary(m2c)
##D 
##D #-- M2d: gpcm (in ltm)
##D m2d <- ltm::gpcm( dat, control=list(verbose=TRUE))
##D summary(m2d)
##D 
##D #-- M2e: mirt (in mirt)
##D m2e <- mirt::mirt( dat, model=1,  itemtype="GPCM", verbose=TRUE)
##D summary(m2e)
##D coef(m2e)
##D 
##D #****************
##D # Model 3: Nonparametric item response model
##D #****************
##D 
##D #-- M3a: ISOP and ADISOP model - isop.poly (in sirt)
##D m3a <- sirt::isop.poly( dat )
##D summary(m3a)
##D plot(m3a)
##D 
##D #-- M3b: Mokken scale analysis (in mokken)
##D # Scalability coefficients
##D mokken::coefH(dat)
##D # Assumption of monotonicity
##D monotonicity.list <- mokken::check.monotonicity(dat)
##D summary(monotonicity.list)
##D plot(monotonicity.list)
##D # Assumption of non-intersecting ISRFs using method restscore
##D restscore.list <- mokken::check.restscore(dat)
##D summary(restscore.list)
##D plot(restscore.list)
##D 
##D #****************
##D # Model 4: Graded response model
##D #****************
##D 
##D #-- M4a: mirt (in mirt)
##D m4a <- mirt::mirt( dat, model=1,  itemtype="graded", verbose=TRUE)
##D print(m4a)
##D mirt.wrapper.coef(m4a)
##D 
##D #----  M4b: WLSMV estimation with cfa (in lavaan)
##D lavmodel <- "F=~ O3__O48
##D              F ~~ 1*F
##D                 "
##D # transform lavaan syntax with lavaanify.IRT
##D lavmodel <- TAM::lavaanify.IRT( lavmodel, items=colnames(dat) )$lavaan.syntax
##D mod4b <- lavaan::cfa( data=as.data.frame(dat), model=lavmodel, std.lv=TRUE,
##D                  ordered=colnames(dat),  parameterization="theta")
##D summary(mod4b, standardized=TRUE, fit.measures=TRUE, rsquare=TRUE)
##D coef(mod4b)
##D 
##D #****************
##D # Model 5: Normally distributed residuals
##D #****************
##D 
##D #----  M5a: cfa (in lavaan)
##D lavmodel <- "F=~ O3__O48
##D              F ~~ 1*F
##D              F ~ 0*1
##D              O3__O48 ~ 1
##D                 "
##D lavmodel <- TAM::lavaanify.IRT( lavmodel, items=colnames(dat) )$lavaan.syntax
##D mod5a <- lavaan::cfa( data=as.data.frame(dat), model=lavmodel, std.lv=TRUE,
##D                  estimator="MLR" )
##D summary(mod5a, standardized=TRUE, fit.measures=TRUE, rsquare=TRUE)
##D 
##D #----  M5b: mirt (in mirt)
##D 
##D # create user defined function
##D name <- 'normal'
##D par <- c("d"=1, "a1"=0.8, "vy"=1)
##D est <- c(TRUE, TRUE,FALSE)
##D P.normal <- function(par,Theta,ncat){
##D      d <- par[1]
##D      a1 <- par[2]
##D      vy <- par[3]
##D      psi <- vy - a1^2
##D      # expected values given Theta
##D      mui <- a1*Theta[,1] + d
##D      TP <- nrow(Theta)
##D      probs <- matrix( NA, nrow=TP, ncol=ncat )
##D      eps <- .01
##D      for (cc in 1:ncat){
##D         probs[,cc] <- stats::dnorm( cc, mean=mui, sd=sqrt( abs( psi + eps) ) )
##D                     }
##D      psum <- matrix( rep(rowSums( probs ),each=ncat), nrow=TP, ncol=ncat, byrow=TRUE)
##D      probs <- probs / psum
##D      return(probs)
##D }
##D 
##D # create item response function
##D normal <- mirt::createItem(name, par=par, est=est, P=P.normal)
##D customItems <- list("normal"=normal)
##D itemtype <- rep( "normal",I)
##D # define parameters to be estimated
##D mod5b.pars <- mirt::mirt(dat, 1, itemtype=itemtype,
##D                    customItems=customItems, pars="values")
##D ind <- which( mod5b.pars$name=="vy")
##D vy <- apply( dat, 2, var, na.rm=TRUE )
##D mod5b.pars[ ind, "value" ] <- vy
##D ind <- which( mod5b.pars$name=="a1")
##D mod5b.pars[ ind, "value" ] <- .5* sqrt(vy)
##D ind <- which( mod5b.pars$name=="d")
##D mod5b.pars[ ind, "value" ] <- colMeans( dat, na.rm=TRUE )
##D 
##D # estimate model
##D mod5b <- mirt::mirt(dat, 1, itemtype=itemtype, customItems=customItems,
##D                  pars=mod5b.pars, verbose=TRUE    )
##D sirt::mirt.wrapper.coef(mod5b)$coef
##D 
##D # some item plots
##D     par(ask=TRUE)
##D plot(mod5b, type='trace', layout=c(1,1))
##D     par(ask=FALSE)
##D # Alternatively:
##D sirt::mirt.wrapper.itemplot(mod5b)
## End(Not run)




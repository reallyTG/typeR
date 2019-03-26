library(sirt)


### Name: data.read
### Title: Dataset Reading
### Aliases: data.read
### Keywords: datasets

### ** Examples

## Not run: 
##D data(data.read)
##D dat <- data.read
##D I <- ncol(dat)
##D 
##D # list of needed packages for the following examples
##D packages <- scan(what="character")
##D      eRm  ltm  TAM mRm  CDM  mirt psychotools  IsingFit  igraph  qgraph  pcalg
##D      poLCA  randomLCA psychomix MplusAutomation lavaan
##D 
##D # load packages. make an installation if necessary
##D miceadds::library_install(packages)
##D 
##D #*****************************************************
##D # Model 1: Rasch model
##D #*****************************************************
##D 
##D #----  M1a: rasch.mml2 (in sirt)
##D mod1a <- sirt::rasch.mml2(dat)
##D summary(mod1a)
##D 
##D #----  M1b: smirt (in sirt)
##D Qmatrix <- matrix(1,nrow=I, ncol=1)
##D mod1b <- sirt::smirt(dat,Qmatrix=Qmatrix)
##D summary(mod1b)
##D 
##D #----  M1c: gdm (in CDM)
##D theta.k <- seq(-6,6,len=21)
##D mod1c <- CDM::gdm(dat,theta.k=theta.k,irtmodel="1PL", skillspace="normal")
##D summary(mod1c)
##D 
##D #----  M1d: tam.mml (in TAM)
##D mod1d <- TAM::tam.mml( resp=dat )
##D summary(mod1d)
##D 
##D #----  M1e: RM (in eRm)
##D mod1e <- eRm::RM( dat )
##D   # eRm uses Conditional Maximum Likelihood (CML) as the estimation method.
##D summary(mod1e)
##D eRm::plotPImap(mod1e)
##D 
##D #----  M1f: mrm (in mRm)
##D mod1f <- mRm::mrm( dat, cl=1)   # CML estimation
##D mod1f$beta  # item parameters
##D 
##D #----  M1g: mirt (in mirt)
##D mod1g <- mirt::mirt( dat, model=1, itemtype="Rasch", verbose=TRUE )
##D print(mod1g)
##D summary(mod1g)
##D coef(mod1g)
##D     # arrange coefficients in nicer layout
##D sirt::mirt.wrapper.coef(mod1g)$coef
##D 
##D #----  M1h: rasch (in ltm)
##D mod1h <- ltm::rasch( dat, control=list(verbose=TRUE ) )
##D summary(mod1h)
##D coef(mod1h)
##D 
##D #----  M1i: RaschModel.fit (in psychotools)
##D mod1i <- psychotools::RaschModel.fit(dat)  # CML estimation
##D summary(mod1i)
##D plot(mod1i)
##D 
##D #----  M1j: noharm.sirt (in sirt)
##D Fpatt <- matrix( 0, I, 1 )
##D Fval <- 1 + 0*Fpatt
##D Ppatt <- Pval <- matrix(1,1,1)
##D mod1j <- sirt::noharm.sirt( dat=dat, Ppatt=Ppatt, Fpatt=Fpatt, Fval=Fval, Pval=Pval)
##D summary(mod1j)
##D   #   Normal-ogive model, multiply item discriminations with constant D=1.7.
##D   #   The same holds for other examples with noharm.sirt and R2noharm.
##D plot(mod1j)
##D 
##D #----  M1k: rasch.pml3 (in sirt)
##D mod1k <- sirt::rasch.pml3( dat=dat)
##D   #         pairwise marginal maximum likelihood estimation
##D summary(mod1k)
##D 
##D #----  M1l: running Mplus (using MplusAutomation package)
##D mplus_path <- "c:/Mplus7/Mplus.exe"    # locate Mplus executable
##D #****************
##D   # specify Mplus object
##D mplusmod <- MplusAutomation::mplusObject(
##D     TITLE="1PL in Mplus ;",
##D     VARIABLE=paste0( "CATEGORICAL ARE ", paste0(colnames(dat),collapse=" ") ),
##D     MODEL="
##D        ! fix all item loadings to 1
##D        F1 BY A1@1 A2@1 A3@1 A4@1 ;
##D        F1 BY B1@1 B2@1 B3@1 B4@1 ;
##D        F1 BY C1@1 C2@1 C3@1 C4@1 ;
##D        ! estimate variance
##D        F1 ;
##D             ",
##D     ANALYSIS="ESTIMATOR=MLR;",
##D     OUTPUT="stand;",
##D     usevariables=colnames(dat),  rdata=dat )
##D #****************
##D 
##D   # write Mplus syntax
##D filename <- "mod1u"   # specify file name
##D   # create Mplus syntaxes
##D res2 <- MplusAutomation::mplusModeler(object=mplusmod, dataout=paste0(filename,".dat"),
##D                modelout=paste0(filename,".inp"), run=0 )
##D   # run Mplus model
##D MplusAutomation::runModels( filefilter=paste0(filename,".inp"), Mplus_command=mplus_path)
##D   # alternatively, the system() command can also be used
##D   # get results
##D mod1l <- MplusAutomation::readModels(target=getwd(), filefilter=filename )
##D mod1l$summaries    # summaries
##D mod1l$parameters$unstandardized   # parameter estimates
##D 
##D #*****************************************************
##D # Model 2: 2PL model
##D #*****************************************************
##D 
##D #----  M2a: rasch.mml2 (in sirt)
##D mod2a <- sirt::rasch.mml2(dat, est.a=1:I)
##D summary(mod2a)
##D 
##D #----  M2b: smirt (in sirt)
##D mod2b <- sirt::smirt(dat,Qmatrix=Qmatrix,est.a="2PL")
##D summary(mod2b)
##D 
##D #----  M2c: gdm (in CDM)
##D mod2c <- CDM::gdm(dat,theta.k=theta.k,irtmodel="2PL", skillspace="normal")
##D summary(mod2c)
##D 
##D #----  M2d: tam.mml (in TAM)
##D mod2d <- TAM::tam.mml.2pl( resp=dat )
##D summary(mod2d)
##D 
##D #----  M2e: mirt (in mirt)
##D mod2e <- mirt::mirt( dat, model=1, itemtype="2PL" )
##D print(mod2e)
##D summary(mod2e)
##D sirt::mirt.wrapper.coef(mod1g)$coef
##D 
##D #----  M2f: ltm (in ltm)
##D mod2f <- ltm::ltm( dat ~ z1, control=list(verbose=TRUE ) )
##D summary(mod2f)
##D coef(mod2f)
##D plot(mod2f)
##D 
##D #----  M2g: R2noharm (in NOHARM, running from within R using sirt package)
##D   # define noharm.path where 'NoharmCL.exe' is located
##D noharm.path <- "c:/NOHARM"
##D   # covariance matrix
##D P.pattern <- matrix( 1, ncol=1, nrow=1 )
##D P.init <- P.pattern
##D P.init[1,1] <- 1
##D   # loading matrix
##D F.pattern <- matrix(1,I,1)
##D F.init <- F.pattern
##D   # estimate model
##D mod2g <- sirt::R2noharm( dat=dat, model.type="CFA", F.pattern=F.pattern,
##D              F.init=F.init, P.pattern=P.pattern, P.init=P.init,
##D              writename="ex2g", noharm.path=noharm.path, dec="," )
##D summary(mod2g)
##D 
##D #----  M2h: noharm.sirt (in sirt)
##D mod2h <- sirt::noharm.sirt( dat=dat, Ppatt=P.pattern,Fpatt=F.pattern,
##D               Fval=F.init, Pval=P.init )
##D summary(mod2h)
##D plot(mod2h)
##D 
##D #----  M2i: rasch.pml2 (in sirt)
##D mod2i <- sirt::rasch.pml2(dat, est.a=1:I)
##D summary(mod2i)
##D 
##D #----  M2j: WLSMV estimation with cfa (in lavaan)
##D lavmodel <- "F=~ A1+A2+A3+A4+B1+B2+B3+B4+
##D                         C1+C2+C3+C4"
##D mod2j <- lavaan::cfa( data=dat, model=lavmodel, std.lv=TRUE, ordered=colnames(dat))
##D summary(mod2j, standardized=TRUE, fit.measures=TRUE, rsquare=TRUE)
##D 
##D #*****************************************************
##D # Model 3: 3PL model (note that results can be quite unstable!)
##D #*****************************************************
##D 
##D #----  M3a: rasch.mml2 (in sirt)
##D mod3a <- sirt::rasch.mml2(dat, est.a=1:I, est.c=1:I)
##D summary(mod3a)
##D 
##D #----  M3b: smirt (in sirt)
##D mod3b <- sirt::smirt(dat,Qmatrix=Qmatrix,est.a="2PL", est.c=1:I)
##D summary(mod3b)
##D 
##D #----  M3c: mirt (in mirt)
##D mod3c <- mirt::mirt( dat, model=1, itemtype="3PL", verbose=TRUE)
##D summary(mod3c)
##D coef(mod3c)
##D   # stabilize parameter estimating using informative priors for guessing parameters
##D mirtmodel <- mirt::mirt.model("
##D             F=1-12
##D             PRIOR=(1-12, g, norm, -1.38, 0.25)
##D             ")
##D   # a prior N(-1.38,.25) is specified for transformed guessing parameters: qlogis(g)
##D   # simulate values from this prior for illustration
##D N <- 100000
##D logit.g <- stats::rnorm(N, mean=-1.38, sd=sqrt(.5) )
##D graphics::plot( stats::density(logit.g) )  # transformed qlogis(g)
##D graphics::plot( stats::density( stats::plogis(logit.g)) )  # g parameters
##D   # estimate 3PL with priors
##D mod3c1 <- mirt::mirt(dat, mirtmodel, itemtype="3PL",verbose=TRUE)
##D coef(mod3c1)
##D   # In addition, set upper bounds for g parameters of .35
##D mirt.pars <- mirt::mirt( dat, mirtmodel, itemtype="3PL",  pars="values")
##D ind <- which( mirt.pars$name=="g" )
##D mirt.pars[ ind, "value" ] <- stats::plogis(-1.38)
##D mirt.pars[ ind, "ubound" ] <- .35
##D   # prior distribution for slopes
##D ind <- which( mirt.pars$name=="a1" )
##D mirt.pars[ ind, "prior_1" ] <- 1.3
##D mirt.pars[ ind, "prior_2" ] <- 2
##D mod3c2 <- mirt::mirt(dat, mirtmodel, itemtype="3PL",
##D                 pars=mirt.pars,verbose=TRUE, technical=list(NCYCLES=100) )
##D coef(mod3c2)
##D sirt::mirt.wrapper.coef(mod3c2)
##D 
##D #----  M3d: ltm (in ltm)
##D mod3d <- ltm::tpm( dat, control=list(verbose=TRUE), max.guessing=.3)
##D summary(mod3d)
##D coef(mod3d) #=> numerical instabilities
##D 
##D #*****************************************************
##D # Model 4: 3-dimensional Rasch model
##D #*****************************************************
##D 
##D # define Q-matrix
##D Q <- matrix( 0, nrow=12, ncol=3 )
##D Q[ cbind(1:12, rep(1:3,each=4) ) ] <- 1
##D rownames(Q) <- colnames(dat)
##D colnames(Q) <- c("A","B","C")
##D 
##D # define nodes
##D theta.k <- seq(-6,6,len=13)
##D 
##D #----  M4a: smirt (in sirt)
##D mod4a <- sirt::smirt(dat,Qmatrix=Q,irtmodel="comp", theta.k=theta.k, maxiter=30)
##D summary(mod4a)
##D 
##D #----  M4b: rasch.mml2 (in sirt)
##D mod4b <- sirt::rasch.mml2(dat,Q=Q,theta.k=theta.k, mmliter=30)
##D summary(mod4b)
##D 
##D #----  M4c: gdm (in CDM)
##D mod4c <- CDM::gdm( dat, irtmodel="1PL", theta.k=theta.k, skillspace="normal",
##D             Qmatrix=Q, maxiter=30, centered.latent=TRUE )
##D summary(mod4c)
##D 
##D #----  M4d: tam.mml (in TAM)
##D mod4d <- TAM::tam.mml( resp=dat, Q=Q, control=list(nodes=theta.k, maxiter=30) )
##D summary(mod4d)
##D 
##D #----  M4e: R2noharm (in NOHARM, running from within R using sirt package)
##D noharm.path <- "c:/NOHARM"
##D   # covariance matrix
##D P.pattern <- matrix( 1, ncol=3, nrow=3 )
##D P.init <- 0.8+0*P.pattern
##D diag(P.init) <- 1
##D   # loading matrix
##D F.pattern <- 0*Q
##D F.init <- Q
##D   # estimate model
##D mod4e <- sirt::R2noharm( dat=dat, model.type="CFA", F.pattern=F.pattern,
##D     F.init=F.init, P.pattern=P.pattern, P.init=P.init,
##D     writename="ex4e", noharm.path=noharm.path, dec="," )
##D summary(mod4e)
##D 
##D #----  M4f: mirt (in mirt)
##D cmodel <- mirt::mirt.model("
##D      F1=1-4
##D      F2=5-8
##D      F3=9-12
##D      # equal item slopes correspond to the Rasch model
##D      CONSTRAIN=(1-4, a1), (5-8, a2), (9-12,a3)
##D      COV=F1*F2, F1*F3, F2*F3
##D      " )
##D mod4f <- mirt::mirt(dat, cmodel, verbose=TRUE)
##D summary(mod4f)
##D 
##D #*****************************************************
##D # Model 5: 3-dimensional 2PL model
##D #*****************************************************
##D 
##D #----  M5a: smirt (in sirt)
##D mod5a <- sirt::smirt(dat,Qmatrix=Q,irtmodel="comp", est.a="2PL", theta.k=theta.k,
##D                  maxiter=30)
##D summary(mod5a)
##D 
##D #----  M5b: rasch.mml2 (in sirt)
##D mod5b <- sirt::rasch.mml2(dat,Q=Q,theta.k=theta.k,est.a=1:12, mmliter=30)
##D summary(mod5b)
##D 
##D #----  M5c: gdm (in CDM)
##D mod5c <- CDM::gdm( dat, irtmodel="2PL", theta.k=theta.k, skillspace="loglinear",
##D             Qmatrix=Q, maxiter=30, centered.latent=TRUE,
##D             standardized.latent=TRUE)
##D summary(mod5c)
##D 
##D #----  M5d: tam.mml (in TAM)
##D mod5d <- TAM::tam.mml.2pl( resp=dat, Q=Q, control=list(nodes=theta.k, maxiter=30) )
##D summary(mod5d)
##D 
##D #----  M5e: R2noharm (in NOHARM, running from within R using sirt package)
##D noharm.path <- "c:/NOHARM"
##D   # covariance matrix
##D P.pattern <- matrix( 1, ncol=3, nrow=3 )
##D diag(P.pattern) <- 0
##D P.init <- 0.8+0*P.pattern
##D diag(P.init) <- 1
##D   # loading matrix
##D F.pattern <- Q
##D F.init <- Q
##D   # estimate model
##D mod5e <- sirt::R2noharm( dat=dat, model.type="CFA", F.pattern=F.pattern,
##D     F.init=F.init, P.pattern=P.pattern, P.init=P.init,
##D     writename="ex5e", noharm.path=noharm.path, dec="," )
##D summary(mod5e)
##D 
##D #----  M5f: mirt (in mirt)
##D cmodel <- mirt::mirt.model("
##D    F1=1-4
##D    F2=5-8
##D    F3=9-12
##D    COV=F1*F2, F1*F3, F2*F3
##D    "  )
##D mod5f <- mirt::mirt(dat, cmodel, verbose=TRUE)
##D summary(mod5f)
##D 
##D #*****************************************************
##D # Model 6: Network models (Graphical models)
##D #*****************************************************
##D 
##D #----  M6a: Ising model using the IsingFit package (undirected graph)
##D #        - fit Ising model using the "OR rule" (AND=FALSE)
##D mod6a <- IsingFit::IsingFit(x=dat, family="binomial", AND=FALSE)
##D summary(mod6a)
##D ##           Network Density:                 0.29
##D ##    Gamma:                  0.25
##D ##    Rule used:              Or-rule
##D # plot results
##D qgraph::qgraph(mod6a$weiadj,fade=FALSE)
##D 
##D #**-- graph estimation using pcalg package
##D 
##D # some packages from Bioconductor must be downloaded at first (if not yet done)
##D if (FALSE){  # set 'if (TRUE)' if packages should be downloaded
##D      source("http://bioconductor.org/biocLite.R")
##D      biocLite("RBGL")
##D      biocLite("Rgraphviz")
##D }
##D 
##D #----  M6b: graph estimation based on Pearson correlations
##D V <- colnames(dat)
##D n <- nrow(dat)
##D mod6b <- pcalg::pc(suffStat=list(C=stats::cor(dat), n=n ),
##D              indepTest=gaussCItest, ## indep.test: partial correlations
##D              alpha=0.05, labels=V, verbose=TRUE)
##D plot(mod6b)
##D # plot in qgraph package
##D qgraph::qgraph(mod6b, label.color=rep( c( "red", "blue","darkgreen" ), each=4 ),
##D          edge.color="black")
##D summary(mod6b)
##D 
##D #----  M6c: graph estimation based on tetrachoric correlations
##D mod6c <- pcalg::pc(suffStat=list(C=sirt::tetrachoric2(dat)$rho, n=n ),
##D              indepTest=gaussCItest, alpha=0.05, labels=V, verbose=TRUE)
##D plot(mod6c)
##D summary(mod6c)
##D 
##D #----  M6d: Statistical implicative analysis (in sirt)
##D mod6d <- sirt::sia.sirt(dat, significance=.85 )
##D   # plot results with igraph and qgraph package
##D plot( mod6d$igraph.obj, vertex.shape="rectangle", vertex.size=30 )
##D qgraph::qgraph( mod6d$adj.matrix )
##D 
##D #*****************************************************
##D # Model 7: Latent class analysis with 3 classes
##D #*****************************************************
##D 
##D #----  M7a: randomLCA (in randomLCA)
##D   #        - use two trials of starting values
##D mod7a <- randomLCA::randomLCA(dat,nclass=3, notrials=2, verbose=TRUE)
##D summary(mod7a)
##D plot(mod7a,type="l", xlab="Item")
##D 
##D #----  M7b: rasch.mirtlc (in sirt)
##D mod7b <- sirt::rasch.mirtlc( dat, Nclasses=3,seed=-30,  nstarts=2 )
##D summary(mod7b)
##D matplot( t(mod7b$pjk), type="l", xlab="Item" )
##D 
##D #----  M7c: poLCA (in poLCA)
##D   #   define formula for outcomes
##D f7c <- paste0( "cbind(", paste0(colnames(dat),collapse=","), ") ~ 1 " )
##D dat1 <- as.data.frame( dat + 1 ) # poLCA needs integer values from 1,2,..
##D mod7c <- poLCA::poLCA( stats::as.formula(f7c),dat1,nclass=3, verbose=TRUE)
##D plot(mod7c)
##D 
##D #----  M7d: gom.em (in sirt)
##D   #    - the latent class model is a special grade of membership model
##D mod7d <- sirt::gom.em( dat, K=3, problevels=c(0,1),  model="GOM"  )
##D summary(mod7d)
##D 
##D #---- - M7e: mirt (in mirt)
##D   # define three latent classes
##D Theta <- diag(3)
##D   # define mirt model
##D I <- ncol(dat)  # I=12
##D mirtmodel <- mirt::mirt.model("
##D         C1=1-12
##D         C2=1-12
##D         C3=1-12
##D         ")
##D   # get initial parameter values
##D mod.pars <- mirt::mirt(dat, model=mirtmodel,  pars="values")
##D   # modify parameters: only slopes refer to item-class probabilities
##D set.seed(9976)
##D   # set starting values for class specific item probabilities
##D mod.pars[ mod.pars$name=="d","value" ]  <- 0
##D mod.pars[ mod.pars$name=="d","est" ]  <- FALSE
##D b1 <- stats::qnorm( colMeans( dat ) )
##D mod.pars[ mod.pars$name=="a1","value" ]  <- b1
##D   # random starting values for other classes
##D mod.pars[ mod.pars$name %in% c("a2","a3"),"value" ]  <- b1 + stats::runif(12*2,-1,1)
##D mod.pars
##D   #** define prior for latent class analysis
##D lca_prior <- function(Theta,Etable){
##D   # number of latent Theta classes
##D   TP <- nrow(Theta)
##D   # prior in initial iteration
##D   if ( is.null(Etable) ){
##D     prior <- rep( 1/TP, TP )
##D   }
##D   # process Etable (this is correct for datasets without missing data)
##D   if ( ! is.null(Etable) ){
##D     # sum over correct and incorrect expected responses
##D     prior <- ( rowSums(Etable[, seq(1,2*I,2)]) + rowSums(Etable[,seq(2,2*I,2)]) )/I
##D   }
##D   prior <- prior / sum(prior)
##D   return(prior)
##D }
##D   #** estimate model
##D mod7e <- mirt::mirt(dat, mirtmodel, pars=mod.pars, verbose=TRUE,
##D             technical=list( customTheta=Theta, customPriorFun=lca_prior) )
##D   # compare estimated results
##D print(mod7e)
##D summary(mod7b)
##D   # The number of estimated parameters is incorrect because mirt does not correctly count
##D   # estimated parameters from the user customized  prior distribution.
##D mod7e@nest <- as.integer(sum(mod.pars$est) + 2)  # two additional class probabilities
##D   # extract log-likelihood
##D mod7e@logLik
##D   # compute AIC and BIC
##D ( AIC <- -2*mod7e@logLik+2*mod7e@nest )
##D ( BIC <- -2*mod7e@logLik+log(mod7e@Data$N)*mod7e@nest )
##D   # RMSEA and SRMSR fit statistic
##D mirt::M2(mod7e)     # TLI and CFI does not make sense in this example
##D   #** extract item parameters
##D sirt::mirt.wrapper.coef(mod7e)
##D   #** extract class-specific item-probabilities
##D probs <- apply( coef1[, c("a1","a2","a3") ], 2, stats::plogis )
##D matplot( probs, type="l", xlab="Item", main="mirt::mirt")
##D   #** inspect estimated distribution
##D mod7e@Theta
##D mod7e@Prior[[1]]
##D 
##D #*****************************************************
##D # Model 8: Mixed Rasch model with two classes
##D #*****************************************************
##D 
##D #----  M8a: raschmix (in psychomix)
##D mod8a <- psychomix::raschmix(data=as.matrix(dat), k=2, scores="saturated")
##D summary(mod8a)
##D 
##D #----  M8b: mrm (in mRm)
##D mod8b <- mRm::mrm(data.matrix=dat, cl=2)
##D mod8b$conv.to.bound
##D plot(mod8b)
##D print(mod8b)
##D 
##D #----  M8c: mirt (in mirt)
##D   #* define theta grid
##D theta.k <- seq( -5, 5, len=9 )
##D TP <- length(theta.k)
##D Theta <- matrix( 0, nrow=2*TP, ncol=4)
##D Theta[1:TP,1:2] <- cbind(theta.k, 1 )
##D Theta[1:TP + TP,3:4] <- cbind(theta.k, 1 )
##D Theta
##D   # define model
##D I <- ncol(dat)  # I=12
##D mirtmodel <- mirt::mirt.model("
##D         F1a=1-12  # slope Class 1
##D         F1b=1-12  # difficulty Class 1
##D         F2a=1-12  # slope Class 2
##D         F2b=1-12  # difficulty Class 2
##D         CONSTRAIN=(1-12,a1),(1-12,a3)
##D         ")
##D   # get initial parameter values
##D mod.pars <- mirt::mirt(dat, model=mirtmodel,  pars="values")
##D   # set starting values for class specific item probabilities
##D mod.pars[ mod.pars$name=="d","value" ]  <- 0
##D mod.pars[ mod.pars$name=="d","est" ]  <- FALSE
##D mod.pars[ mod.pars$name=="a1","value" ]  <- 1
##D mod.pars[ mod.pars$name=="a3","value" ]  <- 1
##D   # initial values difficulties
##D b1 <-  stats::qlogis( colMeans(dat) )
##D mod.pars[ mod.pars$name=="a2","value" ]  <- b1
##D mod.pars[ mod.pars$name=="a4","value" ]  <- b1 + stats::runif(I, -1, 1)
##D   #* define prior for mixed Rasch analysis
##D mixed_prior <- function(Theta,Etable){
##D   NC <- 2   # number of theta classes
##D   TP <- nrow(Theta) / NC
##D   prior1 <- stats::dnorm( Theta[1:TP,1] )
##D   prior1 <- prior1 / sum(prior1)
##D   if ( is.null(Etable) ){   prior <- c( prior1, prior1 ) }
##D   if ( ! is.null(Etable) ){
##D     prior <- ( rowSums( Etable[, seq(1,2*I,2)] ) +
##D                    rowSums( Etable[,seq(2,2*I,2)]) )/I
##D     a1 <- stats::aggregate( prior, list( rep(1:NC, each=TP) ), sum )
##D     a1[,2] <- a1[,2] / sum( a1[,2])
##D     # print some information during estimation
##D     cat( paste0( " Class proportions: ",
##D               paste0( round(a1[,2], 3 ), collapse=" " ) ), "\n")
##D     a1 <- rep( a1[,2], each=TP )
##D     # specify mixture of two normal distributions
##D     prior <- a1*c(prior1,prior1)
##D   }
##D   prior <- prior / sum(prior)
##D   return(prior)
##D }
##D   #* estimate model
##D mod8c <- mirt::mirt(dat, mirtmodel, pars=mod.pars, verbose=TRUE,
##D         technical=list(  customTheta=Theta, customPriorFun=mixed_prior ) )
##D   # Like in Model 7e, the number of estimated parameters must be included.
##D mod8c@nest <- as.integer(sum(mod.pars$est) + 1)
##D       # two class proportions and therefore one probability is freely estimated.
##D   #* extract item parameters
##D sirt::mirt.wrapper.coef(mod8c)
##D   #* estimated distribution
##D mod8c@Theta
##D mod8c@Prior
##D 
##D #----  M8d: tamaan (in TAM)
##D 
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=MIXTURE ;
##D   NCLASSES(2);
##D   NSTARTS(7,20);
##D LAVAAN MODEL:
##D   F=~ A1__C4
##D   F ~~ F
##D ITEM TYPE:
##D   ALL(Rasch);
##D     "
##D mod8d <- TAM::tamaan( tammodel, resp=dat )
##D summary(mod8d)
##D # plot item parameters
##D I <- 12
##D ipars <- mod8d$itempartable_MIXTURE[ 1:I, ]
##D plot( 1:I, ipars[,3], type="o", ylim=range( ipars[,3:4] ), pch=16,
##D         xlab="Item", ylab="Item difficulty")
##D lines( 1:I, ipars[,4], type="l", col=2, lty=2)
##D points( 1:I, ipars[,4],  col=2, pch=2)
##D 
##D #*****************************************************
##D # Model 9: Mixed 2PL model with two classes
##D #*****************************************************
##D 
##D #----  M9a: tamaan (in TAM)
##D 
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=MIXTURE ;
##D   NCLASSES(2);
##D   NSTARTS(10,30);
##D LAVAAN MODEL:
##D   F=~ A1__C4
##D   F ~~ F
##D ITEM TYPE:
##D   ALL(2PL);
##D     "
##D mod9a <- TAM::tamaan( tammodel, resp=dat )
##D summary(mod9a)
##D 
##D #*****************************************************
##D # Model 10: Rasch testlet model
##D #*****************************************************
##D 
##D #----  M10a: tam.fa (in TAM)
##D dims <- substring( colnames(dat),1,1 )  # define dimensions
##D mod10a <- TAM::tam.fa( resp=dat, irtmodel="bifactor1", dims=dims,
##D                 control=list(maxiter=60) )
##D summary(mod10a)
##D 
##D #----  M10b: mirt (in mirt)
##D cmodel <- mirt::mirt.model("
##D         G=1-12
##D         A=1-4
##D         B=5-8
##D         C=9-12
##D         CONSTRAIN=(1-12,a1), (1-4, a2), (5-8, a3), (9-12,a4)
##D       ")
##D mod10b <- mirt::mirt(dat, model=cmodel, verbose=TRUE)
##D summary(mod10b)
##D coef(mod10b)
##D mod10b@logLik   # equivalent is slot( mod10b, "logLik")
##D 
##D #alternatively, using a dimensional reduction approach (faster and better accuracy)
##D cmodel <- mirt::mirt.model("
##D       G=1-12
##D       CONSTRAIN=(1-12,a1), (1-4, a2), (5-8, a3), (9-12,a4)
##D      ")
##D item_bundles <- rep(c(1,2,3), each=4)
##D mod10b1 <- mirt::bfactor(dat, model=item_bundles, model2=cmodel, verbose=TRUE)
##D coef(mod10b1)
##D 
##D #----  M10c: smirt (in sirt)
##D   # define Q-matrix
##D Qmatrix <- matrix(0,12,4)
##D Qmatrix[,1] <- 1
##D Qmatrix[ cbind( 1:12, match( dims, unique(dims)) +1 ) ]  <- 1
##D   # uncorrelated factors
##D variance.fixed <- cbind( c(1,1,1,2,2,3), c(2,3,4,3,4,4), 0 )
##D   # estimate model
##D mod10c <- sirt::smirt( dat, Qmatrix=Qmatrix, irtmodel="comp",
##D               variance.fixed=variance.fixed, qmcnodes=1000, maxiter=60)
##D summary(mod10c)
##D 
##D #*****************************************************
##D # Model 11: Bifactor model
##D #*****************************************************
##D 
##D #----  M11a: tam.fa (in TAM)
##D dims <- substring( colnames(dat),1,1 )  # define dimensions
##D mod11a <- TAM::tam.fa( resp=dat, irtmodel="bifactor2", dims=dims,
##D                  control=list(maxiter=60) )
##D summary(mod11a)
##D 
##D #----  M11b: bfactor (in mirt)
##D dims1 <- match( dims, unique(dims) )
##D mod11b <- mirt::bfactor(dat, model=dims1, verbose=TRUE)
##D summary(mod11b)
##D coef(mod11b)
##D mod11b@logLik
##D 
##D #----  M11c: smirt (in sirt)
##D   # define Q-matrix
##D Qmatrix <- matrix(0,12,4)
##D Qmatrix[,1] <- 1
##D Qmatrix[ cbind( 1:12, match( dims, unique(dims)) +1 ) ]  <- 1
##D   # uncorrelated factors
##D variance.fixed <- cbind( c(1,1,1,2,2,3), c(2,3,4,3,4,4), 0 )
##D   # estimate model
##D mod11c <- sirt::smirt( dat, Qmatrix=Qmatrix, irtmodel="comp", est.a="2PL",
##D                 variance.fixed=variance.fixed, qmcnodes=1000, maxiter=60)
##D summary(mod11c)
##D 
##D #*****************************************************
##D # Model 12: Located latent class model: Rasch model with three theta classes
##D #*****************************************************
##D 
##D # use 10th item as the reference item
##D ref.item <- 10
##D # ability grid
##D theta.k <- seq(-4,4,len=9)
##D 
##D #----  M12a: rasch.mirtlc (in sirt)
##D mod12a <- sirt::rasch.mirtlc(dat, Nclasses=3, modeltype="MLC1", ref.item=ref.item)
##D summary(mod12a)
##D 
##D #----  M12b: gdm (in CDM)
##D theta.k <- seq(-1, 1, len=3)      # initial matrix
##D b.constraint <- matrix( c(10,1,0), nrow=1,ncol=3)
##D   # estimate model
##D mod12b <- CDM::gdm( dat, theta.k=theta.k, skillspace="est", irtmodel="1PL",
##D               b.constraint=b.constraint, maxiter=200)
##D summary(mod12b)
##D 
##D #----  M12c: mirt (in mirt)
##D items <- colnames(dat)
##D   # define three latent classes
##D Theta <- diag(3)
##D   # define mirt model
##D I <- ncol(dat)  # I=12
##D mirtmodel <- mirt::mirt.model("
##D         C1=1-12
##D         C2=1-12
##D         C3=1-12
##D         CONSTRAIN=(1-12,a1),(1-12,a2),(1-12,a3)
##D         ")
##D   # get parameters
##D mod.pars <- mirt(dat, model=mirtmodel,  pars="values")
##D  # set starting values for class specific item probabilities
##D mod.pars[ mod.pars$name=="d","value" ]  <- stats::qlogis( colMeans(dat,na.rm=TRUE) )
##D   # set item difficulty of reference item to zero
##D ind <- which( ( paste(mod.pars$item)==items[ref.item] ) &
##D                ( ( paste(mod.pars$name)=="d" ) ) )
##D mod.pars[ ind,"value" ]  <- 0
##D mod.pars[ ind,"est" ]  <- FALSE
##D   # initial values for a1, a2 and a3
##D mod.pars[ mod.pars$name %in% c("a1","a2","a3"),"value" ]  <- c(-1,0,1)
##D mod.pars
##D   #* define prior for latent class analysis
##D lca_prior <- function(Theta,Etable){
##D   # number of latent Theta classes
##D   TP <- nrow(Theta)
##D   # prior in initial iteration
##D   if ( is.null(Etable) ){
##D     prior <- rep( 1/TP, TP )
##D               }
##D   # process Etable (this is correct for datasets without missing data)
##D   if ( ! is.null(Etable) ){
##D     # sum over correct and incorrect expected responses
##D     prior <- ( rowSums( Etable[, seq(1,2*I,2)] ) + rowSums( Etable[, seq(2,2*I,2)] ) )/I
##D             }
##D   prior <- prior / sum(prior)
##D   return(prior)
##D    }
##D  #* estimate model
##D mod12c <- mirt(dat, mirtmodel, technical=list(
##D             customTheta=Theta, customPriorFun=lca_prior),
##D             pars=mod.pars, verbose=TRUE )
##D   # estimated parameters from the user customized  prior distribution.
##D mod12c@nest <- as.integer(sum(mod.pars$est) + 2)
##D   #* extract item parameters
##D coef1 <- sirt::mirt.wrapper.coef(mod12c)
##D   #* inspect estimated distribution
##D mod12c@Theta
##D coef1$coef[1,c("a1","a2","a3")]
##D mod12c@Prior[[1]]
##D 
##D #*****************************************************
##D # Model 13: Multidimensional model with discrete traits
##D #*****************************************************
##D # define Q-Matrix
##D Q <- matrix( 0, nrow=12,ncol=3)
##D Q[1:4,1] <- 1
##D Q[5:8,2] <- 1
##D Q[9:12,3] <- 1
##D # define discrete theta distribution with 3 dimensions
##D Theta <- scan(what="character",nlines=1)
##D   000 100 010 001 110 101 011 111
##D Theta <- as.numeric( unlist( lapply( Theta, strsplit, split="")   ) )
##D Theta <- matrix(Theta, 8, 3, byrow=TRUE )
##D Theta
##D 
##D #----  Model 13a: din (in CDM)
##D mod13a <- CDM::din( dat, q.matrix=Q, rule="DINA")
##D summary(mod13a)
##D # compare used Theta distributions
##D cbind( Theta, mod13a$attribute.patt.splitted)
##D 
##D #----  Model 13b: gdm (in CDM)
##D mod13b <- CDM::gdm( dat, Qmatrix=Q, theta.k=Theta, skillspace="full")
##D summary(mod13b)
##D 
##D #----  Model 13c: mirt (in mirt)
##D   # define mirt model
##D I <- ncol(dat)  # I=12
##D mirtmodel <- mirt::mirt.model("
##D         F1=1-4
##D         F2=5-8
##D         F3=9-12
##D         ")
##D   # get parameters
##D mod.pars <- mirt(dat, model=mirtmodel,  pars="values")
##D # starting values d parameters (transformed guessing parameters)
##D ind <- which(  mod.pars$name=="d"  )
##D mod.pars[ind,"value"] <- stats::qlogis(.2)
##D # starting values transformed slipping parameters
##D ind <- which( ( mod.pars$name %in% paste0("a",1:3)  ) &  ( mod.pars$est ) )
##D mod.pars[ind,"value"] <- stats::qlogis(.8) - stats::qlogis(.2)
##D mod.pars
##D 
##D   #* define prior for latent class analysis
##D lca_prior <- function(Theta,Etable){
##D   TP <- nrow(Theta)
##D   if ( is.null(Etable) ){
##D     prior <- rep( 1/TP, TP )
##D               }
##D   if ( ! is.null(Etable) ){
##D     prior <- ( rowSums( Etable[, seq(1,2*I,2)] ) + rowSums( Etable[, seq(2,2*I,2)] ) )/I
##D             }
##D   prior <- prior / sum(prior)
##D   return(prior)
##D }
##D  #* estimate model
##D mod13c <- mirt(dat, mirtmodel, technical=list(
##D             customTheta=Theta, customPriorFun=lca_prior),
##D             pars=mod.pars, verbose=TRUE )
##D   # estimated parameters from the user customized  prior distribution.
##D mod13c@nest <- as.integer(sum(mod.pars$est) + 2)
##D   #* extract item parameters
##D coef13c <- sirt::mirt.wrapper.coef(mod13c)$coef
##D   #* inspect estimated distribution
##D mod13c@Theta
##D mod13c@Prior[[1]]
##D 
##D  #-* comparisons of estimated  parameters
##D # extract guessing and slipping parameters from din
##D dfr <- coef(mod13a)[, c("guess","slip") ]
##D colnames(dfr) <- paste0("din.",c("guess","slip") )
##D # estimated parameters from gdm
##D dfr$gdm.guess <- stats::plogis(mod13b$item$b)
##D dfr$gdm.slip <- 1 - stats::plogis( rowSums(mod13b$item[,c("b.Cat1","a.F1","a.F2","a.F3")] ) )
##D # estimated parameters from mirt
##D dfr$mirt.guess <- stats::plogis( coef13c$d )
##D dfr$mirt.slip <- 1 - stats::plogis( rowSums(coef13c[,c("d","a1","a2","a3")]) )
##D # comparison
##D round(dfr[, c(1,3,5,2,4,6)],3)
##D   ##      din.guess gdm.guess mirt.guess din.slip gdm.slip mirt.slip
##D   ##   A1     0.691     0.684      0.686    0.000    0.000     0.000
##D   ##   A2     0.491     0.489      0.489    0.031    0.038     0.036
##D   ##   A3     0.302     0.300      0.300    0.184    0.193     0.190
##D   ##   A4     0.244     0.239      0.240    0.337    0.340     0.339
##D   ##   B1     0.568     0.579      0.577    0.163    0.148     0.151
##D   ##   B2     0.329     0.344      0.340    0.344    0.326     0.329
##D   ##   B3     0.817     0.827      0.825    0.014    0.007     0.009
##D   ##   B4     0.431     0.463      0.456    0.104    0.089     0.092
##D   ##   C1     0.188     0.191      0.189    0.013    0.013     0.013
##D   ##   C2     0.050     0.050      0.050    0.239    0.238     0.239
##D   ##   C3     0.000     0.002      0.001    0.065    0.065     0.065
##D   ##   C4     0.000     0.004      0.000    0.212    0.212     0.212
##D 
##D # estimated class sizes
##D dfr <- data.frame( "Theta"=Theta, "din"=mod13a$attribute.patt$class.prob,
##D                    "gdm"=mod13b$pi.k, "mirt"=mod13c@Prior[[1]])
##D # comparison
##D round(dfr,3)
##D   ##     Theta.1 Theta.2 Theta.3   din   gdm  mirt
##D   ##   1       0       0       0 0.039 0.041 0.040
##D   ##   2       1       0       0 0.008 0.009 0.009
##D   ##   3       0       1       0 0.009 0.007 0.008
##D   ##   4       0       0       1 0.394 0.417 0.412
##D   ##   5       1       1       0 0.011 0.011 0.011
##D   ##   6       1       0       1 0.017 0.042 0.037
##D   ##   7       0       1       1 0.042 0.008 0.016
##D   ##   8       1       1       1 0.480 0.465 0.467
##D 
##D #*****************************************************
##D # Model 14: DINA model with two skills
##D #*****************************************************
##D 
##D # define some simple Q-Matrix (does not really make in this application)
##D Q <- matrix( 0, nrow=12,ncol=2)
##D Q[1:4,1] <- 1
##D Q[5:8,2] <- 1
##D Q[9:12,1:2] <- 1
##D # define discrete theta distribution with 3 dimensions
##D Theta <- scan(what="character",nlines=1)
##D   00 10 01 11
##D Theta <- as.numeric( unlist( lapply( Theta, strsplit, split="")   ) )
##D Theta <- matrix(Theta, 4, 2, byrow=TRUE )
##D Theta
##D 
##D #----  Model 14a: din (in CDM)
##D mod14a <- CDM::din( dat, q.matrix=Q, rule="DINA")
##D summary(mod14a)
##D # compare used Theta distributions
##D cbind( Theta, mod14a$attribute.patt.splitted)
##D 
##D #----  Model 14b: mirt (in mirt)
##D   # define mirt model
##D I <- ncol(dat)  # I=12
##D mirtmodel <- mirt::mirt.model("
##D         F1=1-4
##D         F2=5-8
##D         (F1*F2)=9-12
##D         ")
##D #-> constructions like (F1*F2*F3) are also allowed in mirt.model
##D   # get parameters
##D mod.pars <- mirt(dat, model=mirtmodel,  pars="values")
##D # starting values d parameters (transformed guessing parameters)
##D ind <- which(  mod.pars$name=="d"  )
##D mod.pars[ind,"value"] <- stats::qlogis(.2)
##D # starting values transformed slipping parameters
##D ind <- which( ( mod.pars$name %in% paste0("a",1:3)  ) &  ( mod.pars$est ) )
##D mod.pars[ind,"value"] <- stats::qlogis(.8) - stats::qlogis(.2)
##D mod.pars
##D  #* use above defined prior lca_prior
##D  # lca_prior <- function(prior,Etable) ...
##D  #* estimate model
##D mod14b <- mirt(dat, mirtmodel, technical=list(
##D             customTheta=Theta, customPriorFun=lca_prior),
##D             pars=mod.pars, verbose=TRUE )
##D   # estimated parameters from the user customized  prior distribution.
##D mod14b@nest <- as.integer(sum(mod.pars$est) + 2)
##D   #* extract item parameters
##D coef14b <- sirt::mirt.wrapper.coef(mod14b)$coef
##D 
##D  #-* comparisons of estimated  parameters
##D # extract guessing and slipping parameters from din
##D dfr <- coef(mod14a)[, c("guess","slip") ]
##D colnames(dfr) <- paste0("din.",c("guess","slip") )
##D # estimated parameters from mirt
##D dfr$mirt.guess <- stats::plogis( coef14b$d )
##D dfr$mirt.slip <- 1 - stats::plogis( rowSums(coef14b[,c("d","a1","a2","a3")]) )
##D # comparison
##D round(dfr[, c(1,3,2,4)],3)
##D   ##      din.guess mirt.guess din.slip mirt.slip
##D   ##   A1     0.674      0.671    0.030     0.030
##D   ##   A2     0.423      0.420    0.049     0.050
##D   ##   A3     0.258      0.255    0.224     0.225
##D   ##   A4     0.245      0.243    0.394     0.395
##D   ##   B1     0.534      0.543    0.166     0.164
##D   ##   B2     0.338      0.347    0.382     0.380
##D   ##   B3     0.796      0.802    0.016     0.015
##D   ##   B4     0.421      0.436    0.142     0.140
##D   ##   C1     0.850      0.851    0.000     0.000
##D   ##   C2     0.480      0.480    0.097     0.097
##D   ##   C3     0.746      0.746    0.026     0.026
##D   ##   C4     0.575      0.577    0.136     0.137
##D 
##D # estimated class sizes
##D dfr <- data.frame( "Theta"=Theta, "din"=mod13a$attribute.patt$class.prob,
##D                     "mirt"=mod14b@Prior[[1]])
##D # comparison
##D round(dfr,3)
##D   ##     Theta.1 Theta.2   din  mirt
##D   ##   1       0       0 0.357 0.369
##D   ##   2       1       0 0.044 0.049
##D   ##   3       0       1 0.047 0.031
##D   ##   4       1       1 0.553 0.551
##D 
##D #*****************************************************
##D # Model 15: Rasch model with non-normal distribution
##D #*****************************************************
##D 
##D # A non-normal theta distributed is specified by log-linear smoothing
##D # the distribution as described in
##D # Xu, X., & von Davier, M. (2008). Fitting the structured general diagnostic model
##D # to NAEP data. ETS Research Report ETS RR-08-27. Princeton, ETS.
##D 
##D # define theta grid
##D theta.k <- matrix( seq(-4,4,len=15), ncol=1 )
##D # define design matrix for smoothing (up to cubic moments)
##D delta.designmatrix <- cbind( 1, theta.k, theta.k^2, theta.k^3 )
##D # constrain item difficulty of fifth item (item B1) to zero
##D b.constraint <- matrix( c(5,1,0), ncol=3 )
##D 
##D #----  Model 15a: gdm (in CDM)
##D mod15a <- CDM::gdm( dat, irtmodel="1PL", theta.k=theta.k,
##D                b.constraint=b.constraint  )
##D summary(mod15a)
##D  # plot estimated distribution
##D graphics::barplot( mod15a$pi.k[,1], space=0, names.arg=round(theta.k[,1],2),
##D            main="Estimated Skewed Distribution (gdm function)")
##D 
##D #----  Model 15b: mirt (in mirt)
##D  # define mirt model
##D mirtmodel <- mirt::mirt.model("
##D     F=1-12
##D     ")
##D  # get parameters
##D mod.pars <- mirt::mirt(dat, model=mirtmodel, pars="values", itemtype="Rasch")
##D   # fix variance (just for correct counting of parameters)
##D mod.pars[ mod.pars$name=="COV_11", "est"] <- FALSE
##D   # fix item difficulty
##D ind <- which( ( mod.pars$item=="B1" ) & ( mod.pars$name=="d" ) )
##D mod.pars[ ind, "value"] <- 0
##D mod.pars[ ind, "est"] <- FALSE
##D 
##D  # define prior
##D loglinear_prior <- function(Theta,Etable){
##D     TP <- nrow(Theta)
##D     if ( is.null(Etable) ){
##D     prior <- rep( 1/TP, TP )
##D            }
##D     # process Etable (this is correct for datasets without missing data)
##D     if ( ! is.null(Etable) ){
##D           # sum over correct and incorrect expected responses
##D        prior <- ( rowSums( Etable[, seq(1,2*I,2)] ) + rowSums( Etable[, seq(2,2*I,2)] ) )/I
##D        # smooth prior using the above design matrix and a log-linear model
##D        # see Xu & von Davier (2008).
##D        y <- log( prior + 1E-15 )
##D        lm1 <- lm( y ~ 0 + delta.designmatrix, weights=prior )
##D        prior <- exp(fitted(lm1))   # smoothed prior
##D            }
##D     prior <- prior / sum(prior)
##D     return(prior)
##D }
##D 
##D #* estimate model
##D mod15b <- mirt::mirt(dat, mirtmodel, technical=list(
##D                 customTheta=theta.k, customPriorFun=loglinear_prior ),
##D                 pars=mod.pars, verbose=TRUE )
##D # estimated parameters from the user customized prior distribution.
##D mod15b@nest <- as.integer(sum(mod.pars$est) + 3)
##D #* extract item parameters
##D coef1 <- sirt::mirt.wrapper.coef(mod15b)$coef
##D 
##D #** compare estimated item parameters
##D dfr <- data.frame( "gdm"=mod15a$item$b.Cat1, "mirt"=coef1$d )
##D rownames(dfr) <- colnames(dat)
##D round(t(dfr),4)
##D   ##            A1     A2      A3      A4 B1      B2     B3     B4     C1    C2     C3    C4
##D   ##   gdm  0.9818 0.1538 -0.7837 -1.3197  0 -1.0902 1.6088 -0.170 1.9778 0.006 1.1859 0.135
##D   ##   mirt 0.9829 0.1548 -0.7826 -1.3186  0 -1.0892 1.6099 -0.169 1.9790 0.007 1.1870 0.136
##D # compare estimated theta distribution
##D dfr <- data.frame( "gdm"=mod15a$pi.k, "mirt"=mod15b@Prior[[1]] )
##D round(t(dfr),4)
##D   ##        1 2     3     4      5      6      7      8      9     10     11     12     13
##D   ##   gdm  0 0 1e-04 9e-04 0.0056 0.0231 0.0652 0.1299 0.1881 0.2038 0.1702 0.1129 0.0612
##D   ##   mirt 0 0 1e-04 9e-04 0.0056 0.0232 0.0653 0.1300 0.1881 0.2038 0.1702 0.1128 0.0611
##D   ##            14    15
##D   ##   gdm  0.0279 0.011
##D   ##   mirt 0.0278 0.011
## End(Not run)




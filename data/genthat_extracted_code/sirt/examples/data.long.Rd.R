library(sirt)


### Name: data.long
### Title: Longitudinal Dataset
### Aliases: data.long
### Keywords: datasets

### ** Examples

## Not run: 
##D data(data.long)
##D dat <- data.long
##D dat <- dat[,-1]
##D I <- ncol(dat)
##D 
##D #*************************************************
##D # Model 1: 2-dimensional Rasch model
##D #*************************************************
##D # define Q-matrix
##D Q <- matrix(0,I,2)
##D Q[1:6,1] <- 1
##D Q[7:12,2] <- 1
##D rownames(Q) <- colnames(dat)
##D colnames(Q) <- c("T1","T2")
##D 
##D # vector with same items
##D itemnr <- as.numeric( substring( colnames(dat),2,2) )
##D # fix mean at T2 to zero
##D mu.fixed <- cbind( 2,0 )
##D 
##D #--- M1a: rasch.mml2 (in sirt)
##D mod1a <- sirt::rasch.mml2(dat, Q=Q, est.b=itemnr, mu.fixed=mu.fixed)
##D summary(mod1a)
##D 
##D #--- M1b: smirt (in sirt)
##D mod1b <- sirt::smirt(dat, Qmatrix=Q, irtmodel="comp", est.b=itemnr,
##D                   mu.fixed=mu.fixed )
##D 
##D #--- M1c: tam.mml (in TAM)
##D 
##D # assume equal item difficulty of I3T1 and I3T2, I4T1 and I4T2, ...
##D # create draft design matrix and modify it
##D A <- TAM::designMatrices(resp=dat)$A
##D dimnames(A)[[1]] <- colnames(dat)
##D   ##   > str(A)
##D   ##    num [1:12, 1:2, 1:12] 0 0 0 0 0 0 0 0 0 0 ...
##D   ##    - attr(*, "dimnames")=List of 3
##D   ##     ..$ : chr [1:12] "Item01" "Item02" "Item03" "Item04" ...
##D   ##     ..$ : chr [1:2] "Category0" "Category1"
##D   ##     ..$ : chr [1:12] "I1T1" "I2T1" "I3T1" "I4T1" ...
##D A1 <- A[,, c(1:6, 11:12 ) ]
##D A1[7,2,3] <- -1     # difficulty(I3T1)=difficulty(I3T2)
##D A1[8,2,4] <- -1     # I4T1=I4T2
##D A1[9,2,5] <- A1[10,2,6] <- -1
##D dimnames(A1)[[3]] <- substring( dimnames(A1)[[3]],1,2)
##D   ##   > A1[,2,]
##D   ##        I1 I2 I3 I4 I5 I6 I7 I8
##D   ##   I1T1 -1  0  0  0  0  0  0  0
##D   ##   I2T1  0 -1  0  0  0  0  0  0
##D   ##   I3T1  0  0 -1  0  0  0  0  0
##D   ##   I4T1  0  0  0 -1  0  0  0  0
##D   ##   I5T1  0  0  0  0 -1  0  0  0
##D   ##   I6T1  0  0  0  0  0 -1  0  0
##D   ##   I3T2  0  0 -1  0  0  0  0  0
##D   ##   I4T2  0  0  0 -1  0  0  0  0
##D   ##   I5T2  0  0  0  0 -1  0  0  0
##D   ##   I6T2  0  0  0  0  0 -1  0  0
##D   ##   I7T2  0  0  0  0  0  0 -1  0
##D   ##   I8T2  0  0  0  0  0  0  0 -1
##D 
##D # estimate model
##D # set intercept of second dimension (T2) to zero
##D beta.fixed <- cbind( 1, 2, 0 )
##D mod1c <- TAM::tam.mml( resp=dat, Q=Q, A=A1, beta.fixed=beta.fixed)
##D summary(mod1c)
##D 
##D #*************************************************
##D # Model 2: 2-dimensional 2PL model
##D #*************************************************
##D 
##D # set variance at T2 to 1
##D variance.fixed <- cbind(2,2,1)
##D 
##D # M2a: rasch.mml2 (in sirt)
##D mod2a <- sirt::rasch.mml2(dat, Q=Q, est.b=itemnr, est.a=itemnr, mu.fixed=mu.fixed,
##D              variance.fixed=variance.fixed, mmliter=100)
##D summary(mod2a)
##D 
##D #*************************************************
##D # Model 3: Concurrent calibration by assuming invariant item parameters
##D #*************************************************
##D 
##D library(mirt)   # use mirt for concurrent calibration
##D data(data.long)
##D dat <- data.long[,-1]
##D I <- ncol(dat)
##D 
##D # create user defined function for between item dimensionality 4PL model
##D name <- "4PLbw"
##D par <- c("low"=0,"upp"=1,"a"=1,"d"=0,"dimItem"=1)
##D est <- c(TRUE, TRUE,TRUE,TRUE,FALSE)
##D # item response function
##D irf <- function(par,Theta,ncat){
##D      low <- par[1]
##D      upp <- par[2]
##D      a <- par[3]
##D      d <- par[4]
##D      dimItem <- par[5]
##D      P1 <- low + ( upp - low ) * plogis( a*Theta[,dimItem] + d )
##D      cbind(1-P1, P1)
##D }
##D 
##D # create item response function
##D fourPLbetw <- mirt::createItem(name, par=par, est=est, P=irf)
##D head(dat)
##D 
##D # create mirt model (use variable names in mirt.model)
##D mirtsyn <- "
##D      T1=I1T1,I2T1,I3T1,I4T1,I5T1,I6T1
##D      T2=I3T2,I4T2,I5T2,I6T2,I7T2,I8T2
##D      COV=T1*T2,,T2*T2
##D      MEAN=T1
##D      CONSTRAIN=(I3T1,I3T2,d),(I4T1,I4T2,d),(I5T1,I5T2,d),(I6T1,I6T2,d),
##D                  (I3T1,I3T2,a),(I4T1,I4T2,a),(I5T1,I5T2,a),(I6T1,I6T2,a)
##D         "
##D # create mirt model
##D mirtmodel <- mirt::mirt.model( mirtsyn, itemnames=colnames(dat) )
##D # define parameters to be estimated
##D mod3.pars <- mirt::mirt(dat, mirtmodel$model, rep( "4PLbw",I),
##D                    customItems=list("4PLbw"=fourPLbetw), pars="values")
##D # select dimensions
##D ind <- intersect( grep("T2",mod3.pars$item), which( mod3.pars$name=="dimItem" ) )
##D mod3.pars[ind,"value"] <- 2
##D # set item parameters low and upp to non-estimated
##D ind <- which( mod3.pars$name %in% c("low","upp") )
##D mod3.pars[ind,"est"] <- FALSE
##D 
##D # estimate 2PL model
##D mod3 <- mirt::mirt(dat, mirtmodel$model, itemtype=rep( "4PLbw",I),
##D                 customItems=list("4PLbw"=fourPLbetw), pars=mod3.pars, verbose=TRUE,
##D                 technical=list(NCYCLES=50)  )
##D mirt.wrapper.coef(mod3)
##D 
##D #****** estimate model in lavaan
##D library(lavaan)
##D 
##D # specify syntax
##D lavmodel <- "
##D              #**** T1
##D              F1=~ a1*I1T1+a2*I2T1+a3*I3T1+a4*I4T1+a5*I5T1+a6*I6T1
##D              I1T1 | b1*t1 ; I2T1 | b2*t1 ; I3T1 | b3*t1 ; I4T1 | b4*t1
##D              I5T1 | b5*t1 ; I6T1 | b6*t1
##D              F1 ~~ 1*F1
##D              #**** T2
##D              F2=~ a3*I3T2+a4*I4T2+a5*I5T2+a6*I6T2+a7*I7T2+a8*I8T2
##D              I3T2 | b3*t1 ; I4T2 | b4*t1 ; I5T2 | b5*t1 ; I6T2 | b6*t1
##D              I7T2 | b7*t1 ; I8T2 | b8*t1
##D              F2 ~~ NA*F2
##D              F2 ~ 1
##D              #*** covariance
##D              F1 ~~ F2
##D                 "
##D # estimate model using theta parameterization
##D mod3lav <- lavaan::cfa( data=dat, model=lavmodel,
##D             std.lv=TRUE, ordered=colnames(dat), parameterization="theta")
##D summary(mod3lav, standardized=TRUE, fit.measures=TRUE, rsquare=TRUE)
##D 
##D #*************************************************
##D # Model 4: Linking with items of different item slope groups
##D #*************************************************
##D 
##D data(data.long)
##D dat <- data.long
##D # dataset for T1
##D dat1 <- dat[, grep( "T1", colnames(dat) ) ]
##D colnames(dat1) <- gsub("T1","", colnames(dat1) )
##D # dataset for T2
##D dat2 <- dat[, grep( "T2", colnames(dat) ) ]
##D colnames(dat2) <- gsub("T2","", colnames(dat2) )
##D 
##D # 2PL model with slope groups T1
##D mod1 <- sirt::rasch.mml2( dat1, est.a=c( rep(1,2), rep(2,4) ) )
##D summary(mod1)
##D 
##D # 2PL model with slope groups T2
##D mod2 <- sirt::rasch.mml2( dat2, est.a=c( rep(1,4), rep(2,2) ) )
##D summary(mod2)
##D 
##D #------- Link 1: Haberman Linking
##D # collect item parameters
##D dfr1 <- data.frame( "study1", mod1$item$item, mod1$item$a, mod1$item$b )
##D dfr2 <- data.frame( "study2", mod2$item$item, mod2$item$a, mod2$item$b )
##D colnames(dfr2) <- colnames(dfr1) <- c("study", "item", "a", "b" )
##D itempars <- rbind( dfr1, dfr2 )
##D # Linking
##D link1 <- sirt::linking.haberman(itempars=itempars)
##D 
##D #------- Link 2: Invariance alignment method
##D # create objects for invariance.alignment
##D nu <- rbind( c(mod1$item$thresh,NA,NA), c(NA,NA,mod2$item$thresh) )
##D lambda <- rbind( c(mod1$item$a,NA,NA), c(NA,NA,mod2$item$a ) )
##D colnames(lambda) <- colnames(nu) <- paste0("I",1:8)
##D rownames(lambda) <- rownames(nu) <- c("T1", "T2")
##D # Linking
##D link2a <- sirt::invariance.alignment( lambda, nu )
##D summary(link2a)
## End(Not run)




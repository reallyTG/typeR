library(sirt)


### Name: tam2mirt
### Title: Converting a fitted 'TAM' Object into a 'mirt' Object
### Aliases: tam2mirt
### Keywords: TAM mirt

### ** Examples

## Not run: 
##D library(TAM)
##D library(mirt)
##D 
##D #############################################################################
##D # EXAMPLE 1: Estimations in TAM for data.read dataset
##D #############################################################################
##D 
##D data(data.read)
##D dat <- data.read
##D 
##D #**************************************
##D #*** Model 1: Rasch model
##D #**************************************
##D 
##D # estimation in TAM package
##D mod <- TAM::tam.mml( dat )
##D summary(mod)
##D # conversion to mirt
##D res <- sirt::tam2mirt(mod)
##D # generated lavaan syntax
##D cat(res$lavaan.syntax.fixed)
##D cat(res$lavaan.syntax.freed)
##D # extract object of class mirt
##D mres <- res$mirt
##D # print and parameter values
##D print(mres)
##D mirt::mod2values(mres)
##D # model fit
##D mirt::M2(mres)
##D # residual statistics
##D mirt::residuals(mres, type="Q3")
##D mirt::residuals(mres, type="LD")
##D # item fit
##D mirt::itemfit(mres)
##D # person fit
##D mirt::personfit(mres)
##D # compute several types of factor scores (quite slow)
##D f1 <- mirt::fscores(mres, method='WLE',response.pattern=dat[1:10,])
##D      # method=MAP and EAP also possible
##D # item plot
##D mirt::itemplot(mres,"A3")    # item A3
##D mirt::itemplot(mres,4)       # fourth item
##D # some more plots
##D plot(mres,type="info")
##D plot(mres,type="score")
##D plot(mres,type="trace")
##D # compare estimates with estimated Rasch model in mirt
##D mres1 <- mirt::mirt(dat,1,"Rasch" )
##D print(mres1)
##D mirt.wrapper.coef(mres1)
##D 
##D #**************************************
##D #*** Model 2: 2PL model
##D #**************************************
##D 
##D # estimation in TAM
##D mod <- TAM::tam.mml.2pl( dat )
##D summary(mod)
##D # conversion to mirt
##D res <- sirt::tam2mirt(mod)
##D mres <- res$mirt
##D # lavaan syntax
##D cat(res$lavaan.syntax.fixed)
##D cat(res$lavaan.syntax.freed)
##D # parameter estimates
##D print(mres)
##D mod2values(mres)
##D mres@nest   # number of estimated parameters
##D # some plots
##D plot(mres,type="info")
##D plot(mres,type="score")
##D plot(mres,type="trace")
##D # model fit
##D mirt::M2(mres)
##D # residual statistics
##D mirt::residuals(mres, type="Q3")
##D mirt::residuals(mres, type="LD")
##D # item fit
##D mirt::itemfit(mres)
##D 
##D #**************************************
##D #*** Model 3: 3-dimensional Rasch model
##D #**************************************
##D 
##D # define Q-matrix
##D Q <- matrix( 0, nrow=12, ncol=3 )
##D Q[ cbind(1:12, rep(1:3,each=4) ) ] <- 1
##D rownames(Q) <- colnames(dat)
##D colnames(Q) <- c("A","B","C")
##D # estimation in TAM
##D mod <- TAM::tam.mml( resp=dat, Q=Q, control=list(snodes=1000,maxiter=30) )
##D summary(mod)
##D # mirt conversion
##D res <- sirt::tam2mirt(mod)
##D mres <- res$mirt
##D # mirt syntax
##D cat(res$mirt.syntax)
##D   ##   Dim01=1,2,3,4
##D   ##   Dim02=5,6,7,8
##D   ##   Dim03=9,10,11,12
##D   ##   COV=Dim01*Dim01,Dim02*Dim02,Dim03*Dim03,Dim01*Dim02,Dim01*Dim03,Dim02*Dim03
##D   ##   MEAN=Dim01,Dim02,Dim03
##D # lavaan syntax
##D cat(res$lavaan.syntax.freed)
##D   ##   Dim01=~ 1*A1+1*A2+1*A3+1*A4
##D   ##   Dim02=~ 1*B1+1*B2+1*B3+1*B4
##D   ##   Dim03=~ 1*C1+1*C2+1*C3+1*C4
##D   ##   A1 | t1_1*t1
##D   ##   A2 | t1_2*t1
##D   ##   A3 | t1_3*t1
##D   ##   A4 | t1_4*t1
##D   ##   B1 | t1_5*t1
##D   ##   B2 | t1_6*t1
##D   ##   B3 | t1_7*t1
##D   ##   B4 | t1_8*t1
##D   ##   C1 | t1_9*t1
##D   ##   C2 | t1_10*t1
##D   ##   C3 | t1_11*t1
##D   ##   C4 | t1_12*t1
##D   ##   Dim01 ~ 0*1
##D   ##   Dim02 ~ 0*1
##D   ##   Dim03 ~ 0*1
##D   ##   Dim01 ~~ Cov_11*Dim01
##D   ##   Dim02 ~~ Cov_22*Dim02
##D   ##   Dim03 ~~ Cov_33*Dim03
##D   ##   Dim01 ~~ Cov_12*Dim02
##D   ##   Dim01 ~~ Cov_13*Dim03
##D   ##   Dim02 ~~ Cov_23*Dim03
##D # model fit
##D mirt::M2(mres)
##D # residual statistics
##D residuals(mres,type="LD")
##D # item fit
##D mirt::itemfit(mres)
##D 
##D #**************************************
##D #*** Model 4: 3-dimensional 2PL model
##D #**************************************
##D 
##D # estimation in TAM
##D mod <- TAM::tam.mml.2pl( resp=dat, Q=Q, control=list(snodes=1000,maxiter=30) )
##D summary(mod)
##D # mirt conversion
##D res <- sirt::tam2mirt(mod)
##D mres <- res$mirt
##D # generated lavaan syntax
##D cat(res$lavaan.syntax.fixed)
##D cat(res$lavaan.syntax.freed)
##D # write lavaan syntax on disk
##D   sink( "mod4_lav_freed.txt", split=TRUE )
##D cat(res$lavaan.syntax.freed)
##D   sink()
##D # some statistics from mirt
##D print(mres)
##D summary(mres)
##D mirt::M2(mres)
##D mirt::residuals(mres)
##D mirt::itemfit(mres)
##D 
##D # estimate mirt model by using the generated lavaan syntax with freed parameters
##D res2 <- sirt::lavaan2mirt( dat, res$lavaan.syntax.freed,
##D             technical=list(NCYCLES=3), verbose=TRUE)
##D                  # use only few cycles for illustrational purposes
##D mirt.wrapper.coef(res2$mirt)
##D summary(res2$mirt)
##D print(res2$mirt)
##D 
##D #############################################################################
##D # EXAMPLE 4: mirt conversions for polytomous dataset data.big5
##D #############################################################################
##D 
##D data(data.big5)
##D # select some items
##D items <- c( grep( "O", colnames(data.big5), value=TRUE )[1:6],
##D      grep( "N", colnames(data.big5), value=TRUE )[1:4] )
##D # O3 O8 O13 O18 O23 O28 N1 N6 N11 N16
##D dat <- data.big5[, items ]
##D library(psych)
##D psych::describe(dat)
##D 
##D library(TAM)
##D #******************
##D #*** Model 1: Partial credit model in TAM
##D mod1 <- TAM::tam.mml( dat[,1:6] )
##D summary(mod1)
##D # convert to mirt object
##D mmod1 <- sirt::tam2mirt( mod1 )
##D rmod1 <- mmod1$mirt
##D # coefficients in mirt
##D coef(rmod1)
##D mirt.wrapper.coef(rmod1)
##D # model fit
##D mirt::M2(rmod1)
##D # item fit
##D mirt::itemfit(rmod1)
##D # plots
##D plot(rmod1,type="trace")
##D plot(rmod1, type="trace", which.items=1:4 )
##D mirt::itemplot(rmod1,"O3")
##D 
##D #******************
##D #*** Model 2: Generalized partial credit model in TAM
##D mod2 <- TAM::tam.mml.2pl( dat[,1:6], irtmodel="GPCM" )
##D summary(mod2)
##D # convert to mirt object
##D mmod2 <- sirt::tam2mirt( mod2 )
##D rmod2 <- mmod2$mirt
##D # coefficients in mirt
##D mirt.wrapper.coef(rmod2)
##D # model fit
##D mirt::M2(rmod2)
##D # item fit
##D mirt::itemfit(rmod2)
## End(Not run)




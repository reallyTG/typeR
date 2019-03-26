library(sirt)


### Name: data.reck
### Title: Datasets from Reckase' Book _Multidimensional Item Response
###   Theory_
### Aliases: data.reck data.reck21 data.reck61DAT1 data.reck61DAT2
###   data.reck73C1a data.reck73C1b data.reck75C2 data.reck78ExA
###   data.reck79ExB
### Keywords: datasets

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: data.reck21 dataset, Table 2.1, p. 45
##D #############################################################################
##D data(data.reck21)
##D 
##D dat <- data.reck21$dat      # extract dataset
##D 
##D # items with zero guessing parameters
##D guess0 <- c( 1, 2, 3, 9,11,27,30,35,45,49,50 )
##D I <- ncol(dat)
##D 
##D #***
##D # Model 1: 3PL estimation using rasch.mml2
##D est.c <- est.a <- 1:I
##D est.c[ guess0 ] <- 0
##D mod1 <- sirt::rasch.mml2( dat, est.a=est.a, est.c=est.c, mmliter=300 )
##D summary(mod1)
##D 
##D #***
##D # Model 2: 3PL estimation using smirt
##D Q <- matrix(1,I,1)
##D mod2 <- sirt::smirt( dat, Qmatrix=Q, est.a="2PL", est.c=est.c, increment.factor=1.01)
##D summary(mod2)
##D 
##D #***
##D # Model 3: estimation in mirt package
##D library(mirt)
##D itemtype <- rep("3PL", I )
##D itemtype[ guess0 ] <- "2PL"
##D mod3 <- mirt::mirt(dat, 1, itemtype=itemtype, verbose=TRUE)
##D summary(mod3)
##D 
##D c3 <- unlist( coef(mod3) )[ 1:(4*I) ]
##D c3 <- matrix( c3, I, 4, byrow=TRUE )
##D # compare estimates of rasch.mml2, smirt and true parameters
##D round( cbind( mod1$item$c, mod2$item$c,c3[,3],data.reck21$pars$c ), 2 )
##D round( cbind( mod1$item$a, mod2$item$a.Dim1,c3[,1], data.reck21$pars$a ), 2 )
##D round( cbind( mod1$item$b, mod2$item$b.Dim1 / mod2$item$a.Dim1, - c3[,2] / c3[,1],
##D             data.reck21$pars$b ), 2 )
##D 
##D #############################################################################
##D # EXAMPLE 2: data.reck61 dataset, Table 6.1, p. 153
##D #############################################################################
##D 
##D data(data.reck61DAT1)
##D dat <- data.reck61DAT1$data
##D 
##D #***
##D # Model 1: Exploratory factor analysis
##D 
##D #-- Model 1a: tam.fa in TAM
##D library(TAM)
##D mod1a <- TAM::tam.fa( dat, irtmodel="efa", nfactors=3 )
##D # varimax rotation
##D varimax(mod1a$B.stand)
##D 
##D # Model 1b: EFA in NOHARM (Promax rotation)
##D mod1b <- sirt::R2noharm( dat=dat, model.type="EFA",  dimensions=3,
##D               writename="reck61__3dim_efa", noharm.path="c:/NOHARM",dec=",")
##D summary(mod1b)
##D 
##D # Model 1c: EFA with noharm.sirt
##D mod1c <- sirt::noharm.sirt( dat=dat, dimensions=3  )
##D summary(mod1c)
##D plot(mod1c)
##D 
##D # Model 1d: EFA with 2 dimensions in noharm.sirt
##D mod1d <- sirt::noharm.sirt( dat=dat, dimensions=2  )
##D summary(mod1d)
##D plot(mod1d, efa.load.min=.2)   # plot loadings of at least .20
##D 
##D #***
##D # Model 2: Confirmatory factor analysis
##D 
##D #-- Model 2a: tam.fa in TAM
##D dims <- c( rep(1,10), rep(3,10), rep(2,10)  )
##D Qmatrix <- matrix( 0, nrow=30, ncol=3 )
##D Qmatrix[ cbind( 1:30, dims) ] <- 1
##D mod2a <- TAM::tam.mml.2pl( dat,Q=Qmatrix,
##D             control=list( snodes=1000, QMC=TRUE, maxiter=200) )
##D summary(mod2a)
##D 
##D #-- Model 2b: smirt in sirt
##D mod2b <- sirt::smirt( dat,Qmatrix=Qmatrix, est.a="2PL", maxiter=20, qmcnodes=1000 )
##D summary(mod2b)
##D 
##D #-- Model 2c: rasch.mml2 in sirt
##D mod2c <- sirt::rasch.mml2( dat,Qmatrix=Qmatrix, est.a=1:30,
##D                 mmliter=200, theta.k=seq(-5,5,len=11) )
##D summary(mod2c)
##D 
##D #-- Model 2d: mirt in mirt
##D cmodel <- mirt::mirt.model("
##D      F1=1-10
##D      F2=21-30
##D      F3=11-20
##D      COV=F1*F2, F1*F3, F2*F3 " )
##D mod2d <- mirt::mirt(dat, cmodel, verbose=TRUE)
##D summary(mod2d)
##D coef(mod2d)
##D 
##D #-- Model 2e: CFA in NOHARM
##D # specify covariance pattern
##D P.pattern <- matrix( 1, ncol=3, nrow=3 )
##D P.init <- .4*P.pattern
##D diag(P.pattern) <- 0
##D diag(P.init) <- 1
##D # fix all entries in the loading matrix to 1
##D F.pattern <- matrix( 0, nrow=30, ncol=3 )
##D F.pattern[1:10,1] <- 1
##D F.pattern[21:30,2] <- 1
##D F.pattern[11:20,3] <- 1
##D F.init <- F.pattern
##D # estimate model
##D mod2e <- sirt::R2noharm( dat=dat, model.type="CFA", P.pattern=P.pattern,
##D             P.init=P.init, F.pattern=F.pattern, F.init=F.init,
##D             writename="reck61__3dim_cfa", noharm.path="c:/NOHARM",dec=",")
##D summary(mod2e)
##D 
##D #-- Model 2f: CFA with noharm.sirt
##D mod2f <- sirt::noharm.sirt( dat=dat, Fval=F.init, Fpatt=F.pattern,
##D                  Pval=P.init, Ppatt=P.pattern )
##D summary(mod2f)
##D 
##D #############################################################################
##D # EXAMPLE 3: DETECT analysis data.reck78ExA and data.reck79ExB
##D #############################################################################
##D 
##D data(data.reck78ExA)
##D data(data.reck79ExB)
##D 
##D #************************
##D # Example A
##D dat <- data.reck78ExA$data
##D #- estimate person score
##D score <- stats::qnorm( ( rowMeans( dat )+.5 )  / ( ncol(dat) + 1 ) )
##D #- extract item cluster
##D itemcluster <- substring( colnames(dat), 1, 1 )
##D #- confirmatory DETECT Item cluster
##D detectA <- sirt::conf.detect( data=dat, score=score, itemcluster=itemcluster )
##D   ##          unweighted weighted
##D   ##   DETECT      0.571    0.571
##D   ##   ASSI        0.523    0.523
##D   ##   RATIO       0.757    0.757
##D 
##D #- exploratory DETECT analysis
##D detect_explA <- sirt::expl.detect(data=dat, score, nclusters=10, N.est=nrow(dat)/2  )
##D   ##  Optimal Cluster Size is  5  (Maximum of DETECT Index)
##D   ##     N.Cluster N.items N.est N.val         size.cluster DETECT.est ASSI.est
##D   ##   1         2      50  1250  1250                31-19      0.531    0.404
##D   ##   2         3      50  1250  1250             10-19-21      0.554    0.407
##D   ##   3         4      50  1250  1250           10-19-14-7      0.630    0.509
##D   ##   4         5      50  1250  1250         10-19-3-7-11      0.653    0.546
##D   ##   5         6      50  1250  1250       10-12-7-3-7-11      0.593    0.458
##D   ##   6         7      50  1250  1250      10-12-7-3-7-9-2      0.604    0.474
##D   ##   7         8      50  1250  1250    10-12-7-3-3-9-4-2      0.608    0.481
##D   ##   8         9      50  1250  1250  10-12-7-3-3-5-4-2-4      0.617    0.494
##D   ##   9        10      50  1250  1250 10-5-7-7-3-3-5-4-2-4      0.592    0.460
##D 
##D # cluster membership
##D cluster_membership <- detect_explA$itemcluster$cluster3
##D # Cluster 1:
##D colnames(dat)[ cluster_membership==1 ]
##D   ##   [1] "A01" "A02" "A03" "A04" "A05" "A06" "A07" "A08" "A09" "A10"
##D # Cluster 2:
##D colnames(dat)[ cluster_membership==2 ]
##D   ##    [1] "B11" "B12" "B13" "B14" "B15" "B16" "B17" "B18" "B19" "B20" "B21" "B22"
##D   ##   [13] "B23" "B25" "B26" "B27" "B28" "B29" "B30"
##D # Cluster 3:
##D colnames(dat)[ cluster_membership==3 ]
##D   ##    [1] "B24" "C31" "C32" "C33" "C34" "C35" "C36" "C37" "C38" "C39" "C40" "C41"
##D   ##   [13] "C42" "C43" "C44" "C45" "C46" "C47" "C48" "C49" "C50"
##D 
##D #************************
##D # Example B
##D dat <- data.reck79ExB$data
##D #- estimate person score
##D score <- stats::qnorm( ( rowMeans( dat )+.5 )  / ( ncol(dat) + 1 ) )
##D #- extract item cluster
##D itemcluster <- substring( colnames(dat), 1, 1 )
##D #- confirmatory DETECT Item cluster
##D detectB <- sirt::conf.detect( data=dat, score=score, itemcluster=itemcluster )
##D   ##          unweighted weighted
##D   ##   DETECT      0.715    0.715
##D   ##   ASSI        0.624    0.624
##D   ##   RATIO       0.855    0.855
##D 
##D #- exploratory DETECT analysis
##D detect_explB <- sirt::expl.detect(data=dat, score, nclusters=10, N.est=nrow(dat)/2  )
##D   ##   Optimal Cluster Size is  4  (Maximum of DETECT Index)
##D   ##
##D   ##     N.Cluster N.items N.est N.val         size.cluster DETECT.est ASSI.est
##D   ##   1         2      50  1250  1250                30-20      0.665    0.546
##D   ##   2         3      50  1250  1250             10-20-20      0.686    0.585
##D   ##   3         4      50  1250  1250           10-20-8-12      0.728    0.644
##D   ##   4         5      50  1250  1250         10-6-14-8-12      0.654    0.553
##D   ##   5         6      50  1250  1250       10-6-14-3-12-5      0.659    0.561
##D   ##   6         7      50  1250  1250      10-6-14-3-7-5-5      0.664    0.576
##D   ##   7         8      50  1250  1250     10-6-7-7-3-7-5-5      0.616    0.518
##D   ##   8         9      50  1250  1250   10-6-7-7-3-5-5-5-2      0.612    0.512
##D   ##   9        10      50  1250  1250 10-6-7-7-3-5-3-5-2-2      0.613    0.512
## End(Not run)




library(TAM)


### Name: tam.wle
### Title: Weighted Likelihood Estimation and Maximum Likelihood Estimation
###   of Person Parameters
### Aliases: tam.wle tam.mml.wle tam.mml.wle2 tam_jml_wle print.tam.wle
###   summary.tam.wle
### Keywords: WLE MLE Person parameter estimation print

### ** Examples

#############################################################################
# EXAMPLE 1: 1PL model, data.sim.rasch
#############################################################################

data(data.sim.rasch)
# estimate Rasch model
mod1 <- TAM::tam.mml(resp=data.sim.rasch)
# WLE estimation
wle1 <- TAM::tam.wle( mod1 )
  ## WLE Reliability=0.894

print(wle1)
summary(wle1)

# scoring for a different dataset containing same items (first 10 persons in sim.rasch)
wle2 <- TAM::tam.wle( mod1, score.resp=data.sim.rasch[1:10,])

#--- WLE estimation without using a TAM object

#* create an input list
input <- list( resp=data.sim.rasch, AXsi=mod1$AXsi, B=mod1$B )
#* estimation
wle2b <- TAM::tam.mml.wle2( input )

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: 3-dimensional Rasch model | data.read from sirt package
##D #############################################################################
##D 
##D data(data.read, package="sirt")
##D # define Q-matrix
##D Q <- matrix(0,12,3)
##D Q[ cbind( 1:12, rep(1:3,each=4) ) ] <- 1
##D # redefine data: create some missings for first three cases
##D resp <- data.read
##D resp[1:2, 5:12] <- NA
##D resp[3,1:4] <- NA
##D   ##   > head(resp)
##D   ##      A1 A2 A3 A4 B1 B2 B3 B4 C1 C2 C3 C4
##D   ##   2   1  1  1  1 NA NA NA NA NA NA NA NA
##D   ##   22  1  1  0  0 NA NA NA NA NA NA NA NA
##D   ##   23 NA NA NA NA  1  0  1  1  1  1  1  1
##D   ##   41  1  1  1  1  1  1  1  1  1  1  1  1
##D   ##   43  1  0  0  1  0  0  1  1  1  0  1  0
##D   ##   63  1  1  0  0  1  0  1  1  1  1  1  1
##D 
##D # estimate 3-dimensional Rasch model
##D mod <- TAM::tam.mml( resp=resp, Q=Q, control=list(snodes=1000,maxiter=50) )
##D summary(mod)
##D 
##D # WLE estimates
##D wmod <- TAM::tam.wle(mod, Msteps=3)
##D summary(wmod)
##D   ##   head(round(wmod,2))
##D   ##      pid N.items PersonScores.Dim01 PersonScores.Dim02 PersonScores.Dim03
##D   ##   2    1       4                3.7                0.3                0.3
##D   ##   22   2       4                2.0                0.3                0.3
##D   ##   23   3       8                0.3                3.0                3.7
##D   ##   41   4      12                3.7                3.7                3.7
##D   ##   43   5      12                2.0                2.0                2.0
##D   ##   63   6      12                2.0                3.0                3.7
##D   ##      PersonMax.Dim01 PersonMax.Dim02 PersonMax.Dim03 theta.Dim01 theta.Dim02
##D   ##   2              4.0             0.6             0.6        1.06          NA
##D   ##   22             4.0             0.6             0.6       -0.96          NA
##D   ##   23             0.6             4.0             4.0          NA       -0.07
##D   ##   41             4.0             4.0             4.0        1.06        0.82
##D   ##   43             4.0             4.0             4.0       -0.96       -1.11
##D   ##   63             4.0             4.0             4.0       -0.96       -0.07
##D   ##      theta.Dim03 error.Dim01 error.Dim02 error.Dim03 WLE.rel.Dim01
##D   ##   2           NA        1.50          NA          NA          -0.1
##D   ##   22          NA        1.11          NA          NA          -0.1
##D   ##   23        0.25          NA        1.17        1.92          -0.1
##D   ##   41        0.25        1.50        1.48        1.92          -0.1
##D   ##   43       -1.93        1.11        1.10        1.14          -0.1
##D 
##D # (1) Note that estimated WLE reliabilities are not trustworthy in this example.
##D # (2) If cases do not possess any observations on dimensions, then WLEs
##D #     and their corresponding standard errors are set to NA.
##D 
##D #############################################################################
##D # EXAMPLE 3: Partial credit model | Comparison WLEs with PP package
##D #############################################################################
##D 
##D library(PP)
##D data(data.gpcm)
##D dat <- data.gpcm
##D I <- ncol(dat)
##D 
##D #****************************************
##D #*** Model 1: Partial Credit Model
##D 
##D # estimation in TAM
##D mod1 <- TAM::tam.mml( dat )
##D summary(mod1)
##D 
##D #-- WLE estimation in TAM
##D tamw1 <- TAM::tam.wle( mod1 )
##D 
##D #-- WLE estimation with PP package
##D # convert AXsi parameters into thres parameters for PP
##D AXsi0 <- - mod1$AXsi[,-1]
##D b <- AXsi0
##D K <- ncol(AXsi0)
##D for (cc in 2:K){
##D     b[,cc] <- AXsi0[,cc] - AXsi0[,cc-1]
##D }
##D # WLE estimation in PP
##D ppw1 <- PP::PP_gpcm( respm=as.matrix(dat),  thres=t(b), slopes=rep(1,I) )
##D 
##D #-- compare results
##D dfr <- cbind( tamw1[, c("theta","error") ], ppw1$resPP)
##D head( round(dfr,3))
##D   ##      theta error resPP.estimate resPP.SE nsteps
##D   ##   1 -1.006 0.973         -1.006    0.973      8
##D   ##   2 -0.122 0.904         -0.122    0.904      8
##D   ##   3  0.640 0.836          0.640    0.836      8
##D   ##   4  0.640 0.836          0.640    0.836      8
##D   ##   5  0.640 0.836          0.640    0.836      8
##D   ##   6 -1.941 1.106         -1.941    1.106      8
##D plot( dfr$resPP.estimate, dfr$theta, pch=16, xlab="PP", ylab="TAM")
##D lines( c(-10,10), c(-10,10) )
##D 
##D #****************************************
##D #*** Model 2: Generalized partial Credit Model
##D 
##D # estimation in TAM
##D mod2 <- TAM::tam.mml.2pl( dat, irtmodel="GPCM" )
##D summary(mod2)
##D 
##D #-- WLE estimation in TAM
##D tamw2 <- TAM::tam.wle( mod2 )
##D 
##D #-- WLE estimation in PP
##D # convert AXsi parameters into thres and slopes parameters for PP
##D AXsi0 <- - mod2$AXsi[,-1]
##D slopes <- mod2$B[,2,1]
##D K <- ncol(AXsi0)
##D slopesM <- matrix( slopes, I, ncol=K )
##D AXsi0 <- AXsi0 / slopesM
##D b <- AXsi0
##D for (cc in 2:K){
##D     b[,cc] <- AXsi0[,cc] - AXsi0[,cc-1]
##D }
##D # estimation in PP
##D ppw2 <- PP::PP_gpcm( respm=as.matrix(dat),  thres=t(b), slopes=slopes )
##D 
##D #-- compare results
##D dfr <- cbind( tamw2[, c("theta","error") ], ppw2$resPP)
##D head( round(dfr,3))
##D   ##      theta error resPP.estimate resPP.SE nsteps
##D   ##   1 -0.476 0.971         -0.476    0.971     13
##D   ##   2 -0.090 0.973         -0.090    0.973     13
##D   ##   3  0.311 0.960          0.311    0.960     13
##D   ##   4  0.311 0.960          0.311    0.960     13
##D   ##   5  1.749 0.813          1.749    0.813     13
##D   ##   6 -1.513 1.032         -1.513    1.032     13
## End(Not run)




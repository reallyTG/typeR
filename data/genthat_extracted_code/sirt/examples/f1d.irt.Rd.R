library(sirt)


### Name: f1d.irt
### Title: Functional Unidimensional Item Response Model
### Aliases: f1d.irt
### Keywords: Functional unidimensional item response model

### ** Examples

#############################################################################
# EXAMPLE 1: Dataset Mathematics data.math | Exploratory multidimensional model
#############################################################################
data(data.math)
dat <- ( data.math$data )[, -c(1,2) ] # select Mathematics items

#****
# Model 1: Functional unidimensional model based on original data

#++ (1) estimate model with 3 factors
mod1 <- sirt::f1d.irt( dat=dat, nfactors=3)

#++ (2) plot results
     par(mfrow=c(1,2))
# Intercepts
plot( mod1$item$di0, mod1$item$di.ast, pch=16, main="Item Intercepts",
        xlab=expression( paste( d[i], " (Unidimensional Model)" )),
        ylab=expression( paste( d[i], " (Functional Unidimensional Model)" )))
abline( lm(mod1$item$di.ast ~ mod1$item$di0), col=2, lty=2 )
# Discriminations
plot( mod1$item$ai0, mod1$item$ai.ast, pch=16, main="Item Discriminations",
        xlab=expression( paste( a[i], " (Unidimensional Model)" )),
        ylab=expression( paste( a[i], " (Functional Unidimensional Model)" )))
abline( lm(mod1$item$ai.ast ~ mod1$item$ai0), col=2, lty=2 )
     par(mfrow=c(1,1))

#++ (3) estimate bifactor model and Green-Yang reliability
gy1 <- sirt::greenyang.reliability( mod1$tetra, nfactors=3 )

## Not run: 
##D #****
##D # Model 2: Functional unidimensional model based on estimated multidimensional
##D #          item response model
##D 
##D #++ (1) estimate 2-dimensional exploratory factor analysis with 'smirt'
##D I <- ncol(dat)
##D Q <- matrix( 1, I,2 )
##D Q[1,2] <- 0
##D variance.fixed <- cbind( 1,2,0 )
##D mod2a <- sirt::smirt( dat, Qmatrix=Q, irtmodel="comp", est.a="2PL",
##D                 variance.fixed=variance.fixed, maxiter=50)
##D #++ (2) input estimated discriminations and intercepts for
##D #       functional unidimensional model
##D mod2b <- sirt::f1d.irt( A=mod2a$a, intercept=mod2a$b )
##D 
##D #############################################################################
##D # EXAMPLE 2: Dataset Mathematics data.math | Confirmatory multidimensional model
##D #############################################################################
##D 
##D data(data.math)
##D library(TAM)
##D 
##D # dataset
##D dat <- data.math$data
##D dat <- dat[, grep("M", colnames(dat) ) ]
##D # extract item informations
##D iteminfo <- data.math$item
##D I <- ncol(dat)
##D # define Q-matrix
##D Q <- matrix( 0, nrow=I, ncol=3 )
##D Q[ grep( "arith", iteminfo$domain ), 1 ] <- 1
##D Q[ grep( "Meas", iteminfo$domain ), 2 ] <- 1
##D Q[ grep( "geom", iteminfo$domain ), 3 ] <- 1
##D 
##D # fit three-dimensional model in TAM
##D mod1 <- TAM::tam.mml.2pl(  dat, Q=Q, control=list(maxiter=40, snodes=1000) )
##D summary(mod1)
##D 
##D # specify functional unidimensional model
##D intercept <- mod1$xsi[, c("xsi") ]
##D names(intercept) <- rownames(mod1$xsi)
##D fumod1 <- sirt::f1d.irt( A=mod1$B[,2,], intercept=intercept, Sigma=mod1$variance)
##D fumod1$item
## End(Not run)




library(miceadds)


### Name: mice_impute_2l_lmer
### Title: Imputation of a Continuous or a Binary Variable From a Two-Level
###   Regression Model using 'lme4' or 'blme'
### Aliases: mice.impute.2l.binary mice.impute.2l.continuous
###   mice.impute.2l.pmm
### Keywords: mice imputation method

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Imputation of a binary variable
##D #############################################################################
##D 
##D #--- simulate missing values
##D set.seed(976)
##D G <- 30        # number of groups
##D n <- 8        # number of persons per group
##D iccx <- .2    # intra-class correlation X
##D iccy <- .3    # latent intra-class correlation binary outcome
##D bx <- .4    # regression coefficient
##D threshy <- stats::qnorm(.70)  # threshold for y
##D x <- rep( rnorm( G, sd=sqrt( iccx) ), each=n )  +
##D             rnorm(G*n, sd=sqrt( 1 - iccx) )
##D y <- bx * x + rep( rnorm( G, sd=sqrt( iccy) ), each=n )  +
##D                 rnorm(G*n, sd=sqrt( 1 - iccy) )
##D y <- 1 * ( y > threshy )
##D dat <- data.frame( group=100+rep(1:G, each=n), x=x, y=y )
##D 
##D #* create some missings
##D dat1 <- dat
##D dat1[ seq( 1, G*n, 3 ),"y" ]  <- NA
##D dat1[ dat1$group==2, "y" ] <- NA
##D 
##D #--- prepare imputation in mice
##D vars <- colnames(dat1)
##D V <- length(vars)
##D #* predictor matrix
##D predmat <- matrix( 0, nrow=V, ncol=V)
##D rownames(predmat) <- colnames(predmat) <- vars
##D predmat["y", ] <- c(-2,2,0)
##D #* imputation methods
##D impmeth <- rep("",V)
##D names(impmeth) <- vars
##D impmeth["y"] <- "2l.binary"
##D 
##D #** imputation with logistic regression ('2l.binary')
##D imp1 <- mice::mice( data=as.matrix(dat1), method=impmeth,
##D                 predictorMatrix=predmat, maxit=1, m=5 )
##D 
##D #** imputation with predictive mean matching ('2l.pmm')
##D impmeth["y"] <- "2l.pmm"
##D imp2 <- mice::mice( data=as.matrix(dat1), method=impmeth,
##D                 predictorMatrix=predmat, maxit=1, m=5 )
##D 
##D #** imputation with logistic regression using blme package
##D blme_args <- list( "cov.prior"="invwishart")
##D imp3 <- mice::mice( data=as.matrix(dat1), method=impmeth,
##D                 predictorMatrix=predmat, maxit=1, m=5,
##D                 blme_use=TRUE, blme_args=blme_args )
## End(Not run)




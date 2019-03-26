library(sirt)


### Name: mle.pcm.group
### Title: Maximum Likelihood Estimation of Person or Group Parameters in
###   the Generalized Partial Credit Model
### Aliases: mle.pcm.group
### Keywords: Person parameters Group parameters

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Estimation of a group parameter for only one item per group
##D #############################################################################
##D 
##D data(data.si01)
##D dat <- data.si01
##D # item parameter estimation (partial credit model) in TAM
##D library(TAM)
##D mod <- TAM::tam.mml( dat[,2:3], irtmodel="PCM")
##D # extract item difficulties
##D b <- matrix( mod$xsi$xsi, nrow=2, byrow=TRUE )
##D # groupwise estimation
##D res1 <- sirt::mle.pcm.group( dat[,2:3], b=b, group=dat$idgroup )
##D # individual estimation
##D res2 <- sirt::mle.pcm.group( dat[,2:3], b=b  )
##D 
##D #############################################################################
##D # EXAMPLE 2: Data Reading data.read
##D #############################################################################
##D 
##D data(data.read)
##D # estimate Rasch model
##D mod <- sirt::rasch.mml2( data.read )
##D score <- rowSums( data.read )
##D data.read <- data.read[ order(score), ]
##D score <- score[ order(score) ]
##D # compare different epsilon-adjustments
##D res30 <- sirt::mle.pcm.group( data.read, b=matrix( mod$item$b, 12, 1 ),
##D                adj_eps=.3 )$person
##D res10 <- sirt::mle.pcm.group( data.read, b=matrix( mod$item$b, 12, 1 ),
##D              adj_eps=.1 )$person
##D res05 <- sirt::mle.pcm.group( data.read, b=matrix( mod$item$b, 12, 1 ),
##D               adj_eps=.05 )$person
##D # plot different scorings
##D plot( score, res05$theta, type="l", xlab="Raw score", ylab=expression(theta[epsilon]),
##D          main="Scoring with different epsilon-adjustments")
##D lines( score, res10$theta, col=2, lty=2 )
##D lines( score, res30$theta, col=4, lty=3 )
## End(Not run)




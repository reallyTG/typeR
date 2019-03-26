library(sirt)


### Name: pcm.fit
### Title: Item and Person Fit Statistics for the Partial Credit Model
### Aliases: pcm.fit
### Keywords: Item fit Person fit

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Partial credit model
##D #############################################################################
##D 
##D data(data.Students,package="CDM")
##D dat <- data.Students
##D # select items
##D items <- c(paste0("sc", 1:4 ), paste0("mj", 1:4 ) )
##D dat <- dat[,items]
##D dat <- dat[ rowSums( 1 - is.na(dat) ) > 0, ]
##D 
##D #*** Model 1a: Partial credit model in TAM
##D # estimate model
##D mod1a <- TAM::tam.mml( resp=dat )
##D summary(mod1a)
##D # estimate person parameters
##D wle1a <- TAM::tam.wle(mod1a)
##D # extract item parameters
##D b1 <- - mod1a$AXsi[, -1 ]
##D # parametrization in xsi parameters
##D b2 <- matrix( mod1a$xsi$xsi, ncol=3, byrow=TRUE )
##D # convert b2 to b1
##D b1b <- 0*b1
##D b1b[,1] <- b2[,1]
##D b1b[,2] <- rowSums( b2[,1:2] )
##D b1b[,3] <- rowSums( b2[,1:3] )
##D # assess fit
##D fit1a <- sirt::pcm.fit(b=b1, theta=wle1a$theta, dat)
##D fit1a$item
##D 
##D #############################################################################
##D # EXAMPLE 2: Rasch model
##D #############################################################################
##D 
##D data(data.read)
##D dat <- data.read
##D 
##D #*** Rasch model in TAM
##D # estimate model
##D mod <- TAM::tam.mml( resp=dat )
##D summary(mod)
##D # estimate person parameters
##D wle <- TAM::tam.wle(mod)
##D # extract item parameters
##D b1 <- - mod$AXsi[, -1 ]
##D # assess fit
##D fit1a <- sirt::pcm.fit(b=b1, theta=wle$theta, dat)
##D fit1a$item
##D 
##D #############################################################################
##D # EXAMPLE 3: Rating scale model
##D #############################################################################
##D 
##D data(data.Students,package="CDM")
##D dat <- data.Students
##D items <- paste0("sc", 1:4 )
##D dat <- dat[,items]
##D dat <- dat[ rowSums( 1 - is.na(dat) ) > 0, ]
##D 
##D #*** Model 1: Rating scale model in TAM
##D # estimate model
##D mod1 <- tam.mml( resp=dat, irtmodel="RSM")
##D summary(mod1)
##D # estimate person parameters
##D wle1 <- tam.wle(mod1)
##D # extract item parameters
##D b1 <- - mod1a$AXsi[, -1 ]
##D # fit statistic
##D pcm.fit(b=b1, theta=wle1$theta, dat)
## End(Not run)




library(miceadds)


### Name: mice.impute.pmm3
### Title: Imputation by Predictive Mean Matching (in 'miceadds')
### Aliases: mice.impute.pmm3 mice.impute.pmm4 mice.impute.pmm5
###   mice.impute.pmm6
### Keywords: Predictive mean matching mice imputation method

### ** Examples

## Not run: 
##D #############################################################################
##D # SIMULATED EXAMPLE 1: Two variables x and y with missing y
##D #############################################################################
##D set.seed(1413)
##D 
##D rho <- .6   # correlation between x and y
##D N <- 6800    # number of cases
##D x <- stats::rnorm(N)
##D My <- .35   # mean of y
##D y.com <- y <- My + rho * x + stats::rnorm(N, sd=sqrt( 1 - rho^2 ) )
##D 
##D # create missingness on y depending on rho.MAR parameter
##D rho.mar <- .4    # correlation response tendency z and x
##D missrate <- .25  # missing response rate
##D # simulate response tendency z and missings on y
##D z <- rho.mar * x + stats::rnorm(N, sd=sqrt( 1 - rho.mar^2 ) )
##D y[ z < stats::qnorm( missrate ) ] <- NA
##D dat <- data.frame(x, y )
##D 
##D # mice imputation
##D impmethod <- rep("pmm", 2 )
##D names(impmethod) <- colnames(dat)
##D 
##D # pmm (in mice)
##D imp1 <- mice::mice( as.matrix(dat), m=1, maxit=1, imputationMethod=impmethod)
##D # pmm3 (in miceadds)
##D imp3 <- mice::mice( as.matrix(dat), m=1, maxit=1,
##D            imputationMethod=gsub("pmm","pmm3",impmethod)  )
##D # pmm4 (in miceadds)
##D imp4 <- mice::mice( as.matrix(dat), m=1, maxit=1,
##D            imputationMethod=gsub("pmm","pmm4",impmethod)  )
##D # pmm5 (in miceadds)
##D imp5 <- mice::mice( as.matrix(dat), m=1, maxit=1,
##D            imputationMethod=gsub("pmm","pmm5",impmethod)  )
##D # pmm6 (in miceadds)
##D imp6 <- mice::mice( as.matrix(dat), m=1, maxit=1,
##D            imputationMethod=gsub("pmm","pmm6",impmethod)  )
##D 
##D dat.imp1 <- mice::complete( imp1, 1 )
##D dat.imp3 <- mice::complete( imp3, 1 )
##D dat.imp4 <- mice::complete( imp4, 1 )
##D dat.imp5 <- mice::complete( imp5, 1 )
##D dat.imp6 <- mice::complete( imp6, 1 )
##D 
##D dfr <- NULL
##D # means
##D dfr <- rbind( dfr, c( mean( y.com ), mean( y, na.rm=TRUE ), mean( dat.imp1$y),
##D     mean( dat.imp3$y), mean( dat.imp4$y), mean( dat.imp5$y),  mean( dat.imp6$y)  ) )
##D # SD
##D dfr <- rbind( dfr, c( stats::sd( y.com ), stats::sd( y, na.rm=TRUE ),
##D       stats::sd( dat.imp1$y), stats::sd( dat.imp3$y), stats::sd( dat.imp4$y),
##D       stats::sd( dat.imp5$y), stats::sd( dat.imp6$y) ) )
##D # correlations
##D dfr <- rbind( dfr, c( stats::cor( x,y.com ),
##D     stats::cor( x[ ! is.na(y) ], y[ ! is.na(y) ] ),
##D     stats::cor( dat.imp1$x, dat.imp1$y), stats::cor( dat.imp3$x, dat.imp3$y),
##D     stats::cor( dat.imp4$x, dat.imp4$y), stats::cor( dat.imp5$x, dat.imp5$y),
##D     stats::cor( dat.imp6$x, dat.imp6$y)
##D         ) )
##D rownames(dfr) <- c("M_y", "SD_y", "cor_xy" )
##D colnames(dfr) <- c("compl", "ld", "pmm", "pmm3", "pmm4", "pmm5","pmm6")
##D ##           compl     ld    pmm   pmm3   pmm4   pmm5   pmm6
##D ##   M_y    0.3306 0.4282 0.3314 0.3228 0.3223 0.3264 0.3310
##D ##   SD_y   0.9910 0.9801 0.9873 0.9887 0.9891 0.9882 0.9877
##D ##   cor_xy 0.6057 0.5950 0.6072 0.6021 0.6100 0.6057 0.6069
## End(Not run)




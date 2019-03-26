library(sirt)


### Name: Q3
### Title: Estimation of the Q_3 Statistic (Yen, 1984)
### Aliases: Q3
### Keywords: Testlets Local dependence Q3

### ** Examples

#############################################################################
# EXAMPLE 1: data.read. The 12 items are arranged in 4 testlets
#############################################################################
data(data.read)

# estimate the Rasch model
mod <- sirt::rasch.mml2( data.read)
# estmate WLEs
mod.wle <- sirt::wle.rasch( dat=data.read, b=mod$item$b )
# calculate Yen's Q3 statistic
mod.q3 <- sirt::Q3( dat=data.read, theta=mod.wle$theta, b=mod$item$b )
  ##   Yen's Q3 Statistic based on an estimated theta score
  ##   *** 12 Items | 66 item pairs
  ##   *** Q3 Descriptives
  ##        M     SD    Min    10%    25%    50%    75%    90%    Max
  ##   -0.085  0.110 -0.261 -0.194 -0.152 -0.107 -0.051  0.041  0.412

# plot Q3 statistics
I <- ncol(data.read)
image( 1:I, 1:I, mod.q3$q3.matrix, col=gray( 1 - (0:32)/32),
        xlab="Item", ylab="Item")
abline(v=c(5,9)) # borders for testlets
abline(h=c(5,9))

## Not run: 
##D # obtain Q3 statistic from modelfit.sirt function which is based on the
##D # posterior distribution of theta and not on observed values
##D fitmod <- sirt::modelfit.sirt( mod )
##D # extract Q3 statistic
##D q3stat <- fitmod$itempairs$Q3
##D   ##  > summary(q3stat)
##D   ##      Min.  1st Qu.   Median     Mean  3rd Qu.     Max.
##D   ##  -0.21760 -0.11590 -0.07280 -0.05545 -0.01220  0.44710
##D   ##  > sd(q3stat)
##D   ##  [1] 0.1101451
## End(Not run)




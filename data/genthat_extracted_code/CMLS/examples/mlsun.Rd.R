library(CMLS)


### Name: mlsun
### Title: Multivariate Least Squares with Unimodality (and E/I)
###   Constraints
### Aliases: mlsun
### Keywords: models multivariate regression optimize smooth

### ** Examples

######***######   GENERATE DATA   ######***######

# make X
set.seed(2)
n <- 50
m <- 20
p <- 2
Xmat <- matrix(rnorm(n*p), nrow = n, ncol = p)

# make B (which satisfies all constraints except monotonicity)
x <- seq(0, 1, length.out = m)
Bmat <- rbind(sin(2*pi*x), sin(2*pi*x+pi)) / sqrt(4.75)
struc <- rbind(rep(c(TRUE, FALSE), each = m / 2),
               rep(c(FALSE, TRUE), each = m / 2))
Bmat <- Bmat * struc

# make noisy data
set.seed(1)
Ymat <- Xmat %*% Bmat + rnorm(n*m, sd = 0.25)


######***######   UNIMODALITY   ######***######

# unimodal
Bhat.cmls <- cmls(X = Xmat, Y = Ymat, const = "unimod")
Bhat.mlsun <- t(mlsun(X = Xmat, Y = Ymat))
mean((Bhat.cmls - Bhat.mlsun)^2)

# unimodal and structured
Bhat.cmls <- cmls(X = Xmat, Y = Ymat, const = "unimod", struc = struc)
Amat <- vector("list", p)
meq <- rep(0, p)
for(j in 1:p){
   meq[j] <- sum(!struc[j,])
   if(meq[j] > 0){
      A <- matrix(0, nrow = m, ncol = meq[j])
      A[!struc[j,],] <- diag(meq[j])
      Amat[[j]] <- A
   } else {
      Amat[[j]] <- matrix(0, nrow = m, ncol = 1)
   }
}
Bhat.mlsun <- t(mlsun(X = Xmat, Y = Ymat, A = Amat, meq = meq))
mean((Bhat.cmls - Bhat.mlsun)^2)

# unimodal and non-negative
Bhat.cmls <- cmls(X = Xmat, Y = Ymat, const = "uninon")
Bhat.mlsun <- t(mlsun(X = Xmat, Y = Ymat, A = diag(m)))
mean((Bhat.cmls - Bhat.mlsun)^2)

# unimodal and non-negative and structured
Bhat.cmls <- cmls(X = Xmat, Y = Ymat, const = "uninon", struc = struc)
eye <- diag(m)
meq <- rep(0, p)
for(j in 1:p){
   meq[j] <- sum(!struc[j,])
   Amat[[j]] <- eye[,sort(struc[j,], index.return = TRUE)$ix]
}
Bhat.mlsun <- t(mlsun(X = Xmat, Y = Ymat, A = Amat, meq = meq))
mean((Bhat.cmls - Bhat.mlsun)^2)


# see internals of cmls.R for further examples





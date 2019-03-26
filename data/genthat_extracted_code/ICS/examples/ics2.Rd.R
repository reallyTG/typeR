library(ICS)


### Name: ics2
### Title: Two Scatter Matrices ICS Transformation Augmented by Two
###   Location Estimates
### Aliases: ics2
### Keywords: models multivariate

### ** Examples

 set.seed(123456)
 X1 <- rmvnorm(250, rep(0,8), diag(c(rep(1,6),0.04,0.04)))
 X2 <- rmvnorm(50, c(rep(0,6),2,0), diag(c(rep(1,6),0.04,0.04)))
 X3 <- rmvnorm(200, c(rep(0,7),2), diag(c(rep(1,6),0.04,0.04)))

 X.comps <- rbind(X1,X2,X3)
 A <- matrix(rnorm(64),nrow=8)
 X <- X.comps %*% t(A)
 
 # the default
 ics2.X.1 <- ics2(X2)
 summary(ics2.X.1)
 
 # using another function as S2 not with its default
 ics2.X.2 <- ics2(X2, S2 = tM, S2args = list(df = 2))
 summary(ics2.X.2)
 
 # computing in advance S2 and using another S1
 Scauchy <- tM(X)
 ics2.X.2 <- ics2(X2, S1 = tM, S2 = Scauchy, S1args = list(df = 5))
 summary(ics2.X.2)
 plot(ics2.X.2)




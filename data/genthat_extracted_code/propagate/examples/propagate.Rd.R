library(propagate)


### Name: propagate
### Title: Propagation of uncertainty using higher-order Taylor expansion
###   and Monte Carlo simulation
### Aliases: propagate
### Keywords: array algebra multivariate

### ** Examples

## In these examples, 'nsim = 100000' to save
## Rcmd check time (CRAN). It is advocated
## to use at least 'nsim = 1000000' though...

## Example without given degrees-of-freedom.
EXPR1 <- expression(x/y)
x <- c(5, 0.01)
y <- c(1, 0.01)
DF1 <- cbind(x, y)
RES1 <- propagate(expr = EXPR1, data = DF1, type = "stat", 
                  do.sim = TRUE, verbose = TRUE, 
                  nsim = 100000)
RES1

## Same example with given degrees-of-freedom
## => third row in input 'data'.
EXPR2 <- expression(x/y)
x <- c(5, 0.01, 12)
y <- c(1, 0.01, 5)
DF2 <- cbind(x, y)
RES2 <- propagate(expr = EXPR2, data = DF2, type = "stat", 
                  do.sim = TRUE, verbose = TRUE,
                  nsim = 100000)
RES2

## With the 'summary' function, we can get the
## Welch-Satterthwaite DF's, coverage, expanded uncertainty,
## Gradient and Hessian matrix etc.
summary(RES2)

## Example using a recursive function:
## no Taylor expansion possible, only Monte-Carlo.
a <- c(5, 0.1)
b <- c(100, 2)
DAT <- cbind(a, b)

f <- function(a, b) {
  N <- 0
  for (i in 1:100) {
    N <- N + i * log(a) + b^(1/i)
  }
  return(N)
}

propagate(f, DAT, nsim = 100000)

## Not run: 
##D ################# GUM 2008 (1) ########################
##D ## Example in Annex H.1 from the GUM 2008 manual
##D ## (see 'References'), an end gauge calibration
##D ## study. We use only first-order error propagation,
##D ## with total df = 16 and alpha = 0.01, 
##D ## as detailed in GUM H.1.6.
##D EXPR3 <- expression(ls + d - ls * (da * the + as * dt))
##D ls <- c(50000623, 25)
##D d <- c(215, 9.7)
##D da <- c(0, 0.58E-6)
##D the <- c(-0.1, 0.41)
##D as <- c(11.5E-6, 1.2E-6)
##D dt <- c(0, 0.029)
##D DF3 <- cbind(ls, d, da, the, as, dt)
##D RES3 <- propagate(expr = EXPR3, data = DF3, second.order = FALSE,
##D                   df = 16, alpha = 0.01)
##D RES3
##D ## propagate: sd.1 = 31.71 
##D ## GUM H.1.4/H.6c: u = 32  
##D 
##D ## Expanded uncertainty, from summary function.
##D summary(RES3)
##D ## propagate: 92.62
##D ## GUM H.1.6: 93
##D 
##D ## Proof that covariance of Monte-Carlo
##D ## simulated dataset is "fairly"" the same 
##D ## as from initial data.
##D RES3$covMat
##D cov(RES3$datSIM)
##D all.equal(RES3$covMat, cov(RES3$datSIM))
##D 
##D ## Now using second-order Taylor expansion.
##D RES4 <- propagate(expr = EXPR3, data = DF3)
##D RES4
##D ## propagate: sd.2 = 33.91115
##D ## GUM H.1.7: u = 34.
##D ## Also similar to the non-matrix-based approach
##D ## in Wang et al. (2005, page 408): u1 = 33.91115.
##D ## NOTE: After second-order correction ("sd.2"), 
##D ## uncertainty is more similar to the uncertainty
##D ## obtained from Monte Carlo simulation!
##D 
##D #################### GUM 2008 (2) #################
##D ## Example in Annex H.2 from the GUM 2008 manual
##D ## (see 'References'), simultaneous resistance
##D ## and reactance measurement.
##D data(H.2)
##D 
##D ## This gives exactly the means, uncertainties and
##D ## correlations as given in Table H.2:
##D colMeans(H.2)
##D sqrt(colVarsC(H.2))/sqrt(5)
##D cor(H.2)
##D 
##D ## H.2.3 Approach 1 using mean values and
##D ## standard uncertainties:
##D EXPR6a <- expression((V/I) *  cos(phi)) ## R
##D EXPR6b <- expression((V/I) *  sin(phi)) ## X
##D EXPR6c <- expression(V/I) ## Z
##D MEAN6 <- colMeans(H.2)
##D SD6 <- sqrt(colVarsC(H.2))
##D DF6 <- rbind(MEAN6, SD6)
##D COV6ab <- cov(H.2) ## covariance matrix of V, I, phi
##D COV6c <- cov(H.2[, 1:2])  ## covariance matrix of V, I
##D 
##D RES6a <- propagate(expr = EXPR6a, data = DF6, cov = COV6ab)
##D RES6b <- propagate(expr = EXPR6b, data = DF6, cov = COV6ab)
##D RES6c <- propagate(expr = EXPR6c, data = DF6[, 1:2], 
##D                    cov = COV6c)
##D 
##D ## This gives exactly the same values of mean and sd/sqrt(5)
##D ## as given in Table H.4.
##D RES6a$prop # 0.15892/sqrt(5) = 0.071
##D RES6b$prop # 0.66094/sqrt(5) = 0.296
##D RES6c$prop # 0.52846/sqrt(5) = 0.236
##D 
##D ######### GUM 2008 Supplement 1 (1) #######################
##D ## Example from 9.2.2 of the GUM 2008 Supplement 1
##D ## (see 'References'), normally distributed input
##D ## quantities. Assign values as in 9.2.2.1.
##D EXPR7 <- expression(X1 + X2 + X3 + X4)
##D X1 <- c(0, 1)
##D X2 <- c(0, 1)
##D X3 <- c(0, 1)
##D X4 <- c(0, 1)
##D DF7 <- cbind(X1, X2, X3, X4)
##D RES7 <- propagate(expr = EXPR7, data = DF7, nsim = 1E5)
##D ## This will give exactly the same results as in 
##D ## 9.2.2.6, Table 2.
##D RES7
##D 
##D ######### GUM 2008 Supplement 1 (2) #######################
##D ## Example from 9.3 of the GUM 2008 Supplement 1
##D ## (see 'References'), mass calibration.
##D ## Formula 24 in 9.3.1.3 and values as in 9.3.1.4, Table 5.
##D EXPR8 <- expression((Mrc + dMrc) * (1 + (Pa - Pa0) * ((1/Pw) - (1/Pr))) - Mnom)
##D Mrc <- rnorm(1E5, 100000, 0.050)
##D dMrc <- rnorm(1E5, 1.234, 0.020)
##D Pa <- runif(1E5, 1.10, 1.30)  ## E(Pa) = 1.2, (b-a)/2 = 0.1 
##D Pw <- runif(1E5, 7000, 9000)  ## E(Pw) = 8000, (b-a)/2 = 1000
##D Pr <- runif(1E5, 7950, 8050) ## E(Pr) = 8000, (b-a)/2 = 50
##D Pa0 <- 1.2 
##D Mnom <- 100000
##D DF8 <- cbind(Mrc, dMrc, Pa, Pw, Pr, Pa0, Mnom)
##D RES8 <- propagate(expr = EXPR8, data = DF8, nsim = 1E5)
##D ## This will give exactly the same results as in 
##D ## 9.3.2.3, Table 6
##D RES8
##D RES8
##D  
##D ######### GUM 2008 Supplement 1 (3) #######################
##D ## Example from 9.4 of the GUM 2008 Supplement 1
##D ## (see 'References'), comparioson loss in microwave
##D ## power meter calibration, zero covariance.
##D ## Formula 28 in 9.4.1.5 and values as in 9.4.1.7.
##D EXPR9 <- expression(X1^2 - X2^2)
##D X1 <- c(0.050, 0.005)
##D X2 <- c(0, 0.005)
##D DF9 <- cbind(X1, X2)
##D RES9a <- propagate(expr = EXPR9, data = DF9, nsim = 1E5)
##D ## This will give exactly the same results as in 
##D ## 9.4.2.2.7, Table 8, x1 = 0.050.
##D RES9a
##D 
##D ## Using covariance matrix with r(x1, x2) = 0.9
##D ## We convert to covariances using cor2cov.
##D COR9 <- matrix(c(1, 0.9, 0.9, 1), nrow = 2)
##D COV9 <- cor2cov(COR9, c(0.005^2, 0.005^2))
##D colnames(COV9) <- c("X1", "X2")
##D rownames(COV9) <- c("X1", "X2")
##D RES9b <- propagate(expr = EXPR9, data = DF9, cov = COV9)
##D ## This will give exactly the same results as in 
##D ## 9.4.3.2.1, Table 9, x1 = 0.050.
##D RES9b
##D 
##D ######### GUM 2008 Supplement 1 (4) #######################
##D ## Example from 9.5 of the GUM 2008 Supplement 1
##D ## (see 'References'), gauge block calibration.
##D ## Assignment of PDF's as in Table 10 of 9.5.2.1.
##D EXPR10 <- expression(Ls + D + d1 + d2 - Ls *(da *(t0 + Delta) + as * dt) - Lnom)
##D Lnom <- 50000000
##D Ls <- propagate:::rst(1000000, mean = 50000623, sd  = 25, df = 18)
##D D <- propagate:::rst(1000000, mean = 215, sd = 6, df = 25)
##D d1 <- propagate:::rst(1000000, mean = 0, sd = 4, df = 5)
##D d2 <- propagate:::rst(1000000, mean = 0, sd = 7, df = 8)
##D as <- runif(1000000, 9.5E-6, 13.5E-6)
##D t0 <- rnorm(1000000, -0.1, 0.2)
##D Delta <- propagate:::rarcsin(1000000, -0.5, 0.5)
##D da <- propagate:::rctrap(1000000, -1E-6, 1E-6, 0.1E-6)
##D dt <- propagate:::rctrap(1000000, -0.050, 0.050, 0.025)
##D DF10 <- cbind(Ls, D, d1, d2, as, t0, Delta, da, dt, Lnom)
##D RES10 <- propagate(expr = EXPR10, data = DF10, cov = FALSE, alpha = 0.01)
##D RES10
##D ## This gives the same results as in 9.5.4.2, Table 11.
##D ## However: results are exacter than in the GUM 2008
##D ## manual, especially when comparing sd(Monte Carlo) with sd.2!
##D ## GUM 2008 gives 32 and 36, respectively.
##D RES10
##D 
##D ########## Comparison to Pythons 'soerp' ###################
##D ## Exactly the same results as under 
##D ## https://pypi.python.org/pypi/soerp ! 
##D EXPR11 <- expression(C * sqrt((520 * H * P)/(M *(t + 460))))
##D H <- c(64, 0.5)
##D M <- c(16, 0.1)
##D P <- c(361, 2)
##D t <- c(165, 0.5)
##D C <- c(38.4, 0) 
##D DAT11 <- makeDat(EXPR11)
##D RES11 <- propagate(expr = EXPR11, data = DAT11) 
##D RES11
## End(Not run)   




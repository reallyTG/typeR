library(GJRM)


### Name: gjrm
### Title: Generalised Joint Regression Models with
###   Binary/Continuous/Discrete/Survival Margins
### Aliases: gjrm
### Keywords: generalised joint regression modelling smooth regression
###   spline copula marginal distribution non-random sample selection
###   flexible copula regression modelling partial observability
###   endogeneity survival data

### ** Examples


library(GJRM)

####################################
####################################
####################################
# JOINT MODELS WITH BINARY MARGINS #
####################################
####################################
####################################

############
## Example 1
############

set.seed(0)

n <- 400

Sigma <- matrix(0.5, 2, 2); diag(Sigma) <- 1
u     <- rMVN(n, rep(0,2), Sigma)

x1 <- round(runif(n)); x2 <- runif(n); x3 <- runif(n)

f1   <- function(x) cos(pi*2*x) + sin(pi*x)
f2   <- function(x) x+exp(-30*(x-0.5)^2)   

y1 <- ifelse(-1.55 + 2*x1    + f1(x2) + u[,1] > 0, 1, 0)
y2 <- ifelse(-0.25 - 1.25*x1 + f2(x2) + u[,2] > 0, 1, 0)

dataSim <- data.frame(y1, y2, x1, x2, x3)

## CLASSIC BIVARIATE PROBIT

out  <- gjrm(list(y1 ~ x1 + x2 + x3, 
                       y2 ~ x1 + x2 + x3), 
                       data = dataSim, 
                       margins = c("probit", "probit"),
                       Model = "B")
conv.check(out)
summary(out)
AIC(out)
BIC(out)

## Not run: 
##D  
##D 
##D 
##D ## BIVARIATE PROBIT with Splines
##D 
##D out  <- gjrm(list(y1 ~ x1 + s(x2) + s(x3), 
##D                   y2 ~ x1 + s(x2) + s(x3)),  
##D                   data = dataSim,
##D                   margins = c("probit", "probit"),
##D                   Model = "B")
##D conv.check(out)
##D summary(out)
##D AIC(out)
##D 
##D 
##D ## estimated smooth function plots - red lines are true curves
##D 
##D x2 <- sort(x2)
##D f1.x2 <- f1(x2)[order(x2)] - mean(f1(x2))
##D f2.x2 <- f2(x2)[order(x2)] - mean(f2(x2))
##D f3.x3 <- rep(0, length(x3))
##D 
##D par(mfrow=c(2,2),mar=c(4.5,4.5,2,2))
##D plot(out, eq = 1, select = 1, seWithMean = TRUE, scale = 0)
##D lines(x2, f1.x2, col = "red")
##D plot(out, eq = 1, select = 2, seWithMean = TRUE, scale = 0)
##D lines(x3, f3.x3, col = "red")
##D plot(out, eq = 2, select = 1, seWithMean = TRUE, scale = 0)
##D lines(x2, f2.x2, col = "red")
##D plot(out, eq = 2, select = 2, seWithMean = TRUE, scale = 0)
##D lines(x3, f3.x3, col = "red")
##D 
##D 
##D ## BIVARIATE PROBIT with Splines and 
##D ## varying dependence parameter
##D 
##D eq.mu.1  <- y1 ~ x1 + s(x2)
##D eq.mu.2  <- y2 ~ x1 + s(x2)
##D eq.theta <-    ~ x1 + s(x2)
##D 
##D fl <- list(eq.mu.1, eq.mu.2, eq.theta)
##D 
##D outD <- gjrm(fl, data = dataSim,
##D              margins = c("probit", "probit"),
##D              Model = "B")
##D              
##D conv.check(outD)  
##D summary(outD)
##D outD$theta
##D 
##D plot(outD, eq = 1, seWithMean = TRUE)
##D plot(outD, eq = 2, seWithMean = TRUE)
##D plot(outD, eq = 3, seWithMean = TRUE)
##D graphics.off()
##D 
##D ############
##D ## Example 2
##D ############
##D ## Generate data with one endogenous variable 
##D ## and exclusion restriction
##D 
##D set.seed(0)
##D 
##D n <- 400
##D 
##D Sigma <- matrix(0.5, 2, 2); diag(Sigma) <- 1
##D u     <- rMVN(n, rep(0,2), Sigma)
##D 
##D cov   <- rMVN(n, rep(0,2), Sigma)
##D cov   <- pnorm(cov)
##D x1 <- round(cov[,1]); x2 <- cov[,2]
##D 
##D f1   <- function(x) cos(pi*2*x) + sin(pi*x)
##D f2   <- function(x) x+exp(-30*(x-0.5)^2)   
##D 
##D y1 <- ifelse(-1.55 + 2*x1    + f1(x2) + u[,1] > 0, 1, 0)
##D y2 <- ifelse(-0.25 - 1.25*y1 + f2(x2) + u[,2] > 0, 1, 0)
##D 
##D dataSim <- data.frame(y1, y2, x1, x2)
##D 
##D #
##D ## Testing the hypothesis of absence of endogeneity... 
##D #
##D 
##D LM.bpm(list(y1 ~ x1 + s(x2), y2 ~ y1 + s(x2)), dataSim, Model = "B")
##D 
##D 
##D ## CLASSIC RECURSIVE BIVARIATE PROBIT
##D 
##D out <- gjrm(list(y1 ~ x1 + x2, 
##D                  y2 ~ y1 + x2), 
##D                  data = dataSim,
##D                  margins = c("probit", "probit"),
##D                  Model = "B")
##D conv.check(out)                        
##D summary(out)
##D AIC(out); BIC(out)
##D 
##D ## FLEXIBLE RECURSIVE BIVARIATE PROBIT
##D 
##D out <- gjrm(list(y1 ~ x1 + s(x2), 
##D                  y2 ~ y1 + s(x2)), 
##D                  data = dataSim,
##D                  margins = c("probit", "probit"),
##D                  Model = "B")
##D conv.check(out)                        
##D summary(out)
##D AIC(out); BIC(out)
##D 
##D #
##D ## Testing the hypothesis of absence of endogeneity post estimation... 
##D 
##D gt.bpm(out)
##D 
##D #
##D ## treatment effect, risk ratio and odds ratio with CIs
##D 
##D mb(y1, y2, Model = "B")
##D AT(out, nm.end = "y1", hd.plot = TRUE) 
##D RR(out, nm.end = "y1") 
##D OR(out, nm.end = "y1") 
##D AT(out, nm.end = "y1", type = "univariate") 
##D re.imp <- imputeCounter(out, m = 10, "y1")
##D re.imp$AT
##D 
##D ## try a Clayton copula model... 
##D 
##D outC <- gjrm(list(y1 ~ x1 + s(x2), 
##D                   y2 ~ y1 + s(x2)), 
##D                   data = dataSim, BivD = "C0",
##D                   margins = c("probit", "probit"),
##D                   Model = "B")
##D conv.check(outC)                         
##D summary(outC)
##D AT(outC, nm.end = "y1") 
##D re.imp <- imputeCounter(outC, m = 10, "y1")
##D re.imp$AT
##D 
##D ## try a Joe copula model... 
##D 
##D outJ <- gjrm(list(y1 ~ x1 + s(x2), 
##D                   y2 ~ y1 + s(x2)), 
##D                   data = dataSim, BivD = "J0",
##D                   margins = c("probit", "probit"),
##D                   Model = "B")
##D conv.check(outJ)
##D summary(outJ)
##D AT(outJ, "y1") 
##D re.imp <- imputeCounter(outJ, m = 10, "y1")
##D re.imp$AT
##D 
##D VuongClarke(out, outJ)
##D 
##D #
##D ## recursive bivariate probit modelling with unpenalized splines 
##D ## can be achieved as follows
##D 
##D outFP <- gjrm(list(y1 ~ x1 + s(x2, bs = "cr", k = 5), 
##D                    y2 ~ y1 + s(x2, bs = "cr", k = 6)), 
##D                    fp = TRUE, data = dataSim,
##D                    margins = c("probit", "probit"),
##D                    Model = "B")
##D conv.check(outFP)                            
##D summary(outFP)
##D 
##D # in the above examples a third equation could be introduced
##D # as illustrated in Example 1
##D 
##D #
##D #################
##D ## See also ?meps
##D #################
##D 
##D ############
##D ## Example 3
##D ############
##D ## Generate data with a non-random sample selection mechanism 
##D ## and exclusion restriction
##D 
##D set.seed(0)
##D 
##D n <- 2000
##D 
##D Sigma <- matrix(0.5, 2, 2); diag(Sigma) <- 1
##D u     <- rMVN(n, rep(0,2), Sigma)
##D 
##D SigmaC <- matrix(0.5, 3, 3); diag(SigmaC) <- 1
##D cov    <- rMVN(n, rep(0,3), SigmaC)
##D cov    <- pnorm(cov)
##D bi <- round(cov[,1]); x1 <- cov[,2]; x2 <- cov[,3]
##D   
##D f11 <- function(x) -0.7*(4*x + 2.5*x^2 + 0.7*sin(5*x) + cos(7.5*x))
##D f12 <- function(x) -0.4*( -0.3 - 1.6*x + sin(5*x))  
##D f21 <- function(x) 0.6*(exp(x) + sin(2.9*x)) 
##D 
##D ys <-  0.58 + 2.5*bi + f11(x1) + f12(x2) + u[, 1] > 0
##D y  <- -0.68 - 1.5*bi + f21(x1) +         + u[, 2] > 0
##D yo <- y*(ys > 0)
##D   
##D dataSim <- data.frame(y, ys, yo, bi, x1, x2)
##D 
##D #
##D ## Testing the hypothesis of absence of non-random sample selection... 
##D 
##D LM.bpm(list(ys ~ bi + s(x1) + s(x2), yo ~ bi + s(x1)), dataSim, Model = "BSS")
##D 
##D # p-value suggests presence of sample selection, hence fit a bivariate model
##D 
##D #
##D ## SEMIPARAMETRIC SAMPLE SELECTION BIVARIATE PROBIT
##D ## the first equation MUST be the selection equation
##D 
##D out <- gjrm(list(ys ~ bi + s(x1) + s(x2), 
##D                  yo ~ bi + s(x1)), 
##D                  data = dataSim, Model = "BSS",
##D                  margins = c("probit", "probit"))
##D conv.check(out)                          
##D gt.bpm(out)                        
##D 
##D ## compare the two summary outputs
##D ## the second output produces a summary of the results obtained when
##D ## selection bias is not accounted for
##D 
##D summary(out)
##D summary(out$gam2)
##D 
##D ## corrected predicted probability that 'yo' is equal to 1
##D 
##D mb(ys, yo, Model = "BSS")
##D prev(out, hd.plot = TRUE)
##D prev(out, type = "univariate", hd.plot = TRUE)
##D 
##D ## estimated smooth function plots
##D ## the red line is the true curve
##D ## the blue line is the univariate model curve not accounting for selection bias
##D 
##D x1.s <- sort(x1[dataSim$ys>0])
##D f21.x1 <- f21(x1.s)[order(x1.s)]-mean(f21(x1.s))
##D 
##D plot(out, eq = 2, ylim = c(-1.65,0.95)); lines(x1.s, f21.x1, col="red")
##D par(new = TRUE)
##D plot(out$gam2, se = FALSE, col = "blue", ylim = c(-1.65,0.95), 
##D      ylab = "", rug = FALSE)
##D 
##D #
##D #
##D ## try a Clayton copula model... 
##D 
##D outC <- gjrm(list(ys ~ bi + s(x1) + s(x2), 
##D                   yo ~ bi + s(x1)), 
##D                   data = dataSim, Model = "BSS", BivD = "C0",
##D                   margins = c("probit", "probit"))
##D conv.check(outC)
##D summary(outC)
##D prev(outC)
##D 
##D 
##D #######################
##D # Impute using Mice
##D #######################
##D 
##D library(mice)
##D 
##D ys <- dataSim$ys
##D 
##D dataSim$yo[dataSim$ys == FALSE] <- NA  
##D dataSim <- dataSim[, -c(1:2)]
##D 
##D imp <- mice(dataSim, m = 1, method = c("copulaSS", "", "", ""),  
##D             mice.formula = outC$mice.formula, margins = outC$margins, 
##D             BivD = outC$BivD, maxit = 1)
##D 
##D comp.yo <- dataSim$yo
##D comp.yo[ys == 0] <- imp$imp$yo[[1]]
##D mean(comp.yo)
##D 
##D #
##D ################
##D ## See also ?hiv
##D ################
##D 
##D ############
##D ## Example 4
##D ############
##D ## Generate data with partial observability
##D 
##D set.seed(0)
##D 
##D n <- 10000
##D 
##D Sigma <- matrix(0.5, 2, 2); diag(Sigma) <- 1
##D u     <- rMVN(n, rep(0,2), Sigma)
##D 
##D x1 <- round(runif(n)); x2 <- runif(n); x3 <- runif(n)
##D 
##D y1 <- ifelse(-1.55 + 2*x1 + x2 + u[,1] > 0, 1, 0)
##D y2 <- ifelse( 0.45 - x3        + u[,2] > 0, 1, 0)
##D y  <- y1*y2
##D 
##D dataSim <- data.frame(y, x1, x2, x3)
##D 
##D 
##D ## BIVARIATE PROBIT with Partial Observability
##D 
##D out  <- gjrm(list(y ~ x1 + x2, 
##D                   y ~ x3), 
##D                   data = dataSim, Model = "BPO",
##D                   margins = c("probit", "probit"))
##D conv.check(out)
##D summary(out)
##D 
##D # first ten estimated probabilities for the four events from object out
##D 
##D cbind(out$p11, out$p10, out$p00, out$p01)[1:10,]
##D 
##D 
##D # case with smooth function 
##D # (more computationally intensive)  
##D 
##D f1 <- function(x) cos(pi*2*x) + sin(pi*x)
##D 
##D y1 <- ifelse(-1.55 + 2*x1 + f1(x2) + u[,1] > 0, 1, 0)
##D y2 <- ifelse( 0.45 - x3            + u[,2] > 0, 1, 0)
##D y  <- y1*y2
##D 
##D dataSim <- data.frame(y, x1, x2, x3)
##D 
##D out  <- gjrm(list(y ~ x1 + s(x2), 
##D                   y ~ x3), 
##D                   data = dataSim, Model = "BPO",
##D                   margins = c("probit", "probit"))
##D 
##D conv.check(out)
##D summary(out)
##D 
##D 
##D # plot estimated and true functions
##D 
##D x2 <- sort(x2); f1.x2 <- f1(x2)[order(x2)] - mean(f1(x2))
##D plot(out, eq = 1, scale = 0); lines(x2, f1.x2, col = "red")
##D 
##D #
##D ################
##D ## See also ?war
##D ################
## End(Not run)

## Not run: 
##D 
##D ######################################################
##D ######################################################
##D ######################################################
##D # JOINT MODELS WITH BINARY AND/OR CONTINUOUS MARGINS #
##D ######################################################
##D ######################################################
##D ######################################################
##D 
##D library(GJRM)
##D 
##D ############
##D ## Example 5
##D ## Generate data
##D ## Correlation between the two equations 0.5 - Sample size 400 
##D 
##D set.seed(0)
##D 
##D n <- 400
##D 
##D Sigma <- matrix(0.5, 2, 2); diag(Sigma) <- 1
##D u     <- rMVN(n, rep(0,2), Sigma)
##D 
##D x1 <- round(runif(n)); x2 <- runif(n); x3 <- runif(n)
##D 
##D f1   <- function(x) cos(pi*2*x) + sin(pi*x)
##D f2   <- function(x) x+exp(-30*(x-0.5)^2)   
##D 
##D y1 <- -1.55 + 2*x1    + f1(x2) + u[,1]
##D y2 <- -0.25 - 1.25*x1 + f2(x2) + u[,2]
##D 
##D dataSim <- data.frame(y1, y2, x1, x2, x3)
##D 
##D resp.check(y1, "N")
##D resp.check(y2, "N")
##D 
##D eq.mu.1     <- y1 ~ x1 + s(x2) + s(x3)
##D eq.mu.2     <- y2 ~ x1 + s(x2) + s(x3)
##D eq.sigma2.1 <-    ~ 1
##D eq.sigma2.2 <-    ~ 1
##D eq.theta    <-    ~ x1
##D 
##D fl <- list(eq.mu.1, eq.mu.2, eq.sigma2.1, eq.sigma2.2, eq.theta)
##D 
##D # the order above is the one to follow when
##D # using more than two equations
##D 
##D out  <- gjrm(fl, data = dataSim, margins = c("N", "N"),
##D              Model = "B")
##D 
##D conv.check(out)
##D post.check(out)
##D summary(out)
##D AIC(out)
##D BIC(out)
##D jc.probs(out, 1.4, 2.3, intervals = TRUE)[1:4,]
##D 
##D ############
##D ## Example 6
##D ############
##D ## Generate data with one endogenous binary variable 
##D ## and continuous outcome
##D 
##D set.seed(0)
##D 
##D n <- 1000
##D 
##D Sigma <- matrix(0.5, 2, 2); diag(Sigma) <- 1
##D u     <- rMVN(n, rep(0,2), Sigma)
##D 
##D cov   <- rMVN(n, rep(0,2), Sigma)
##D cov   <- pnorm(cov)
##D x1 <- round(cov[,1]); x2 <- cov[,2]
##D 
##D f1   <- function(x) cos(pi*2*x) + sin(pi*x)
##D f2   <- function(x) x+exp(-30*(x-0.5)^2)   
##D 
##D y1 <- ifelse(-1.55 + 2*x1    + f1(x2) + u[,1] > 0, 1, 0)
##D y2 <-        -0.25 - 1.25*y1 + f2(x2) + u[,2] 
##D 
##D dataSim <- data.frame(y1, y2, x1, x2)
##D 
##D 
##D ## RECURSIVE Model
##D 
##D rc <- resp.check(y2, margin = "N", print.par = TRUE, loglik = TRUE)
##D AIC(rc); BIC(rc)
##D 
##D out <- gjrm(list(y1 ~ x1 + x2, 
##D                  y2 ~ y1 + x2), 
##D                  data = dataSim, margins = c("probit","N"),
##D                  Model = "B")
##D conv.check(out)                        
##D summary(out)
##D post.check(out)
##D 
##D ## SEMIPARAMETRIC RECURSIVE Model
##D 
##D eq.mu.1   <- y1 ~ x1 + s(x2) 
##D eq.mu.2   <- y2 ~ y1 + s(x2)
##D eq.sigma2 <-    ~ 1
##D eq.theta  <-    ~ 1
##D 
##D fl <- list(eq.mu.1, eq.mu.2, eq.sigma2, eq.theta)
##D 
##D out <- gjrm(fl, data = dataSim, 
##D             margins = c("probit","N"), gamlssfit = TRUE,
##D             Model = "B")
##D conv.check(out)                        
##D summary(out)
##D post.check(out)
##D jc.probs(out, 1, 1.5, intervals = TRUE)[1:4,]
##D AT(out, nm.end = "y1")
##D AT(out, nm.end = "y1", type = "univariate")
##D 
##D #
##D #
##D 
##D ############
##D ## Example 7
##D ############
##D ## Generate data with one endogenous continuous exposure 
##D ## and binary outcome
##D 
##D set.seed(0)
##D 
##D n <- 1000
##D 
##D Sigma <- matrix(0.5, 2, 2); diag(Sigma) <- 1
##D u     <- rMVN(n, rep(0,2), Sigma)
##D 
##D cov   <- rMVN(n, rep(0,2), Sigma)
##D cov   <- pnorm(cov)
##D x1 <- round(cov[,1]); x2 <- cov[,2]
##D 
##D f1   <- function(x) cos(pi*2*x) + sin(pi*x)
##D f2   <- function(x) x+exp(-30*(x-0.5)^2) 
##D 
##D y1 <-        -0.25 - 2*x1    + f2(x2) + u[,2] 
##D y2 <- ifelse(-0.25 - 0.25*y1 + f1(x2) + u[,1] > 0, 1, 0)
##D 
##D dataSim <- data.frame(y1, y2, x1, x2)
##D 
##D eq.mu.1   <- y2 ~ y1 + s(x2) 
##D eq.mu.2   <- y1 ~ x1 + s(x2)
##D eq.sigma2 <-    ~ 1
##D eq.theta  <-    ~ 1
##D 
##D fl <- list(eq.mu.1, eq.mu.2, eq.sigma2, eq.theta)
##D 
##D out <- gjrm(fl, data = dataSim, 
##D             margins = c("probit","N"),
##D             Model = "B")
##D conv.check(out)                        
##D summary(out)
##D post.check(out)
##D AT(out, nm.end = "y1")
##D AT(out, nm.end = "y1", type = "univariate")
##D RR(out, nm.end = "y1", rr.plot = TRUE)
##D RR(out, nm.end = "y1", type = "univariate")
##D OR(out, nm.end = "y1", or.plot = TRUE)
##D OR(out, nm.end = "y1", type = "univariate")
##D 
##D #
##D #
##D 
##D ############
##D ## Example 8
##D ##################
##D ## Survival models
##D ##################
##D 
##D set.seed(0)
##D 
##D n  <- 2000
##D c  <- runif(n, 3, 8)
##D u  <- runif(n, 0, 1)
##D z1 <- rbinom(n, 1, 0.5)
##D z2 <- runif(n, 0, 1)
##D t  <- rep(NA, n)
##D 
##D beta_0 <- -0.2357
##D beta_1 <- 1
##D 
##D f <- function(t, beta_0, beta_1, u, z1, z2){ 
##D   S_0 <- 0.7 * exp(-0.03*t^1.9) + 0.3*exp(-0.3*t^2.5)
##D   exp(-exp(log(-log(S_0))+beta_0*z1 + beta_1*z2))-u
##D }
##D 
##D 
##D for (i in 1:n){
##D    t[i] <- uniroot(f, c(0, 8), tol = .Machine$double.eps^0.5, 
##D                    beta_0 = beta_0, beta_1 = beta_1, u = u[i], 
##D                    z1 = z1[i], z2 = z2[i], extendInt = "yes" )$root
##D }
##D 
##D delta1  <- ifelse(t < c, 1, 0)
##D u1      <- apply(cbind(t, c), 1, min)
##D dataSim <- data.frame(u1, delta1, z1, z2)
##D 
##D 
##D c <- runif(n, 4, 8)
##D u <- runif(n, 0, 1)
##D z <- rbinom(n, 1, 0.5)
##D beta_0 <- -1.05
##D t      <- rep(NA, n)
##D 
##D f <- function(t, beta_0, u, z){ 
##D   S_0 <- 0.7 * exp(-0.03*t^1.9) + 0.3*exp(-0.3*t^2.5)
##D   1/(1 + exp(log((1-S_0)/S_0)+beta_0*z))-u
##D }
##D 
##D 
##D 
##D for (i in 1:n){
##D     t[i] <- uniroot(f, c(0, 8), tol = .Machine$double.eps^0.5, 
##D                     beta_0 = beta_0, u = u[i], z = z[i], 
##D                     extendInt="yes" )$root
##D }
##D 
##D delta2 <- ifelse(t < c,1, 0)
##D u2     <- apply(cbind(t, c), 1, min)
##D dataSim$delta2 <- delta2
##D dataSim$u2     <- u2
##D dataSim$z      <- z
##D 
##D 
##D 
##D eq1 <- u1 ~ s(u1, bs = "mpi") + z1 + s(z2)
##D eq2 <- u2 ~ s(u2, bs = "mpi") + z 
##D eq3 <-    ~ s(z2)
##D 
##D out <- gjrm(list(eq1, eq2), data = dataSim, surv = TRUE,
##D             margins = c("PH", "PO"), 
##D             cens1 = delta1, cens2 = delta2, Model = "B")
##D                  
##D # PH margin fit can also be compared with cox.ph from mgcv
##D                  
##D conv.check(out)
##D res <- post.check(out)
##D 
##D ## martingale residuals
##D mr1 <- out$cens1 - res$qr1
##D mr2 <- out$cens2 - res$qr2
##D 
##D # can be plotted against covariates
##D # obs index, survival time, rank order of
##D # surv times
##D 
##D # to determine func form, one may use
##D # res from null model against covariate
##D 
##D # to test for PH, use:
##D # library(survival)
##D # fit <- coxph(Surv(u1, delta1) ~ z1 + z2, data = dataSim) 
##D # temp <- cox.zph(fit) 
##D # print(temp)                  
##D # plot(temp, resid = FALSE)     
##D 
##D 
##D summary(out)
##D AIC(out); BIC(out)
##D plot(out, eq = 1, scale = 0, pages = 1)
##D plot(out, eq = 2, scale = 0, pages = 1)
##D 
##D hazsurv.plot(out, eq = 1, newdata = data.frame(z1 = 0, z2 = 0), 
##D              shade = TRUE, n.sim = 1000)
##D hazsurv.plot(out, eq = 1, newdata = data.frame(z1 = 0, z2 = 0), 
##D              shade = TRUE, n.sim = 1000, type = "hazard")
##D hazsurv.plot(out, eq = 2, newdata = data.frame(z = 0), 
##D              shade = TRUE, n.sim = 1000)
##D hazsurv.plot(out, eq = 2, newdata = data.frame(z = 0), 
##D              shade = TRUE, n.sim = 1000, type = "hazard")
##D  
##D jc.probs(out, type = "joint", intervals = TRUE)[1:5,]
##D  
##D newd0 <- newd1 <- data.frame(z = 0, z1 = mean(dataSim$z1), 
##D                              z2 = mean(dataSim$z2), 
##D                              u1 =  mean(dataSim$u1) + 1, 
##D                              u2 =  mean(dataSim$u2) + 1) 
##D newd1$z <- 1                   
##D 
##D jc.probs(out, type = "joint", newdata = newd0, intervals = TRUE)
##D jc.probs(out, type = "joint", newdata = newd1, intervals = TRUE)
##D 
##D out1 <- gjrm(list(eq1, eq2, eq3), data = dataSim, surv = TRUE,
##D                   margins = c("PH", "PO"), 
##D                   cens1 = delta1, cens2 = delta2, gamlssfit = TRUE,
##D                   Model = "B") 
##D 
##D 
##D # eq1 <- u1 ~ z1 + s(z2)
##D # eq2 <- u2 ~ z  
##D # eq3 <-    ~ s(z2)    
##D # note that Weibull is implemented as AFT model (test case)
##D # out2 <- gjrm(list(eq1, eq2, ~ 1, ~ 1, eq3), data = dataSim, surv = TRUE,
##D #                   margins = c("WEI", "WEI"), 
##D #                   cens1 = delta1, cens2 = delta2,
##D #                   Model = "B")    
##D                   
##D #########################################
##D ## Joint continuous and survival outcomes
##D #########################################  
##D # work in progress
##D #
##D # eq1 <- z2 ~ z1
##D # eq2 <- u2 ~ s(u2, bs = "mpi") + z  
##D # eq3 <-    ~ s(z2)                  
##D # eq4 <-    ~ s(z2)                  
##D #                   
##D # f.l <- list(eq1, eq2, eq3, eq4)                  
##D #   
##D # out3 <- gjrm(f.l, data = dataSim, surv = TRUE,
##D #                   margins = c("N", "PO"), 
##D #                   cens1 = NULL, cens2 = delta2, 
##D #                   gamlssfit = TRUE, Model = "B")   
##D # 
##D # conv.check(out3)
##D # post.check(out3)
##D # summary(out3)
##D # AIC(out3); BIC(out3)
##D # plot(out3, eq = 2, scale = 0, pages = 1)
##D # plot(out3, eq = 3, scale = 0, pages = 1)  
##D # plot(out3, eq = 4, scale = 0, pages = 1)                  
##D # 
##D # newd <- newd1 <- data.frame(z = 0, z1 = mean(dataSim$z1), 
##D #                              z2 = mean(dataSim$z2), 
##D #                              u2 =  mean(dataSim$u2) + 1) 
##D # 
##D # jc.probs(out3, y1 = 0.6, type = "joint", newdata = newd, intervals = TRUE)                
## End(Not run)

## Not run: 
##D  
##D 
##D ##########################################
##D ##########################################
##D ##########################################
##D # JOINT MODELS WITH THREE BINARY MARGINS #
##D ##########################################
##D ##########################################
##D ##########################################
##D 
##D library(GJRM)
##D 
##D ############
##D ## Example 9
##D ############
##D ## Generate data
##D ## Correlation between the two equations 0.5 - Sample size 400 
##D 
##D set.seed(0)
##D 
##D n <- 400
##D 
##D Sigma <- matrix(0.5, 3, 3); diag(Sigma) <- 1
##D u     <- rMVN(n, rep(0,3), Sigma)
##D 
##D x1 <- round(runif(n)); x2 <- runif(n); x3 <- runif(n)
##D 
##D f1   <- function(x) cos(pi*2*x) + sin(pi*x)
##D f2   <- function(x) x+exp(-30*(x-0.5)^2) 
##D 
##D y1 <- ifelse(-1.55 +    2*x1 - f1(x2) + u[,1] > 0, 1, 0)
##D y2 <- ifelse(-0.25 - 1.25*x1 + f2(x2) + u[,2] > 0, 1, 0)
##D y3 <- ifelse(-0.75 + 0.25*x1          + u[,3] > 0, 1, 0)
##D 
##D dataSim <- data.frame(y1, y2, y3, x1, x2)
##D 
##D f.l <- list(y1 ~ x1 + s(x2), 
##D             y2 ~ x1 + s(x2),
##D             y3 ~ x1)  
##D 
##D out  <- gjrm(f.l, data = dataSim, Model = "T",
##D              margins = c("probit", "probit", "probit"))
##D out1 <- gjrm(f.l, data = dataSim, Chol = TRUE, Model = "T",
##D              margins = c("probit", "probit", "probit"))
##D 
##D conv.check(out)
##D summary(out)
##D plot(out, eq = 1)
##D plot(out, eq = 2)
##D AIC(out)
##D BIC(out)
##D 
##D out  <- gjrm(f.l, data = dataSim, Model = "T", 
##D              margins = c("probit","logit","cloglog"))
##D out1 <- gjrm(f.l, data = dataSim, Chol = TRUE, Model = "T",
##D              margins = c("probit","logit","cloglog"))                    
##D conv.check(out)
##D summary(out)
##D plot(out, eq = 1)
##D plot(out, eq = 2)
##D AIC(out)
##D BIC(out)
##D 
##D f.l <- list(y1 ~ x1 + s(x2), 
##D             y2 ~ x1 + s(x2),
##D             y3 ~ x1,
##D                ~ 1, ~ 1, ~ 1) 
##D                
##D out1 <- gjrm(f.l, data = dataSim, Chol = TRUE, Model = "T", 
##D              margins = c("probit", "probit", "probit"))
##D    
##D f.l <- list(y1 ~ x1 + s(x2), 
##D             y2 ~ x1 + s(x2),
##D             y3 ~ x1,
##D                ~ 1, ~ s(x2), ~ 1) 
##D                
##D out2 <- gjrm(f.l, data = dataSim, Chol = TRUE, Model = "T", 
##D              margins = c("probit", "probit", "probit"))   
##D 
##D f.l <- list(y1 ~ x1 + s(x2), 
##D             y2 ~ x1 + s(x2),
##D             y3 ~ x1,
##D                ~ x1, ~ s(x2), ~ x1 + s(x2)) 
##D                
##D out2 <- gjrm(f.l, data = dataSim, Chol = TRUE, Model = "T", 
##D              margins = c("probit", "probit", "probit"))   
##D 
##D f.l <- list(y1 ~ x1 + s(x2), 
##D             y2 ~ x1 + s(x2),
##D             y3 ~ x1,
##D                ~ x1, ~ x1, ~ s(x2)) 
##D                
##D out2 <- gjrm(f.l, data = dataSim, Chol = TRUE, Model = "T", 
##D              margins = c("probit", "probit", "probit")) 
##D 
##D f.l <- list(y1 ~ x1 + s(x2), 
##D             y2 ~ x1 + s(x2),
##D             y3 ~ x1,
##D                ~ x1, ~ x1 + x2, ~ s(x2)) 
##D                
##D out2 <- gjrm(f.l, data = dataSim, Chol = TRUE, Model = "T", 
##D              margins = c("probit", "probit", "probit")) 
##D 
##D f.l <- list(y1 ~ x1 + s(x2), 
##D             y2 ~ x1 + s(x2),
##D             y3 ~ x1,
##D                ~ x1 + x2, ~ x1 + x2, ~ x1 + x2) 
##D                
##D out2 <- gjrm(f.l, data = dataSim, Chol = TRUE, Model = "T", 
##D              margins = c("probit", "probit", "probit")) 
##D        
##D        
##D jcres1 <- jc.probs(out2, 1, 1, 1, type = "joint", cond = 0, 
##D                    intervals = TRUE, n.sim = 100)
##D        
##D nw <- data.frame( x1 = 0, x2 = seq(0, 1, length.out = 100) )   
##D        
##D jcres2 <- jc.probs(out2, 1, 1, 1, newdata = nw, type = "joint", 
##D                    cond = 0, intervals = TRUE, n.sim = 100)
##D       
##D #############
##D ## Example 10
##D #############
##D ## Generate data
##D ## with double sample selection
##D 
##D set.seed(0)
##D 
##D n <- 5000
##D 
##D Sigma <- matrix(c(1,   0.5, 0.4,
##D                   0.5,   1, 0.6,
##D                   0.4, 0.6,   1 ), 3, 3)
##D 
##D u <- rMVN(n, rep(0,3), Sigma)
##D 
##D f1   <- function(x) cos(pi*2*x) + sin(pi*x)
##D f2   <- function(x) x+exp(-30*(x-0.5)^2) 
##D 
##D x1 <- runif(n)
##D x2 <- runif(n)
##D x3 <- runif(n)
##D x4 <- runif(n)
##D   
##D y1 <-  1    + 1.5*x1 -     x2 + 0.8*x3 - f1(x4) + u[, 1] > 0
##D y2 <-  1    - 2.5*x1 + 1.2*x2 +     x3          + u[, 2] > 0
##D y3 <-  1.58 + 1.5*x1 - f2(x2)                   + u[, 3] > 0
##D 
##D dataSim <- data.frame(y1, y2, y3, x1, x2, x3, x4)
##D 
##D f.l <- list(y1 ~ x1 + x2 + x3 + s(x4), 
##D             y2 ~ x1 + x2 + x3, 
##D             y3 ~ x1 + s(x2))   
##D           
##D out <- gjrm(f.l, data = dataSim, Model = "TSS",
##D             margins = c("probit", "probit", "probit"))
##D conv.check(out)
##D summary(out)
##D plot(out, eq = 1)
##D plot(out, eq = 3)
##D prev(out)
##D prev(out, type = "univariate")
##D prev(out, type = "naive")
## End(Not run)

## Not run: 
##D  
##D 
##D ###################################################
##D ###################################################
##D ###################################################
##D # JOINT MODELS WITH BINARY AND CONTINUOUS MARGINS #
##D # WITH SAMPLE SELECTION                           #
##D ###################################################
##D ###################################################
##D ###################################################
##D 
##D library(GJRM)
##D 
##D ######################################################################
##D ## Generate data
##D ## Correlation between the two equations and covariate correlation 0.5 
##D ## Sample size 2000 
##D ######################################################################
##D #############
##D ## Example 11
##D #############
##D set.seed(0)
##D 
##D n <- 2000
##D 
##D rh <- 0.5      
##D 
##D sigmau <- matrix(c(1, rh, rh, 1), 2, 2)
##D u      <- rMVN(n, rep(0,2), sigmau)
##D 
##D sigmac <- matrix(rh, 3, 3); diag(sigmac) <- 1
##D cov    <- rMVN(n, rep(0,3), sigmac)
##D cov    <- pnorm(cov)
##D 
##D bi <- round(cov[,1]); x1 <- cov[,2]; x2 <- cov[,3]
##D   
##D f11 <- function(x) -0.7*(4*x + 2.5*x^2 + 0.7*sin(5*x) + cos(7.5*x))
##D f12 <- function(x) -0.4*( -0.3 - 1.6*x + sin(5*x))  
##D f21 <- function(x) 0.6*(exp(x) + sin(2.9*x)) 
##D 
##D ys <-  0.58 + 2.5*bi + f11(x1) + f12(x2) + u[, 1] > 0
##D y  <- -0.68 - 1.5*bi + f21(x1) +           u[, 2]
##D yo <- y*(ys > 0)
##D   
##D dataSim <- data.frame(ys, yo, bi, x1, x2)
##D 
##D ## CLASSIC SAMPLE SELECTION MODEL
##D ## the first equation MUST be the selection equation
##D 
##D resp.check(yo[ys > 0], "N")
##D 
##D out <- gjrm(list(ys ~ bi + x1 + x2, 
##D                  yo ~ bi + x1), 
##D                  data = dataSim, Model = "BSS",
##D                  margins = c("probit", "N"))
##D conv.check(out)
##D post.check(out)
##D summary(out)
##D 
##D AIC(out)
##D BIC(out)
##D 
##D 
##D ## SEMIPARAMETRIC SAMPLE SELECTION MODEL
##D 
##D out <- gjrm(list(ys ~ bi + s(x1) + s(x2), 
##D                  yo ~ bi + s(x1)), 
##D                  data = dataSim, Model = "BSS",
##D                  margins = c("probit", "N"))
##D conv.check(out) 
##D post.check(out)
##D AIC(out)
##D 
##D ## compare the two summary outputs
##D ## the second output produces a summary of the results obtained when only 
##D ## the outcome equation is fitted, i.e. selection bias is not accounted for
##D 
##D summary(out)
##D summary(out$gam2)
##D 
##D ## estimated smooth function plots
##D ## the red line is the true curve
##D ## the blue line is the naive curve not accounting for selection bias
##D 
##D x1.s <- sort(x1[dataSim$ys>0])
##D f21.x1 <- f21(x1.s)[order(x1.s)] - mean(f21(x1.s))
##D 
##D plot(out, eq = 2, ylim = c(-1, 0.8)); lines(x1.s, f21.x1, col = "red")
##D par(new = TRUE)
##D plot(out$gam2, se = FALSE, lty = 3, lwd = 2, ylim = c(-1, 0.8), 
##D      ylab = "", rug = FALSE)
##D 
##D 
##D ## IMPUTE MISSING VALUES
##D 
##D n.m <- 10
##D res <- imputeSS(out, n.m)
##D bet <- NA
##D 
##D for(i in 1:n.m){
##D 
##D dataSim$yo[dataSim$ys == 0] <- res[[i]]
##D 
##D outg <- gamlss(list(yo ~ bi + s(x1)), data = dataSim)
##D bet[i] <- coef(outg)["bi"]
##D print(i)
##D }
##D 
##D mean(bet)
##D 
##D ##
##D 
##D 
##D ## SEMIPARAMETRIC SAMPLE SELECTION MODEL with association 
##D ## and dispersion parameters 
##D ## depending on covariates as well
##D 
##D eq.mu.1   <- ys ~ bi + s(x1) + s(x2)
##D eq.mu.2   <- yo ~ bi + s(x1)
##D eq.sigma2 <-    ~ bi
##D eq.theta  <-    ~ bi + x1
##D 
##D fl <- list(eq.mu.1, eq.mu.2, eq.sigma2, eq.theta)
##D 
##D out <- gjrm(fl, data = dataSim, Model = "BSS",
##D                  margins = c("probit", "N"))
##D conv.check(out)   
##D post.check(out)
##D summary(out)
##D out$sigma2
##D out$theta
##D 
##D jc.probs(out, 0, 0.3, intervals = TRUE)[1:4,]
##D 
##D outC0 <- gjrm(fl, data = dataSim, BivD = "C0", Model = "BSS",
##D               margins = c("probit", "N"))
##D conv.check(outC0)
##D post.check(outC0)
##D AIC(out, outC0)
##D BIC(out, outC0)
##D 
##D ## IMPUTE MISSING VALUES
##D 
##D n.m <- 10
##D res <- imputeSS(outC0, n.m)
##D 
##D ###############
##D # or using MICE
##D ###############
##D 
##D library(mice)
##D 
##D ys <- dataSim$ys
##D 
##D dataSim$yo[dataSim$ys == FALSE] <- NA  
##D dataSim <- dataSim[, -1]
##D 
##D imp <- mice(dataSim, m = 1, method = c("copulaSS", "", "", ""),  
##D             mice.formula = outC0$mice.formula, margins = outC0$margins, 
##D             BivD = outC0$BivD, maxit = 1)
##D 
##D comp.yo <- dataSim$yo
##D comp.yo[ys == 0] <- imp$imp$yo[[1]]
##D mean(comp.yo)
##D 
##D 
##D #
##D #
##D #######################################################
##D ## example using Gumbel copula and normal-gamma margins
##D #######################################################
##D #############
##D ## Example 12
##D #############
##D set.seed(1)
##D 
##D y  <- exp(-0.68 - 1.5*bi + f21(x1) + u[, 2])
##D yo <- y*(ys > 0)
##D     
##D dataSim <- data.frame(ys, yo, bi, x1, x2)
##D 
##D 
##D out <- gjrm(list(ys ~ bi + s(x1) + s(x2), 
##D                  yo ~ bi + s(x1)), 
##D                  data = dataSim, BivD = "G0", 
##D                  margins = c("probit", "GA"),
##D                  Model = "BSS")
##D conv.check(out)
##D post.check(out)
##D summary(out)
##D 
##D 
##D ATE <- NA
##D n.m <- 10
##D res <- imputeSS(out, n.m)
##D 
##D for(i in 1:n.m){
##D 
##D dataSim$yo[dataSim$ys == 0] <- res[[i]]
##D 
##D outg <- gamlss(list(yo ~ bi + s(x1)), margin = "GA", data = dataSim)
##D 
##D out$gamlss <- outg
##D ATE[i] <- AT(out, nm.end = "bi", type = "univariate")$res[2]
##D 
##D print(i)
##D 
##D }
##D 
##D AT(out, nm.end = "bi")
##D mean(ATE)
## End(Not run)





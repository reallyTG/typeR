library(GJRM)


### Name: gamlss
### Title: Generalised Additive Models for Location, Scale and Shape
### Aliases: gamlss
### Keywords: regression modelling smooth regression spline distribution
###   survival data

### ** Examples


## Not run: 
##D  
##D 
##D library(GJRM)
##D 
##D set.seed(0)
##D 
##D n <- 400
##D 
##D x1 <- round(runif(n))
##D x2 <- runif(n)
##D x3 <- runif(n)
##D f1 <- function(x) cos(pi*2*x) + sin(pi*x)
##D y1 <- -1.55 + 2*x1 + f1(x2) + rnorm(n)
##D 
##D dataSim <- data.frame(y1, x1, x2, x3)
##D resp.check(y1, "N")
##D 
##D eq.mu <- y1 ~ x1 + s(x2) + s(x3)
##D eq.s2 <-    ~ s(x3)
##D fl    <- list(eq.mu, eq.s2)
##D 
##D out <- gamlss(fl, data = dataSim)
##D 
##D conv.check(out)
##D post.check(out)
##D 
##D plot(out, eq = 1, scale = 0, pages = 1, seWithMean = TRUE)
##D plot(out, eq = 2, seWithMean = TRUE)
##D 
##D summary(out)
##D 
##D AIC(out)
##D BIC(out)
##D 
##D ################
##D # Robust example
##D ################
##D 
##D eq.mu <- y1 ~ x1 + x2 + x3
##D fl    <- list(eq.mu)
##D 
##D out <- gamlss(fl, data = dataSim, margin = "N", robust = TRUE, 
##D                   rc = 3, lB = -Inf, uB = Inf)
##D 
##D conv.check(out)
##D summary(out)
##D rob.const(out, 100)
##D 
##D ##
##D 
##D eq.s2 <-    ~ x3
##D fl    <- list(eq.mu, eq.s2)
##D 
##D out <- gamlss(fl, data = dataSim, margin = "N", robust = TRUE)
##D 
##D conv.check(out)
##D summary(out)
##D 
##D ##
##D 
##D eq.mu <- y1 ~ x1 + s(x2) + s(x3)
##D eq.s2 <-    ~ s(x3)
##D fl    <- list(eq.mu, eq.s2)
##D 
##D out1 <- gamlss(fl, data = dataSim, margin = "N", robust = TRUE)
##D 
##D conv.check(out1)
##D summary(out1)
##D AIC(out, out1)
##D 
##D plot(out1, eq = 1, all.terms = TRUE, pages = 1, seWithMean = TRUE)
##D plot(out1, eq = 2, seWithMean = TRUE)
##D 
##D ##########################
##D ## GEV link binary example
##D ##########################
##D # this incorporates the bgeva
##D # model implemented in the bgeva package
##D # however this implementation is more general 
##D # stable and efficient
##D 
##D set.seed(0)
##D 
##D n <- 400
##D 
##D x1 <- round(runif(n)); x2 <- runif(n); x3 <- runif(n)
##D 
##D f1 <- function(x) cos(pi*2*x) + sin(pi*x)
##D f2 <- function(x) x+exp(-30*(x-0.5)^2)   
##D 
##D y  <- ifelse(-3.55 + 2*x1 + f1(x2) + rnorm(n) > 0, 1, 0)
##D 
##D dataSim <- data.frame(y, x1, x2, x3)
##D 
##D out1 <- gamlss(list(y ~ x1 + x2 + x3), margin = "GEVlink", data = dataSim)
##D out2 <- gamlss(list(y ~ x1 + s(x2) + s(x3)), margin = "GEVlink", data = dataSim)
##D 
##D conv.check(out1)
##D conv.check(out2)
##D summary(out1)
##D summary(out2)
##D AIC(out1, out2)
##D BIC(out1, out2)
##D 
##D plot(out2, eq = 1, all.terms = TRUE, pages = 1, seWithMean = TRUE)
##D 
##D ##################
##D # prediction of Pr
##D ##################
##D 
##D # Calculate eta (that is, X*model.coef)
##D # For a new data set the argument newdata should be used
##D 
##D eta <- predict(out2, eq = 1, type = "link")
##D 
##D # extract gev tail parameter
##D 
##D gev.par <- out2$gev.par
##D 
##D # multiply gev tail parameter by eta
##D 
##D gevpeta <- gev.par*eta 
##D   
##D # establish for which values the model is defined   
##D 
##D gevpetaIND <- ifelse(gevpeta < -1, FALSE, TRUE) 
##D gevpeta <- gevpeta[gevpetaIND]
##D     
##D # estimate probabilities  
##D 
##D pr <- exp(-(1 + gevpeta)^(-1/gev.par))
##D 
##D ##################################
##D ## Flexible survival model example
##D ##################################
##D 
##D library(GJRM)
##D 
##D ########################################
##D ## Simulate proportional hazards data ##
##D ########################################
##D 
##D set.seed(0)
##D n  <- 2000
##D c  <- runif(n, 3, 8)
##D u  <- runif(n, 0, 1)
##D z1 <- rbinom(n, 1, 0.5)
##D z2 <- runif(n, 0, 1)
##D t <- rep(NA, n)
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
##D delta   <- ifelse(t < c, 1, 0)
##D u       <- apply(cbind(t, c), 1, min)
##D dataSim <- data.frame(u, delta, z1, z2)
##D 1-mean(delta) # average censoring rate
##D 
##D out <- gamlss(list(u ~ s(u, bs = "mpi") + z1 + s(z2) ), data = dataSim, 
##D               surv = TRUE, margin = "PH", cens = delta)
##D post.check(out)
##D summary(out)
##D AIC(out)
##D BIC(out)
##D plot(out, eq = 1, scale = 0, pages = 1)
##D hazsurv.plot(out, newdata = data.frame(z1 = 0, z2 = 0), shade = TRUE, n.sim = 1000)
##D hazsurv.plot(out, type = "hazard", newdata = data.frame(z1 = 0, z2 = 0), 
##D              shade = TRUE, n.sim = 1000)
##D 
##D out1 <- gam(u ~ z1 + s(z2), family = cox.ph(), 
##D             data = dataSim, weights = delta)
##D summary(out1)
##D # estimates of z1 and s(z2) are
##D # nearly identical between out and out1 
##D 
##D # note that the Weibull is implemented as AFT
##D # as using the PH parametrisation makes
##D # computation unstable
##D out2 <- gamlss(list(u ~ z1 + s(z2) ), data = dataSim, surv = TRUE, 
##D                margin = "WEI", cens = delta)
##D  
##D #####################################
##D ## Simulate proportional odds data ##
##D #####################################
##D 
##D set.seed(0)
##D 
##D n <- 2000
##D c <- runif(n, 4, 8)
##D u <- runif(n, 0, 1)
##D z <- rbinom(n, 1, 0.5)
##D beta_0 <- -1.05
##D t <- rep(NA, n)
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
##D delta   <- ifelse(t < c,1, 0)
##D u       <- apply(cbind(t, c), 1, min)
##D dataSim <- data.frame(u, delta, z)
##D 1-mean(delta) # average censoring rate
##D 
##D out <- gamlss(list(u ~ s(u, bs = "mpi") + z ), data = dataSim, surv = TRUE, 
##D               margin = "PO", cens = delta)
##D post.check(out)
##D summary(out)
##D AIC(out)
##D BIC(out)
##D plot(out, eq = 1, scale = 0)
##D hazsurv.plot(out, newdata = data.frame(z =0), shade = TRUE, n.sim = 1000)
##D hazsurv.plot(out, type = "hazard", newdata = data.frame(z = 0), 
##D              shade = TRUE, n.sim = 1000)
##D 
##D # note that the Fisk is implemented as AFT
##D # as using the PH parametrisation makes
##D # computation unstable
##D out1 <- gamlss(list(u ~ z), data = dataSim, surv = TRUE, 
##D                margin = "FISK", cens = delta)
##D 
## End(Not run)





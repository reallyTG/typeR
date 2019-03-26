library(mirt)


### Name: simdata
### Title: Simulate response patterns
### Aliases: simdata
### Keywords: data

### ** Examples


### Parameters from Reckase (2009), p. 153

set.seed(1234)

a <- matrix(c(
 .7471, .0250, .1428,
 .4595, .0097, .0692,
 .8613, .0067, .4040,
1.0141, .0080, .0470,
 .5521, .0204, .1482,
1.3547, .0064, .5362,
1.3761, .0861, .4676,
 .8525, .0383, .2574,
1.0113, .0055, .2024,
 .9212, .0119, .3044,
 .0026, .0119, .8036,
 .0008, .1905,1.1945,
 .0575, .0853, .7077,
 .0182, .3307,2.1414,
 .0256, .0478, .8551,
 .0246, .1496, .9348,
 .0262, .2872,1.3561,
 .0038, .2229, .8993,
 .0039, .4720, .7318,
 .0068, .0949, .6416,
 .3073, .9704, .0031,
 .1819, .4980, .0020,
 .4115,1.1136, .2008,
 .1536,1.7251, .0345,
 .1530, .6688, .0020,
 .2890,1.2419, .0220,
 .1341,1.4882, .0050,
 .0524, .4754, .0012,
 .2139, .4612, .0063,
 .1761,1.1200, .0870),30,3,byrow=TRUE)*1.702

d <- matrix(c(.1826,-.1924,-.4656,-.4336,-.4428,-.5845,-1.0403,
  .6431,.0122,.0912,.8082,-.1867,.4533,-1.8398,.4139,
  -.3004,-.1824,.5125,1.1342,.0230,.6172,-.1955,-.3668,
  -1.7590,-.2434,.4925,-.3410,.2896,.006,.0329),ncol=1)*1.702

mu <- c(-.4, -.7, .1)
sigma <- matrix(c(1.21,.297,1.232,.297,.81,.252,1.232,.252,1.96),3,3)

dataset1 <- simdata(a, d, 2000, itemtype = '2PL')
dataset2 <- simdata(a, d, 2000, itemtype = '2PL', mu = mu, sigma = sigma)

#mod <- mirt(dataset1, 3, method = 'MHRM')
#coef(mod)

## Not run: 
##D 
##D ### Unidimensional graded response model with 5 categories each
##D 
##D a <- matrix(rlnorm(20,.2,.3))
##D 
##D # for the graded model, ensure that there is enough space between the intercepts,
##D # otherwise closer categories will not be selected often (minimum distance of 0.3 here)
##D diffs <- t(apply(matrix(runif(20*4, .3, 1), 20), 1, cumsum))
##D diffs <- -(diffs - rowMeans(diffs))
##D d <- diffs + rnorm(20)
##D 
##D dat <- simdata(a, d, 500, itemtype = 'graded')
##D # mod <- mirt(dat, 1)
##D 
##D ### An example of a mixed item, bifactor loadings pattern with correlated specific factors
##D 
##D a <- matrix(c(
##D .8,.4,NA,
##D .4,.4,NA,
##D .7,.4,NA,
##D .8,NA,.4,
##D .4,NA,.4,
##D .7,NA,.4),ncol=3,byrow=TRUE)
##D 
##D d <- matrix(c(
##D -1.0,NA,NA,
##D  1.5,NA,NA,
##D  0.0,NA,NA,
##D 0.0,-1.0,1.5,  #the first 0 here is the recommended constraint for nominal
##D 0.0,1.0,-1, #the first 0 here is the recommended constraint for gpcm
##D 2.0,0.0,NA),ncol=3,byrow=TRUE)
##D 
##D nominal <- matrix(NA, nrow(d), ncol(d))
##D #the first 0 and last (ncat - 1) = 2 values are the recommended constraints
##D nominal[4, ] <- c(0,1.2,2)
##D 
##D sigma <- diag(3)
##D sigma[2,3] <- sigma[3,2] <- .25
##D items <- c('2PL','2PL','2PL','nominal','gpcm','graded')
##D 
##D dataset <- simdata(a,d,2000,items,sigma=sigma,nominal=nominal)
##D 
##D #mod <- bfactor(dataset, c(1,1,1,2,2,2), itemtype=c(rep('2PL', 3), 'nominal', 'gpcm','graded'))
##D #coef(mod)
##D 
##D #### Convert standardized factor loadings to slopes
##D 
##D F2a <- function(F, D=1.702){
##D     h2 <- rowSums(F^2)
##D     a <- (F / sqrt(1 - h2)) * D
##D     a
##D }
##D 
##D (F <- matrix(c(rep(.7, 5), rep(.5,5))))
##D (a <- F2a(F))
##D d <- rnorm(10)
##D 
##D dat <- simdata(a, d, 5000, itemtype = '2PL')
##D mod <- mirt(dat, 1)
##D coef(mod, simplify=TRUE)$items
##D summary(mod)
##D 
##D mod2 <- mirt(dat, 'F1 = 1-10
##D                    CONSTRAIN = (1-5, a1), (6-10, a1)')
##D summary(mod2)
##D anova(mod, mod2)
##D 
##D #### Unidimensional nonlinear factor pattern
##D 
##D theta <- rnorm(2000)
##D Theta <- cbind(theta,theta^2)
##D 
##D a <- matrix(c(
##D .8,.4,
##D .4,.4,
##D .7,.4,
##D .8,NA,
##D .4,NA,
##D .7,NA),ncol=2,byrow=TRUE)
##D d <- matrix(rnorm(6))
##D itemtype <- rep('2PL',6)
##D 
##D nonlindata <- simdata(a=a, d=d, itemtype=itemtype, Theta=Theta)
##D 
##D #model <- '
##D #F1 = 1-6
##D #(F1 * F1) = 1-3'
##D #mod <- mirt(nonlindata, model)
##D #coef(mod)
##D 
##D #### 2PLNRM model for item 4 (with 4 categories), 2PL otherwise
##D 
##D a <- matrix(rlnorm(4,0,.2))
##D 
##D #first column of item 4 is the intercept for the correct category of 2PL model,
##D #    otherwise nominal model configuration
##D d <- matrix(c(
##D -1.0,NA,NA,NA,
##D  1.5,NA,NA,NA,
##D  0.0,NA,NA,NA,
##D  1, 0.0,-0.5,0.5),ncol=4,byrow=TRUE)
##D 
##D nominal <- matrix(NA, nrow(d), ncol(d))
##D nominal[4, ] <- c(NA,0,.5,.6)
##D 
##D items <- c(rep('2PL',3),'nestlogit')
##D 
##D dataset <- simdata(a,d,2000,items,nominal=nominal)
##D 
##D #mod <- mirt(dataset, 1, itemtype = c('2PL', '2PL', '2PL', '2PLNRM'), key=c(NA,NA,NA,1))
##D #coef(mod)
##D #itemplot(mod,4)
##D 
##D #return list of simulation parameters
##D listobj <- simdata(a,d,2000,items,nominal=nominal, returnList=TRUE)
##D str(listobj)
##D 
##D # generate dataset from converged model
##D mod <- mirt(Science, 1, itemtype = c(rep('gpcm', 3), 'nominal'))
##D sim <- simdata(model=mod, N=1000)
##D head(sim)
##D 
##D Theta <- matrix(rnorm(100))
##D sim <- simdata(model=mod, Theta=Theta)
##D head(sim)
##D 
##D # alternatively, define a suitable object with functions from the mirtCAT package
##D # help(generate.mirt_object)
##D library(mirtCAT)
##D 
##D nitems <- 50
##D a1 <- rlnorm(nitems, .2,.2)
##D d <- rnorm(nitems)
##D g <- rbeta(nitems, 20, 80)
##D pars <- data.frame(a1=a1, d=d, g=g)
##D head(pars)
##D 
##D obj <- generate.mirt_object(pars, '3PL')
##D dat <- simdata(N=200, model=obj)
##D 
##D #### 10 item GGUMs test with 4 categories each
##D a <- rlnorm(10, .2, .2)
##D b <- rnorm(10) #passed to d= input, but used as the b parameters
##D diffs <- t(apply(matrix(runif(10*3, .3, 1), 10), 1, cumsum))
##D t <- -(diffs - rowMeans(diffs))
##D 
##D dat <- simdata(a, b, 1000, 'ggum', t=t)
##D apply(dat, 2, table)
##D # mod <- mirt(dat, 1, 'ggum')
##D # coef(mod)
##D 
##D ######
##D # prob.list example
##D 
##D # custom probabilty function that returns a matrix
##D fun <- function(a, b, theta){
##D     P <- 1 / (1 + exp(-a * (theta-b)))
##D     cbind(1-P, P)
##D }
##D 
##D set.seed(1)
##D theta <- matrix(rnorm(100))
##D prob.list <- list()
##D nitems <- 5
##D a <- rlnorm(nitems, .2, .2); b <- rnorm(nitems, 0, 1/2)
##D for(i in 1:nitems) prob.list[[i]] <- fun(a[i], b[i], theta)
##D str(prob.list)
##D 
##D dat <- simdata(prob.list=prob.list)
##D head(dat)
##D 
##D # prob.list input is useful when defining custom items as well
##D name <- 'old2PL'
##D par <- c(a = .5, b = -2)
##D est <- c(TRUE, TRUE)
##D P.old2PL <- function(par,Theta, ncat){
##D      a <- par[1]
##D      b <- par[2]
##D      P1 <- 1 / (1 + exp(-1*a*(Theta - b)))
##D      cbind(1-P1, P1)
##D }
##D 
##D x <- createItem(name, par=par, est=est, P=P.old2PL)
##D 
##D prob.list[[1]] <- x@P(x@par, theta)
##D 
##D 
## End(Not run)




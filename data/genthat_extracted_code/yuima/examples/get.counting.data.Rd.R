library(yuima)


### Name: get.counting.data
### Title: Extract arrival times from an object of class 'yuima.PPR'
### Aliases: get.counting.data NoisePPR

### ** Examples

## Not run: 
##D ##################
##D # Hawkes Process #
##D ##################
##D 
##D # Values of parameters.
##D mu <- 2
##D alpha <- 4
##D beta <-5
##D 
##D # Law definition
##D 
##D my.rHawkes <- function(n){
##D   res <- t(t(rep(1,n)))
##D   return(res)
##D }
##D 
##D Law.Hawkes <- setLaw(rng = my.rHawkes)
##D 
##D # Point Process Definition
##D 
##D gFun <- "mu"
##D Kernel <- "alpha*exp(-beta*(t-s))"
##D 
##D modHawkes <- setModel(drift = c("0"), diffusion = matrix("0",1,1),
##D   jump.coeff = matrix(c("1"),1,1), measure = list(df = Law.Hawkes),
##D   measure.type = "code", solve.variable = c("N"),
##D   xinit=c("0"))
##D 
##D prvHawkes <- setPPR(yuima = modHawkes, counting.var="N", gFun=gFun,
##D   Kernel = as.matrix(Kernel), lambda.var = "lambda", 
##D   var.dx = "N", lower.var="0", upper.var = "t")
##D 
##D true.par <- list(mu=mu, alpha=alpha,  beta=beta)
##D 
##D set.seed(1)
##D 
##D Term<-70
##D n<-7000
##D 
##D # Simulation trajectory
##D 
##D time.Hawkes <-system.time(
##D   simHawkes <- simulate(object = prvHawkes, true.parameter = true.par,
##D      sampling = setSampling(Terminal =Term, n=n))
##D )
##D 
##D # Arrival times of the Counting process.
##D 
##D DataHawkes <- get.counting.data(simHawkes)
##D TimeArr <- index(DataHawkes)
##D 
##D ##################################
##D # Point Process Regression Model #
##D ##################################
##D 
##D # Values of parameters.
##D mu <- 2
##D alpha <- 4
##D beta <-5
##D 
##D # Law definition
##D my.rKern <- function(n,t){
##D   res0 <- t(t(rgamma(n, 0.1*t)))
##D   res1 <- t(t(rep(1,n)))
##D   res <- cbind(res0,res1)
##D   return(res)
##D }
##D 
##D Law.PPRKern <- setLaw(rng = my.rKern)
##D 
##D # Point Process definition
##D modKern <- setModel(drift = c("0.4*(0.1-X)","0"),
##D                     diffusion = c("0","0"),
##D                     jump.coeff = matrix(c("1","0","0","1"),2,2),
##D                     measure = list(df = Law.PPRKern),
##D                     measure.type = c("code","code"),
##D                     solve.variable = c("X","N"),
##D                     xinit=c("0.25","0"))
##D 
##D gFun <- "exp(mu*log(1+X))"
##D #
##D Kernel <- "alpha*exp(-beta*(t-s))"
##D 
##D prvKern <- setPPR(yuima = modKern,
##D                   counting.var="N", gFun=gFun,
##D                   Kernel = as.matrix(Kernel),
##D                   lambda.var = "lambda", var.dx = "N",
##D                   lower.var="0", upper.var = "t")
##D 
##D # Simulation
##D 
##D Term<-100
##D seed<-1
##D n<-10000
##D 
##D true.parKern <- list(mu=mu, alpha=alpha, beta=beta)
##D 
##D 
##D set.seed(seed)
##D # set.seed(1)
##D 
##D time.simKern <-system.time(
##D   simprvKern <- simulate(object = prvKern, true.parameter = true.parKern,
##D                          sampling = setSampling(Terminal =Term, n=n))
##D )
##D 
##D 
##D plot(simprvKern,main ="Counting Process with covariates" ,cex.main=0.9)
##D 
##D # Arrival Times
##D CountVar <- get.counting.data(simprvKern)
##D TimeArr <- index(CountVar)
##D 
##D 
## End(Not run)




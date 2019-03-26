library(yuima)


### Name: DataPPR
### Title: From 'zoo' data to 'yuima.PPR'.
### Aliases: DataPPR

### ** Examples

## Not run: 
##D # In this example we generate a dataset contains the Counting Variable N
##D # and the Covariate X.
##D # The covariate X is an OU driven by a Gamma process.
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
##D Term<-200
##D seed<-1
##D n<-20000
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
##D # Using the function get.counting.data we extract from an object of class
##D # yuima.PPR the counting process N and the covariate X at the arrival times.
##D 
##D CountVar <- get.counting.data(simprvKern)
##D 
##D plot(CountVar)
##D 
##D # We convert the zoo object in the yuima.PPR object.
##D 
##D sim2 <- DataPPR(CountVar, yuimaPPR=simprvKern, samp=simprvKern@sampling)
##D 
## End(Not run)




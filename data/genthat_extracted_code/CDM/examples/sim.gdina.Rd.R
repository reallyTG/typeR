library(CDM)


### Name: sim.gdina
### Title: Simulation of the GDINA model
### Aliases: sim.gdina sim.gdina.prepare
### Keywords: GDINA

### ** Examples

#############################################################################
# EXAMPLE 1: Simulating the GDINA model
#############################################################################

n <- 50             # number of persons
# define Q-matrix
q.matrix <- matrix(  c(1,1,0, 0,1,1, 1,0,1, 1,0,0,
    0,0,1, 0,1,0,  1,1,1,  0,1,1, 0,1,1), ncol=3, byrow=TRUE)
# thresholds for attributes alpha^\ast
thresh.alpha <- c( .65, 0, -.30 )
# covariance matrix for alpha^\ast
cov.alpha <- matrix(1,3,3)
cov.alpha[1,2] <- cov.alpha[2,1] <- .4
cov.alpha[1,3] <- cov.alpha[3,1] <- .6
cov.alpha[3,2] <- cov.alpha[2,3] <- .8

# prepare design matrix by applying sim.gdina.prepare function
rp <- CDM::sim.gdina.prepare( q.matrix )
delta <- rp$delta
necc.attr <- rp$necc.attr
Aj <- rp$Aj
Mj <- rp$Mj
# define delta parameters
# intercept - main effects - second order interactions - ...
str(delta)  #=> modify the delta parameter list which contains only zeroes as default
##   List of 9
##    $ : num [1:4] 0 0 0 0
##    $ : num [1:4] 0 0 0 0
##    $ : num [1:4] 0 0 0 0
##    $ : num [1:2] 0 0
##    $ : num [1:2] 0 0
##    $ : num [1:2] 0 0
##    $ : num [1:8] 0 0 0 0 0 0 0 0
##    $ : num [1:4] 0 0 0 0
##    $ : num [1:4] 0 0 0 0
delta[[1]] <- c( .2, .1, .15, .4 )
delta[[2]] <- c( .2, .3, .3, -.2 )
delta[[3]] <- c( .2, .2, .2, 0 )
delta[[4]] <- c( .15, .6 )
delta[[5]] <- c( .1, .7 )
delta[[6]] <- c( .25, .65 )
delta[[7]] <- c( .25, .1, .1, .1, 0, 0, 0, .25 )
delta[[8]] <- c( .2, 0, .3, -.1 )
delta[[9]] <- c( .2, .2, 0, .3 )

#******************************************
# Now, the "real simulation" starts
sim.res <- CDM::sim.gdina( n=n, q.matrix=q.matrix, delta=delta, link="identity",
                thresh.alpha=thresh.alpha, cov.alpha=cov.alpha,
                Mj=Mj, Aj=Aj, necc.attr=necc.attr)
# sim.res$data      # simulated data
# sim.res$alpha     # simulated alpha

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Simulation based on already estimated GDINA model for data.ecpe
##D #############################################################################
##D 
##D data(data.ecpe)
##D dat <- data.ecpe$data
##D q.matrix <- data.ecpe$q.matrix
##D 
##D #***
##D # (1) estimate GDINA model
##D mod <- CDM::gdina( data=dat[,-1], q.matrix=q.matrix )
##D 
##D #***
##D # (2) simulate data according to GDINA model
##D set.seed(977)
##D 
##D # prepare design matrix by applying sim.gdina.prepare function
##D rp <- CDM::sim.gdina.prepare( q.matrix )
##D necc.attr <- rp$necc.attr
##D 
##D # number of subjects to be simulated
##D n <- 3000
##D # simulate attribute patterns
##D probs <- mod$attribute.patt$class.prob   # probabilities
##D patt <- mod$attribute.patt.splitted      # response patterns
##D alpha <- patt[ sample( 1:(length(probs) ), n, prob=probs, replace=TRUE), ]
##D 
##D # simulate data using estimated item parameters
##D sim.res <- CDM::sim.gdina( n=n, q.matrix=q.matrix, delta=mod$delta, link="identity",
##D                 alpha=alpha, Mj=mod$Mj, Aj=mod$Aj, necc.attr=rp$necc.attr)
##D # extract data
##D dat <- sim.res$data
##D 
##D #############################################################################
##D # EXAMPLE 3: Simulation based on already estimated RRUM model for data.ecpe
##D #############################################################################
##D 
##D dat <- CDM::data.ecpe$data
##D q.matrix <- CDM::data.ecpe$q.matrix
##D 
##D #***
##D # (1) estimate reduced RUM model
##D mod <- CDM::gdina( data=dat[,-1], q.matrix=q.matrix, rule="RRUM" )
##D summary(mod)
##D 
##D #***
##D # (2) simulate data according to RRUM model
##D set.seed(977)
##D 
##D # prepare design matrix by applying sim.gdina.prepare function
##D rp <- CDM::sim.gdina.prepare( q.matrix )
##D necc.attr <- rp$necc.attr
##D 
##D # number of subjects to be simulated
##D n <- 5000
##D # simulate attribute patterns
##D probs <- mod$attribute.patt$class.prob   # probabilities
##D patt <- mod$attribute.patt.splitted      # response patterns
##D alpha <- patt[ sample( 1:(length(probs) ), n, prob=probs, replace=TRUE), ]
##D 
##D # simulate data using estimated item parameters
##D sim.res <- CDM::sim.gdina( n=n, q.matrix=q.matrix, delta=mod$delta, link=mod$link,
##D                 alpha=alpha, Mj=mod$Mj, Aj=mod$Aj, necc.attr=rp$necc.attr)
##D # extract data
##D dat <- sim.res$data
## End(Not run)




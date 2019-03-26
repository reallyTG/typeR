library(CDM)


### Name: sim.din
### Title: Data Simulation Tool for DINA, DINO and mixed DINA and DINO Data
### Aliases: sim.din

### ** Examples

#############################################################################
## EXAMPLE 1: simulate DINA/DINO data according to a tetrachoric correlation
#############################################################################

# define Q-matrix for 4 items and 2 attributes
q.matrix <- matrix(c(1,0,0,1,1,1,1,1), ncol=2, nrow=4)

# Slipping parameters
slip <- c(0.2,0.3,0.4,0.3)

# Guessing parameters
guess <- c(0,0.1,0.05,0.2)

set.seed(1567) # fix random numbers
dat1 <- CDM::sim.din(N=200, q.matrix, slip=slip, guess=guess,
  # Possession of the attributes with high probability
  mean=c(0.5,0.2),
  # Possession of the attributes is weakly correlated
  Sigma=matrix(c(1,0.2,0.2,1), ncol=2), rule="DINA")$dat
head(dat1)

set.seed(15367) # fix random numbers
res <- CDM::sim.din(N=200, q.matrix, slip=slip, guess=guess, mean=c(0.5,0.2),
         Sigma=matrix(c(1,0.2,0.2,1), ncol=2), rule="DINO")

# extract simulated data
dat2 <- res$dat
# extract attribute patterns
head( res$alpha )
  ##        [,1] [,2]
  ##   [1,]    1    1
  ##   [2,]    1    1
  ##   [3,]    1    1
  ##   [4,]    1    1
  ##   [5,]    1    1
  ##   [6,]    1    0

#  simulate data based on given attributes
#          -> 5 persons with 2 attributes -> see the Q-matrix above
alpha <- matrix( c(1,0,1,0,1,1,0,1,1,1),
    nrow=5,ncol=2, byrow=TRUE )
CDM::sim.din(  q.matrix=q.matrix, alpha=alpha )

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Simulation based on attribute vectors
##D #############################################################################
##D set.seed(76)
##D # define Q-matrix
##D Qmatrix <- matrix(c(1,0,1,0,1,0,0,1,0,1,0,1,1,1,1,1), 8, 2, byrow=TRUE)
##D colnames(Qmatrix) <- c("Attr1","Attr2")
##D # define skill patterns
##D alpha.patt <- matrix(c(0,0,1,0,0,1,1,1), 4,2,byrow=TRUE )
##D AP <- nrow(alpha.patt)
##D # define pattern probabilities
##D alpha.prob <- c( .20, .40, .10, .30 )
##D # simulate alpha latent responses
##D N <- 1000     # number of persons
##D ind <- sample( x=1:AP, size=N, replace=TRUE, prob=alpha.prob)
##D alpha <- alpha.patt[ ind, ]    # (true) latent responses
##D # define guessing and slipping parameters
##D guess <- c(.26,.3,.07,.23,.24,.34,.05,.1)
##D slip <- c(.05,.16,.19,.03,.03,.19,.15,.05)
##D # simulation of the DINA model
##D dat <- CDM::sim.din(N=0, q.matrix=Qmatrix, guess=guess,
##D               slip=slip, alpha=alpha)$dat
##D # estimate model
##D res <- CDM::din( dat, q.matrix=Qmatrix )
##D # extract maximum likelihood estimates for individual classifications
##D est <- paste( res$pattern$mle.est )
##D # calculate classification accuracy
##D mean( est==apply( alpha, 1, FUN=function(ll){ paste0(ll[1],ll[2] ) } ) )
##D   ##   [1] 0.935
##D 
##D #############################################################################
##D # EXAMPLE 3: Simulation based on already estimated DINA model for data.ecpe
##D #############################################################################
##D 
##D dat <- CDM::data.ecpe$data
##D q.matrix <- CDM::data.ecpe$q.matrix
##D 
##D #***
##D # (1) estimate DINA model
##D mod <- CDM::din( data=dat[,-1], q.matrix=q.matrix, rule="DINA")
##D 
##D #***
##D # (2) simulate data according to DINA model
##D set.seed(977)
##D # number of subjects to be simulated
##D n <- 3000
##D # simulate attribute patterns
##D probs <- mod$attribute.patt$class.prob   # probabilities
##D patt <- mod$attribute.patt.splitted      # response patterns
##D alpha <- patt[ sample( 1:(length(probs) ), n, prob=probs, replace=TRUE), ]
##D # simulate data using estimated item parameters
##D res <- CDM::sim.din(N=n, q.matrix=q.matrix, guess=mod$guess$est, slip=mod$slip$est,
##D               rule="DINA", alpha=alpha)
##D # extract data
##D dat <- res$dat
## End(Not run)




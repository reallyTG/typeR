library(MBSP)


### Name: mbsp.tpbn
### Title: MBSP Model with Three Parameter Beta Normal (TPBN) Family
### Aliases: mbsp.tpbn

### ** Examples


#############################################
#############################################
## EXAMPLE ON SYNTHETIC DATA:              ##
## Can change n, p, q, p.act, max.steps,   ##
## and burnin below to reproduce the       ##
## simulations from Section 5.1 of Bai     ##
## and Ghosh                               ##
#############################################
#############################################
n <- 50
p <- 10
q <- 3
# Active number of predictors is 2
p.act <- 2

#############################
# Generate design matrix X. #
#############################
times <- 1:p
rho <- 0.5
H <- abs(outer(times, times, "-"))
V <- rho^H
mu <- rep(0, p)
# Rows of X are simulated from MVN(0,V)
X <- mvrnorm(n, mu, V)
# Center X
X <- scale(X, center=TRUE, scale=FALSE)

#########################################
# Generate true coefficient matrix B_0. #
#########################################
# Entries in nonzero rows are drawn from Unif[(-5,-0.5)U(0.5,5)] 
B.act <- runif(p.act*q,-5,4)
disjoint <- function(x){
         if(x <= -0.5)
            return(x)
         else
           return(x+1)
     }
B.act <- matrix(sapply(B.act, disjoint),p.act,q)

# Set rest of the rows equal to 0
B.true <- rbind(B.act,matrix(0,p-p.act,q))
B.true <- B.true[sample(1:p),] # permute the rows

########################################
# Generate true error covariance Sigma #
########################################
sigma.sq=2
times <- 1:q
H <- abs(outer(times, times, "-"))
Sigma <- sigma.sq * rho^H
  
###########################
# Generate noise matrix E #
###########################
mu <- rep(0,q)
E <- mvrnorm(n, mu, Sigma)

##############################
# Generate response matrix Y #
##############################
Y <- crossprod(t(X),B.true) + E

#########################################
# Run the MBSP model on synthetic data. #
#########################################

# For optimal estimation, change max.steps to 15,000 
# and change burnin to be 5000

mbsp.model = mbsp.tpbn(X=X, Y=Y, max.steps = 2000, burnin=1000)

## Not run: 
##D ################################
##D # Compute MSE_est and MSE_pred #
##D ################################
##D MSE.est <- sum((mbsp.model$B.est-B.true)^2)/(p*q)
##D MSE.est # Note that in the paper it is scaled by factor of 100
##D 
##D MSE.pred <- sum((crossprod(t(X), mbsp.model$B.est - B.true))^2)/(n*q)
##D MSE.pred # Note that in the paper it is scaled by a factor of 100
##D 
##D ################################
##D # Compute the FDR, FNR, and MP #
##D ################################
##D 
##D # Initialize vector for classification of predictors i = 1,...,p
##D predictor.classifications <- rep(0, p)
##D # Initialize vector for true classifications of predictors i = 1,...,p
##D true.classifications <- rep(0,p)
##D 
##D # True active predictors in B.True
##D true.active.indices <- which(rowSums(B.true) != 0)
##D # Rest true signals as 1
##D true.classifications[true.active.indices] <- 1
##D 
##D # Active predictors according to our estimates
##D predictor.classifications[mbsp.model$active.predictors] <- 1
##D 
##D # Keep track of false positives and false negatives
##D false.pos <- length(which(predictor.classifications != 0 & true.classifications == 0))
##D tot.pos <- length(which(predictor.classifications != 0))
##D false.neg <- length(which(predictor.classifications == 0 & true.classifications != 0))
##D tot.neg <- length(which(predictor.classifications == 0))
##D 
##D # Compute FDR, FNR, and MP
##D fdr.rate <- false.pos/tot.pos
##D fnr.rate <- false.neg/tot.neg
##D mis.prob <- (false.pos+false.neg)/p
##D 
##D fdr.rate
##D fnr.rate
##D mis.prob
## End(Not run)

## Don't show: 
ptm <- proc.time()

##############################
# EXAMPLE ON SYNTHETIC DATA: #
##############################
n <- 30
p <- 20
q <- 4
# Active number of predictors is 3
p.act <- 3

#############################
# Generate design matrix X. #
#############################
times <- 1:p
rho <- 0.5
H <- abs(outer(times, times, "-"))
V <- rho^H
mu <- rep(0, p)
# Rows of X are simulated from MVN(0,V)
X <- mvrnorm(n, mu, V)
# Center X
X <- scale(X, center=TRUE, scale=FALSE)

#########################################
# Generate true coefficient matrix B_0. #
#########################################
# Entries in nonzero rows are drawn from Unif[(-5,-0.5)U(0.5,5)] 
B.act <- runif(p.act*q,-5,4)
disjoint <- function(x){
         if(x <= -0.5)
            return(x)
         else
           return(x+1)
     }
B.act <- matrix(sapply(B.act, disjoint),p.act,q)

# Set rest of the rows equal to 0
B.true <- rbind(B.act,matrix(0,p-p.act,q))
B.true <- B.true[sample(1:p),] # permute the rows

########################################
# Generate true error covariance Sigma #
########################################
sigma.sq=2
times <- 1:q
H <- abs(outer(times, times, "-"))
Sigma <- sigma.sq * rho^H
  
###########################
# Generate noise matrix E #
###########################
mu <- rep(0,q)
E <- mvrnorm(n, mu, Sigma)

##############################
# Generate response matrix Y #
##############################
Y <- crossprod(t(X),B.true) + E

#########################################
# Run the MBSP model on synthetic data. #
#########################################

# For optimal estimation, change max.steps to 15,000 
# and change burnin to be 5000

mbsp.model = mbsp.tpbn(X=X, Y=Y, max.steps = 1000, burnin=500)

mbsp.model$B.est
mbsp.model$active.predictors

sim.time <- (proc.time()-ptm)[3]
sim.time
## End(Don't show)


## Not run: 
##D #
##D #
##D #############################################
##D ############################################# 
##D ## MBSP analysis of yeast cell cycle       ##
##D ## data set (Section 5.2 of Bai and Ghosh) ##              
##D #############################################
##D #############################################
##D 
##D # Load yeast data set
##D data(yeast)
##D 
##D # Set seed
##D set.seed(12345)
##D 
##D # Design matrix X and response matrix Y
##D X <- yeast$x
##D X <- scale(X, center=TRUE, scale=FALSE)
##D Y <- yeast$y
##D Y <- scale(Y, center=TRUE, scale=FALSE)
##D 
##D # Make sure they are matrices
##D X <- matrix(X, nrow=nrow(X))
##D Y <- matrix(Y, nrow=nrow(Y))
##D 
##D ###################################
##D # Run the MBSP model on the yeast #
##D # cell cycle data set             #
##D ###################################
##D mbsp.model = mbsp.tpbn(X=X,Y=Y)
##D 
##D # Display the active predictors (correspond to row indices in B)
##D mbsp.model$active.predictors
##D 
##D # Display names of four of the active TFs
##D colnames(yeast$x)[2]
##D colnames(yeast$x)[38]
##D colnames(yeast$x)[61]
##D colnames(yeast$x)[94]
##D 
##D # For horizontal axis (time)
##D time <- seq(from=0, to=119, by=7)
##D 
##D ##############################################
##D # Open pdf to plot 4 of the active TFs.      #
##D # This reproduces Figure 1 of Bai and  Ghosh #
##D ##############################################
##D pdf(file=file.path(tempdir(), "significantTFs.pdf"), width=5, height=5)
##D par(mfrow=c(2,2), mar=c(2,2,2,2))
##D plot(time, mbsp.model$B.est[2,], type="l", cex.axis = 0.5, xlab="", 
##D      main="ACE2", ylim=c(-0.6,0.6), ylab="")
##D abline(h=0)
##D lines(time, mbsp.model$lower.endpoints[2,], lty=2)
##D lines(time, mbsp.model$upper.endpoints[2,], lty=2)
##D 
##D plot(time, mbsp.model$B.est[38,], type="l", cex.axis = 0.5, xlab="", 
##D      main="HIR1", ylim=c(-0.6,0.6), ylab="")
##D abline(h=0)
##D lines(time, mbsp.model$lower.endpoints[38,], lty=2)
##D lines(time, mbsp.model$upper.endpoints[38,], lty=2)
##D 
##D plot(time, mbsp.model$B.est[61,], type="l", cex.axis = 0.5, xlab="",
##D      main="NDD1", ylim=c(-0.6,0.6), ylab="")
##D abline(h=0)
##D lines(time, mbsp.model$lower.endpoints[61,], lty=2)
##D lines(time, mbsp.model$upper.endpoints[61,], lty=2)
##D 
##D plot(time, mbsp.model$B.est[94,], type="l", cex.axis = 0.5, xlab="", 
##D      main="SWI6", ylim=c(-0.6,0.6), ylab="")
##D abline(h=0)
##D lines(time, mbsp.model$lower.endpoints[94,], lty=2)
##D lines(time, mbsp.model$upper.endpoints[94,], lty=2)
##D dev.off()
## End(Not run)





library(CDM)


### Name: din.deterministic
### Title: Deterministic Classification and Joint Maximum Likelihood
###   Estimation of the Mixed DINA/DINO Model
### Aliases: din.deterministic
### Keywords: Deterministic classification Cluster analysis Joint maximum
###   likelihood

### ** Examples

#############################################################################
# EXAMPLE 1: 13 items and 3 attributes
#############################################################################

set.seed(679)
N <- 3000
# specify true Q-matrix
q.matrix <- matrix( 0, 13, 3 )
q.matrix[1:3,1] <- 1
q.matrix[4:6,2] <- 1
q.matrix[7:9,3] <- 1
q.matrix[10,] <- c(1,1,0)
q.matrix[11,] <- c(1,0,1)
q.matrix[12,] <- c(0,1,1)
q.matrix[13,] <- c(1,1,1)
q.matrix <- rbind( q.matrix, q.matrix )
colnames(q.matrix) <- paste0("Attr",1:ncol(q.matrix))

# simulate data according to the DINA model
dat <- CDM::sim.din( N=N, q.matrix)$dat

# Joint maximum likelihood estimation (the default: method="JML")
res1 <- CDM::din.deterministic( dat, q.matrix )

# Adaptive estimation of guessing and slipping parameters
res <- CDM::din.deterministic( dat, q.matrix, method="adaptive" )

# Classification using Hamming distance
res <- CDM::din.deterministic( dat, q.matrix, method="hamming" )

# Classification using weighted Hamming distance
res <- CDM::din.deterministic( dat, q.matrix, method="weighted.hamming" )

## Not run: 
##D #********* load NPCD library for JML estimation
##D library(NPCD)
##D 
##D # DINA model
##D res <- NPCD::JMLE( Y=dat[1:100,], Q=q.matrix, model="DINA" )
##D as.data.frame(res$par.est )   # item parameters
##D res$alpha.est                 # skill classifications
##D 
##D # RRUM model
##D res <- NPCD::JMLE( Y=dat[1:100,], Q=q.matrix, model="RRUM" )
##D as.data.frame(res$par.est )
## End(Not run)




library(CDM)


### Name: equivalent.dina
### Title: Determination of a Statistically Equivalent DINA Model
### Aliases: equivalent.dina
### Keywords: DINA

### ** Examples

#############################################################################
# EXAMPLE 1: Toy example
#############################################################################

# define a Q-matrix
Q <- matrix( c( 1,0,0,  0,1,0,
        0,0,1,   1,0,1,  1,1,1 ), byrow=TRUE, ncol=3 )
Q <- Q[ rep(1:(nrow(Q)),each=2), ]

# equivalent DINA model (using the default reparameterization B)
res1 <- CDM::equivalent.dina( q.matrix=Q )
res1

# equivalent DINA model (reparametrization A)
res2 <- CDM::equivalent.dina( q.matrix=Q, reparameterization="A")
res2

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Estimation with two equivalent DINA models
##D #############################################################################
##D 
##D # simulate data
##D set.seed(789)
##D D <- ncol(Q)
##D mean.alpha <- c( -.5, .5, 0  )
##D r1 <- .5
##D Sigma.alpha <- matrix( r1, D, D ) + diag(1-r1,D)
##D dat1 <- CDM::sim.din( N=2000, q.matrix=Q, mean=mean.alpha, Sigma=Sigma.alpha )
##D 
##D # estimate DINA model
##D mod1 <- CDM::din( dat1$dat, q.matrix=Q )
##D 
##D # estimate equivalent DINA model
##D mod2 <- CDM::din( dat1$dat, q.matrix=res1$q.matrix.ast, skillclasses=res1$alpha.ast)
##D # restricted skill space must be defined by using the argument 'skillclasses'
##D 
##D # compare model summaries
##D summary(mod2)
##D summary(mod1)
##D 
##D # compare estimated item parameters
##D cbind( mod2$coef, mod1$coef )
##D 
##D # compare estimated skill class probabilities
##D round( cbind( mod2$attribute.patt, mod1$attribute.patt ), 4 )
##D 
##D 
##D #############################################################################
##D # EXAMPLE 3: Examples from von Davier (2014)
##D #############################################################################
##D 
##D # define Q-matrix
##D Q <- matrix( 0, nrow=8, ncol=3 )
##D Q[2, ] <- c(1,0,0)
##D Q[3, ] <- c(0,1,0)
##D Q[4, ] <- c(1,1,0)
##D Q[5, ] <- c(0,0,1)
##D # Q[6, ] <- c(1,0,1)
##D Q[6, ] <- c(0,0,1)
##D Q[7, ] <- c(0,1,1)
##D Q[8, ] <- c(1,1,1)
##D 
##D #- parametrization A
##D res1 <- CDM::equivalent.dina(q.matrix=Q, reparameterization="A")
##D res1
##D 
##D #- parametrization B
##D res2 <- CDM::equivalent.dina(q.matrix=Q, reparameterization="B")
##D res2
## End(Not run)




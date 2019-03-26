library(TAM)


### Name: data.sim.rasch
### Title: Simulated Rasch data
### Aliases: data.sim.rasch data.sim.rasch.pweights data.sim.rasch.missing
### Keywords: datasets

### ** Examples

## Not run: 
##D data(data.sim.rasch)
##D N <- 2000
##D Y <- cbind( stats::rnorm( N, sd=1.5), stats::rnorm(N, sd=.3 ) )
##D 
##D # Loading Matrix
##D # B <- array( 0, dim=c( I, 2, 1 )  )
##D # B[1:(nrow(B)), 2, 1] <- 1
##D B <- TAM::designMatrices(resp=data.sim.rasch)[["B"]]
##D 
##D # estimate Rasch model
##D mod1_1 <- TAM::tam.mml(resp=data.sim.rasch, Y=Y)
##D 
##D # standard errors
##D res1 <- TAM::tam.se(mod1_1)
##D 
##D # Compute fit statistics
##D tam.fit(mod1_1)
##D 
##D # plausible value imputation
##D # PV imputation has to be adpated for multidimensional case!
##D pv1 <- TAM::tam.pv( mod1_1, nplausible=7, # 7 plausible values
##D                samp.regr=TRUE       # sampling of regression coefficients
##D               )
##D 
##D # item parameter constraints
##D xsi.fixed <- matrix( c( 1, -2,5, -.22,10, 2 ), nrow=3, ncol=2, byrow=TRUE)
##D xsi.fixed
##D mod1_4 <- TAM::tam.mml( resp=data.sim.rasch, xsi.fixed=xsi.fixed )
##D 
##D # missing value handling
##D data(data.sim.rasch.missing)
##D mod1_2 <- TAM::tam.mml(data.sim.rasch.missing, Y=Y)
##D 
##D # handling of sample (person) weights
##D data(data.sim.rasch.pweights)
##D N <- 1000
##D pweights <- c(  rep(3,N/2), rep( 1, N/2 ) )
##D mod1_3 <- TAM::tam.mml( data.sim.rasch.pweights, control=list(conv=.001),
##D                pweights=pweights )
##D   
## End(Not run)




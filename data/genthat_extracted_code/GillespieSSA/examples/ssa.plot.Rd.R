library(GillespieSSA)


### Name: ssa.plot
### Title: Simple plotting of ssa output
### Aliases: ssa.plot
### Keywords: misc datagen ts device utilities hplot

### ** Examples

## Not run: 
##D ## Define the Kermack-McKendrick SIR model and run once using the Direct method
##D parms <- c(beta=.001, gamma=.100)
##D x0 <- c(S=500, I=1, R=0)                      # Initial state vector
##D nu <- matrix(c(-1,0,1,-1,0,1),nrow=3,byrow=T) # State-change matrix
##D a  <- c("beta*S*I", "gamma*I")                # Propensity vector
##D tf <- 100                                     # Final time
##D simName <- "Kermack-McKendrick SIR"
##D out <- ssa(x0,a,nu,parms,tf,method="D",simName,verbose=TRUE,consoleInterval=1)
## End(Not run)

## Not run: 
##D ## Basic ssa plot
##D ssa.plot(out) 
## End(Not run)

## Not run: 
##D # Plot only the infectious class
##D ssa.plot(out,plot.from=3,plot.to=3)
## End(Not run)

## Not run: 
##D ## Multipanel plot using different SSA methods
##D layout(matrix(seq(4),ncol=4,byrow=TRUE))
##D 
##D ## Using the Direct method
##D ssa.plot(out)
##D 
##D ## Run and plot results using the ETL method
##D out <- ssa(x0,a,nu,parms,tf=100,method="ETL,simName="Kermack-McKendrick SIR")
##D ssa.plot(out,show.title=FALSE,show.legend=FALSE)
##D 
##D ## Run and plot results using the BTL method
##D out <- ssa(x0,a,nu,parms,tf=100,method="BTL,simName="Kermack-McKendrick SIR")
##D ssa.plot(out,show.title=FALSE,show.legend=FALSE)
##D 
##D ## Run and plot results using the OTL method
##D out <- ssa(x0,a,nu,parms,tf=100,method="OTL,simName="Kermack-McKendrick SIR")
##D ssa.plot(out,show.title=FALSE,show.legend=FALSE)
## End(Not run)




library(nFactors)


### Name: nScreeObjectMethods
### Title: Utility Functions for nScree Class Objects
### Aliases: is.nScree plot.nScree print.nScree summary.nScree
### Keywords: multivariate

### ** Examples

## INITIALISATION
 data(dFactors)                      # Load the nFactors dataset
 attach(dFactors)
 vect         <- Raiche              # Use the example from Raiche
 eigenvalues  <- vect$eigenvalues    # Extract the observed eigenvalues
 nsubjects    <- vect$nsubjects      # Extract the number of subjects
 variables    <- length(eigenvalues) # Compute the number of variables
 rep          <- 100                 # Number of replications for the parallel analysis
 cent         <- 0.95                # Centile value of the parallel analysis

## PARALLEL ANALYSIS (qevpea for the centile criterion, mevpea for the mean criterion)
 aparallel    <- parallel(var     = variables,
                          subject = nsubjects, 
                          rep     = rep, 
                          cent    = cent
                          )$eigen$qevpea  # The 95 centile

## NOMBER OF FACTORS RETAINED ACCORDING TO DIFFERENT RULES 
 results      <- nScree(x=eigenvalues, aparallel=aparallel)
 
 is.nScree(results)
 results
 summary(results)
 
## PLOT ACCORDING TO THE nScree CLASS 
 plot(results)
 



library(nFactors)


### Name: plotnScree
### Title: Scree Plot According to a nScree Object Class
### Aliases: plotnScree
### Keywords: Graphics

### ** Examples

## INITIALISATION
 data(dFactors)                      # Load the nFactors dataset
 attach(dFactors)
 vect         <- Raiche              # Use the second example from Buja and Eyuboglu 
                                     # (1992, p. 519, nsubjects not specified by them)
 eigenvalues  <- vect$eigenvalues    # Extract the observed eigenvalues
 nsubjects    <- vect$nsubjects      # Extract the number of subjects
 variables    <- length(eigenvalues) # Compute the number of variables
 rep          <- 100                 # Number of replications for the parallel analysis
 cent         <- 0.95                # Centile value of the parallel analysis

## PARALLEL ANALYSIS (qevpea for the centile criterion, mevpea for the mean criterion)
 aparallel    <- parallel(var     = variables,
                          subject = nsubjects, 
                          rep     = rep, 
                          cent    = cent)$eigen$qevpea  # The 95 centile

## NOMBER OF FACTORS RETAINED ACCORDING TO DIFFERENT RULES 
 results <- nScree(eig       = eigenvalues,
                   aparallel = aparallel
                   )
                   
 results
 
## PLOT ACCORDING TO THE nScree CLASS 
 plotnScree(results)
 



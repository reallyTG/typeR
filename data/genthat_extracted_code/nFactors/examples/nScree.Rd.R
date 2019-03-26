library(nFactors)


### Name: nScree
### Title: Non Graphical Cattel's Scree Test
### Aliases: nScree
### Keywords: multivariate

### ** Examples

## INITIALISATION
 data(dFactors)                      # Load the nFactors dataset
 attach(dFactors)
 vect         <- Raiche              # Uses the example from Raiche
 eigenvalues  <- vect$eigenvalues    # Extracts the observed eigenvalues
 nsubjects    <- vect$nsubjects      # Extracts the number of subjects
 variables    <- length(eigenvalues) # Computes the number of variables
 rep          <- 100                 # Number of replications for PA analysis
 cent         <- 0.95                # Centile value of PA analysis

## PARALLEL ANALYSIS (qevpea for the centile criterion, mevpea for the
## mean criterion)
 aparallel    <- parallel(var     = variables,
                          subject = nsubjects, 
                          rep     = rep, 
                          cent    = cent
                          )$eigen$qevpea  # The 95 centile

## NUMBER OF FACTORS RETAINED ACCORDING TO DIFFERENT RULES
 results      <- nScree(x=eigenvalues, aparallel=aparallel)
 results
 summary(results)
 
## PLOT ACCORDING TO THE nScree CLASS 
 plotnScree(results)
 



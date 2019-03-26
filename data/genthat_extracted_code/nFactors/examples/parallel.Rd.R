library(nFactors)


### Name: parallel
### Title: Parallel Analysis of a Correlation or Covariance Matrix
### Aliases: parallel
### Keywords: multivariate

### ** Examples

## SIMPLE EXAMPLE OF A PARALLEL ANALYSIS
## OF A CORRELATION MATRIX WITH ITS PLOT
 data(dFactors)
 eig      <- dFactors$Raiche$eigenvalues
 subject  <- dFactors$Raiche$nsubjects
 var      <- length(eig)
 rep      <- 100
 quantile <- 0.95
 results  <- parallel(subject, var, rep, quantile)

 results

## IF THE DECISION IS BASED ON THE CENTILE USE qevpea INSTEAD
## OF mevpea ON THE FIRST LINE OF THE FOLLOWING CALL
 plotuScree(x    = eig,
            main = "Parallel Analysis"
            )
            
 lines(1:var,
       results$eigen$qevpea,
       type="b",
       col="green"
       )


## ANOTHER SOLUTION IS SIMPLY TO
 plotParallel(results)
 



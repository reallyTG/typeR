library(protViz)


### Name: mascot
### Title: Generic methods for mascot results
### Aliases: mascot plot.mascot plot.mascot_query is.mascot is.mascot_query
###   as.data.frame.mascot summary.mascot as.psm.mascot_query

### ** Examples

## Not run: 
##D   # plot the top ten highes scored PSMs
##D   par(ask = TRUE)
##D   idx <- order(protViz:::.mascot.get.pep_score(S), decreasing = TRUE)[1:10]
##D   rv.peakplot <- lapply(S$queries[idx], plot)
##D   
##D   
##D   myAA <- do.call('rbind', lapply(F225712$masses, 
##D     function(x){
##D       data.frame(letter1=as.character(x$.attrs), mass=as.numeric(x$text))
##D       }))
##D       
##D   aa2mass("ELVISR", mass=myAA$mass[1:25], letter1 = myAA$letter1[1:25])
##D   
## End(Not run)




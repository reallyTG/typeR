library(plsdepot)


### Name: nipals
### Title: NIPALS: Non-linear Iterative Partial Least Squares
### Aliases: nipals

### ** Examples

## Not run: 
##D  # load datasets carscomplete and carsmissing
##D  data(carscomplete) # complete data
##D  data(carsmissing)  # missing values
##D 
##D  # apply nipals
##D  my_nipals1 = nipals(carscomplete)
##D  my_nipals2 = nipals(carsmissing)
##D 
##D  # plot variables (circle of correlations)
##D  plot(my_nipals1, what="variables", main="Complete data")
##D  plot(my_nipals2, what="variables", main="Missing data")
##D 
##D  # plot observations with labels
##D  plot(my_nipals1, what="observations", show.names=TRUE, main="Complete data")
##D  plot(my_nipals2, what="observations", show.names=TRUE, main="Missing data")
##D 
##D  # compare results between my_nipals1 and my_nipals2
##D  plot(my_nipals1$scores[,1], my_nipals2$scores[,1], type="n")
##D  title("Scores comparison: my_nipals1  -vs-  my_nipals2", cex.main=0.9)
##D  abline(a=0, b=1, col="gray85", lwd=2)
##D  points(my_nipals1$scores[,1], my_nipals2$scores[,1], pch=21,
##D         col="#5592e3", bg = "#5b9cf277", lwd=1.5)
##D  
## End(Not run)




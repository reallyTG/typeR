library(smatr)


### Name: multcompmatrix
### Title: Multiple comparisons graphical matrix
### Aliases: multcompmatrix
### Keywords: misc

### ** Examples


# Print the matrix of comparisons:
data(leaflife)
sm1 <- sma(lma ~ longev + site, data=leaflife, multcomp=TRUE)
multcompmatrix(sm1)

# Write the matrix to a file like this:
## Not run: 
##D capture.output(multcompmatrix(sm1), file="sm1matrix.txt")
## End(Not run)





library(HelpersMG)


### Name: plot.LD50
### Title: Plot results of LD50() that best describe LD50
### Aliases: plot.LD50

### ** Examples

## Not run: 
##D #' data <- data.frame(Doses=c(80, 120, 150, 150, 180, 200),
##D Alive=c(10, 12, 8, 6, 2, 1),
##D Dead=c(0, 1, 5, 6, 9, 15))
##D LD50_logistic <- LD50(data, equation="logistic")
##D predict(LD50_logistic, doses=c(140, 170))
##D plot(LD50_logistic)
## End(Not run)




library(EloChoice)


### Name: triplets
### Title: calculate ratings from sequence of rating events, allowing for
###   more than two stimuli
### Aliases: triplets

### ** Examples

## Not run: 
##D data(physical)
##D y <- round(triplets(physical[,2:3], winner=rep(1,nrow(physical)), runs = 1))
##D x <- ratings(elochoice(physical$Winner, physical$Loser, runs = 1), show = "all", drawplot = FALSE)
##D x <- x[order(names(x))]
##D plot(x, y)
##D 
##D xdata <- as.matrix(t(sapply(1:500, function(x)sample(letters[1:8], 3))))
##D xdata <- t(apply(xdata, 1, sort))
##D winner <- sample(1:3, nrow(xdata), TRUE, prob = c(4,0.8, 0.1))
##D 
##D x <- triplets(xdata, winner, runs=20, mode="avg")
##D y <- triplets(xdata, winner, runs=20, mode="seq")
##D 
##D # note different ranges along the axes
##D plot(colMeans(x), colMeans(y))
##D range(colMeans(x))
##D range(colMeans(y))
## End(Not run)




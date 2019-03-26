library(hyperSpec)


### Name: bind
### Title: Binding hyperSpec Objects
### Aliases: bind cbind.hyperSpec bind rbind.hyperSpec
###   cbind2,hyperSpec,hyperSpec-method rbind2,hyperSpec,hyperSpec-method
###   cbind2,hyperSpec,missing-method rbind2,hyperSpec,missing-method
###   rbind.hyperSpec cbind2,hyperSpec,hyperSpec-method
###   cbind2,hyperSpec,missing-method rbind2,hyperSpec,hyperSpec-method
###   rbind2,hyperSpec,missing-method
### Keywords: manip methods

### ** Examples


chondro
bind ("r", chondro, chondro)
rbind (chondro, chondro)
cbind (chondro, chondro)
bind ("r", list (chondro, chondro, chondro))

x <- chondro[,, 600 : 605]
x$a <- 1
x@data <- x@data[, sample (ncol (x), ncol (x))] # reorder columns

y <- chondro [nrow (chondro) : 1,, 1730 : 1750] # reorder rows
y$b <- 2

cbind2 (x, y) # works

y$y[3] <- 5
try (cbind2 (x, y)) # error

# list of hyperSpec objects

lhy <- list (flu, flu)
do.call ("rbind", lhy)
bind ("r", lhy)




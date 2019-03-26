library(rgabriel)


### Name: rgabriel-package
### Title: Gabriel Multiple Comparison Test and Plot the Confidence
###   Interval on Barplot
### Aliases: rgabriel-package
### Keywords: package, plot, Gabriel

### ** Examples


# equal numbers

g <- c(1:50)
f <- c(rep(1,10),rep(2,10),rep(3,10),rep(4,10),rep(5,10))
gabriel.plot(g,f,rgabriel(g,f))

# unequal numbers

g <- c(1:40)
f <- c(rep(1,3),rep(2,12),rep(3,15),rep(4,5),rep(5,5))
gabriel.plot(g,f,rgabriel(g,f))





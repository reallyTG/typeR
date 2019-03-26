library(klaR)


### Name: shardsplot
### Title: Plotting Eight Direction Arranged Maps or Self-Organizing Maps
### Aliases: shardsplot level_shardsplot plot.EDAM
### Keywords: hplot

### ** Examples

# Compute clusters and an Eight Directions Arranged Map for the 
# country data. Plotting the result.
data(countries)
logcount <- log(countries[,2:7])
sdlogcount <- apply(logcount, 2, sd)
logstand <- t((t(logcount) / sdlogcount) * c(1,2,6,5,5,3))
cclasses <- cutree(hclust(dist(logstand)), k = 6)
countryEDAM <- EDAM(logstand, classes = cclasses, sa = FALSE, 
    iter.max = 10, random = FALSE)
plot(countryEDAM, vertices = FALSE, label = TRUE, stck = FALSE)

# Compute and plot a Self-Organizing Map for the iris data
data(iris)
library(som)
irissom <- som(iris[,1:4], xdim = 6, ydim = 14)
shardsplot(irissom, data.or = iris, vertices = FALSE)
opar <- par(xpd = NA)
legend(7.5, 6.1, col = rainbow(3), xjust = 0.5, yjust = 0,
    legend = levels(iris[, 5]), pch = 16, horiz = TRUE)
par(opar)    

level_shardsplot(irissom, par.names = names(iris), 
    class.labels = NA, mfrow = c(2,2))




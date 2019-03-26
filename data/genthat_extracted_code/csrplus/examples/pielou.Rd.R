library(csrplus)


### Name: pielou
### Title: Nearest Neighbor Test Statistic: Pielou
### Aliases: pielou

### ** Examples

# To load data corresponding to the location of earthquakes in California:
data(quake)

# To load data corresponding to the boundary:
data(boundary)

# To compute the one hundred values of the test statistic:
p <- mat.or.vec(100,1)
for (i in 1:100) {
   p[i] <- pielou(quake[,3], quake[,2], 30, boundary[,1], boundary[,2], 7.177) }
# To compute the average test statistic:
pavg <- mean(p)
# To calculate a z-statistic to evalute the null hypothesis of complete spatial randomness:
z <- (pavg-1)/sqrt(1/30)




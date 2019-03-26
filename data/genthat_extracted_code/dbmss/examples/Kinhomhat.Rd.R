library(dbmss)


### Name: Kinhomhat
### Title: Estimation of the inhomogenous K function
### Aliases: Kinhomhat

### ** Examples

data(paracou16)

# Density of all trees
lambda <- density.ppp(paracou16, bw.diggle(paracou16))
plot(lambda)
# Reduce the point pattern to one type of trees
V.americana <- paracou16[paracou16$marks$PointType=="V. Americana"]
plot(V.americana, add=TRUE)

# Calculate Kinhom according to the density of all trees
r <- 0:30
plot(Kinhomhat(paracou16, r, "V. Americana", lambda), ./(pi*r^2) ~ r)




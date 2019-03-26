library(lidR)


### Name: LAD
### Title: Leaf area density
### Aliases: LAD

### ** Examples

z = c(rnorm(1e4, 25, 6), rgamma(1e3, 1, 8)*6, rgamma(5e2, 5,5)*10)
z = z[z<45 & z>0]

lad = LAD(z)

plot(lad, type="l", xlab="Elevation", ylab="Leaf area density")




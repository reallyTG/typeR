library(elliptic)


### Name: ck
### Title: Coefficients of Laurent expansion of Weierstrass P function
### Aliases: ck e18.5.2 e18.5.3 e18.5.16
### Keywords: math

### ** Examples

 #Verify 18.5.16, p636:
 x <- ck(g=c(0.1+1.1i,4-0.63i))
14*x[2]*x[3]*(389*x[2]^3+369*x[3]^2)/3187041-x[11] #should be zero


# Now try a random example by comparing the default (theta function) method
# for P(z) with the Laurent expansion:

z <- 0.5-0.3i
g <- c(1.1-0.2i, 1+0.4i)
series <- ck(15,g=g)
1/z^2+sum(series*(z^2)^(0:14)) - P(z,g=g) #should be zero




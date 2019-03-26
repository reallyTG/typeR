library(GeneF)


### Name: flexorhtest
### Title: A Flexible Order Restricted Hypothesis Testing
### Aliases: flexisoreg flexisoreg.stat flexmonoreg flexmonoreg.stat
### Keywords: htest

### ** Examples

#generate ordinal group lables x
x <- runif(100)*6
x <- round(x,0)/3
#generate true values z
z <- round(x^2,0)
#generate observed values y
y <- z + rnorm(100)


#print default results
print(rbind(x,z,y))
print(flexisoreg(y,x))
print(flexisoreg.stat(y,x))
print(flexisoreg(y,0-x))
print(flexisoreg.stat(y,0-x))
print(flexmonoreg(y,x))
print(flexmonoreg.stat(y,x))


     #plots for illustration
     par(mfrow=c(2,3), mai=c(0.6, 0.6, 0.3, 0.1))
     plot(x,y, main="True Model",cex.axis=1.5, cex.lab=1.5, cex.main=1.5, cex=1.5)
     lines(x, z, type="p", pch=15, col="black", cex=2.5)

     results <- flexisoreg(y, x, lambda=1, alpha.location=0.05, alpha.adjacency=1)
     plot(x,y, main="Location Restriction",cex.axis=1.5, cex.lab=1.5, cex.main=1.5, cex=1.5)
     lines(x, results$estimate, type="p", pch=15, col="black", cex=2.5)

     results <- flexisoreg(y, x, lambda=1, alpha.location=0.05, alpha.adjacency=0.05)
     plot(x,y, main="Location and Strong Order Restrictions",cex.axis=1.5, cex.lab=1.5, cex.main=1.5, cex=1.5)
     lines(x, results$estimate, type="p", pch=15, col="black", cex=2.5)

     results <- flexisoreg(y, x, lambda=0, alpha.location=1, alpha.adjacency=0.95)
     plot(x,y, main="Weak Order Restriction",cex.axis=1.5, cex.lab=1.5, cex.main=1.5, cex=1.5)
     lines(x, results$estimate, type="p", pch=15, col="black", cex=2.5)

     results <- flexisoreg(y, x, lambda=0, alpha.location=1, alpha.adjacency=0.5)
     plot(x,y, main="General Order Restriction",cex.axis=1.5, cex.lab=1.5, cex.main=1.5, cex=1.5)
     lines(x, results$estimate, type="p", pch=15, col="black", cex=2.5)

     results <- flexisoreg(y, x, lambda=0, alpha.location=1, alpha.adjacency=0.05)
     plot(x,y, main="Strong Order Restriction",cex.axis=1.5, cex.lab=1.5, cex.main=1.5, cex=1.5)
     lines(x, results$estimate, type="p", pch=15, col="black", cex=2.5)





library(GeneF)


### Name: flexorhtest.pvalue
### Title: Significance Assessment for the Flexible Order Restricted
###   Hypothesis Testing
### Aliases: flexisoreg.pvalue flexisoreg.poolpvalues flexmonoreg.pvalue
###   flexmonoreg.poolpvalues
### Keywords: htest

### ** Examples

#generate ordinal group lables x
x <- runif(100)*6
x <- round(x,0)/3
#generate true values z
z <- round(x^2,0)
#generate 6 vectors in a matrix for observed values, some noises and some not
m <- array(double(6*100), dim=c(6,100))
for(k in 1:3)
m[k,] <- rnorm(100)
for(k in 4:6)
m[k,] <- z + rnorm(100)


#print default results
par(mfrow=c(2,3))
for(k in 1:6){
print(paste("The ", k, "-th vector", sep=""))
y <- m[k,]
plot(x,y,main=k)
print(flexisoreg.stat(y,x))
print(flexisoreg.pvalue(y,x,B=20))
print(flexisoreg.stat(y,0-x))
print(flexisoreg.pvalue(y,0-x,B=20))
print(flexmonoreg.stat(y,x))
print(flexmonoreg.pvalue(y,x,B=20))
}

flexisoreg.poolpvalues(m, x, B=20)
flexmonoreg.poolpvalues(m, x, B=20)





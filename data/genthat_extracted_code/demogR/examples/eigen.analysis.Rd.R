library(demogR)


### Name: eigen.analysis
### Title: eigen.analysis
### Aliases: eigen.analysis
### Keywords: array algebra

### ** Examples


data(goodman)
ven <- with(goodman, life.table(x=age, nKx=ven.nKx, nDx=ven.nDx))
ven.mx <- with(goodman, ven.bx/ven.nKx)
A <- leslie.matrix(lx=ven$nLx,mx=ven.mx)

usa <- with(goodman, life.table(x=age, nKx=usa.nKx, nDx=usa.nDx))
usa.mx <- with(goodman, usa.bx/usa.nKx)
B <- leslie.matrix(lx=usa$nLx,mx=usa.mx)

eav <- eigen.analysis(A)
eau <- eigen.analysis(B)

## compare rates of increase

eav$lambda1
eau$lambda1

## compare stable age distributions for Venezuela and the USA
op <- par(no.readonly = TRUE)
age <- seq(0,50,by=5)
par(mfrow=c(1,2))
barplot(eav$stable.age, names.arg=age, 
	     horiz=TRUE, 
	     col="grey", 
	     ylab="Age")
barplot(eau$stable.age, names.arg=age[-11], 
	     horiz=TRUE, 
	     col="blue", 
	     ylab="Age", 
	     xlim=c(0,0.2))

par(op)

## Compare reproductive values for Venezuela and the USA

plot(age, eav$repro.value, type="l", xlab="Age", ylab="Reproductive Value")
lines(age[-11], eau$repro.value, lty=2)
legend("topright", c("Venezuela (1965)", "USA (1967)"), lty=c(1,2))




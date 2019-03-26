library(gamlss.tr)


### Name: gen.trun
### Title: Generates a truncated distribution from a gamlss.family
### Aliases: gen.trun
### Keywords: distribution regression

### ** Examples

# generating a t-distribution from 0 to 100  	
gen.trun(par=c(0,100),family="TF", name="0to100", type="both")
op<-par(mfrow=c(2,2))
plot(function(x) dTF0to100(x, mu=80 ,sigma=20, nu=5), 0, 100, ylab="pdf")
plot(function(x) pTF0to100(x, mu=80 ,sigma=20, nu=5), 0, 100, ylab="cdf")
plot(function(x) qTF0to100(x, mu=80 ,sigma=20, nu=5), 0.01, .999, ylab="invcdf")
hist(s1<-rTF0to100(1000, mu=80 ,sigma=20, nu=5), ylab="hist", xlab="x", 
            main="generated data")
par(op)
m1<-histDist(s1, family=TF0to100, xlim=c(0,100))# fitting the data
# using the argumnt varying 
# left part varies right part equal 100
leftPAR <- rPO(100)
gen.trun(par=cbind(leftPAR,rep(100, 100)),family="TF", name="0to100Varying", 
            type="both", varying=TRUE)
YY<- rTF0to100Varying(100, mu=80, sigma=20, nu=5)
m1<-gamlss(YY~1, family=TF0to100Varying)
m1




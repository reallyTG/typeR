library(gamlss.dist)


### Name: LNO
### Title: Log Normal distribution for fitting in GAMLSS
### Aliases: LNO dLNO pLNO qLNO rLNO LOGNO dLOGNO pLOGNO qLOGNO rLOGNO
###   LOGNO2 dLOGNO2 pLOGNO2 qLOGNO2 rLOGNO2
### Keywords: distribution regression

### ** Examples

LOGNO()#  gives information about the default links for the log normal distribution 
LOGNO2()
LNO()# gives information about the default links for the Box Cox distribution 

# plotting the d, p, q, and r functions
op<-par(mfrow=c(2,2))
curve(dLOGNO(x, mu=0), 0, 10)
curve(pLOGNO(x, mu=0), 0, 10)
curve(qLOGNO(x, mu=0), 0, 1)
Y<- rLOGNO(200)
hist(Y)
par(op)

# plotting the d, p, q, and r functions
op<-par(mfrow=c(2,2))
curve(dLOGNO2(x, mu=1), 0, 10)
curve(pLOGNO2(x, mu=1), 0, 10)
curve(qLOGNO2(x, mu=1), 0, 1)
Y<- rLOGNO(200)
hist(Y)
par(op)

# library(gamlss)
# data(abdom)
# h1<-gamlss(y~cs(x), family=LOGNO, data=abdom)#fits the log-Normal distribution  
# h2<-gamlss(y~cs(x), family=LNO, data=abdom)  #should be identical to the one above   
# to change to square root transformation, i.e. fix nu=0.5 
# h3<-gamlss(y~cs(x), family=LNO, data=abdom, nu.fix=TRUE, nu.start=0.5)




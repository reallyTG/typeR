library(riv)


### Name: riv
### Title: Robust instrumental variables estimator
### Aliases: riv
### Keywords: robust multivariate

### ** Examples


## load data earthquake: the first column contains the response (Y), the
## second the endogenous variable (X) and the third column is the
## instrument (W).
data(earthquake) 
riv.eq <- riv(earthquake$Y,earthquake$X,NULL,earthquake$W)

## plot of the RIV estimates and the outlying observations are
## identified by filled points
plot(earthquake$X,earthquake$Y,xlab="X",ylab="Y",cex=1.5)
abline(riv.eq$Summary.Table[,1])
outliers <- which(sqrt(riv.eq$MD)>sqrt(qchisq(0.99, 3)))
text(earthquake[outliers,2],
     earthquake[outliers,1],
     outliers,
     pos=c(4,4,4,2))
     
points(earthquake[outliers,2],
       earthquake[outliers,1],
       cex=1.5,pch=19)

## Weights given by RIV to each observation as a function of the square
## root of the Mahalanobis distances (d) of each observation to the
## multivariate location and covariance S-estimator (computed with
## CovSest in rrcov)
plot(sqrt(riv.eq$MD),riv.eq$weight,xlab="d",ylab="RIV's Weights",cex = 1.5)
abline(h=sqrt(qchisq(0.99, 3)))
text(sqrt(riv.eq$MD)[outliers],
     riv.eq$weight[outliers],
     outliers,
     pos=c(2, 1, 1, 4))
points(sqrt(riv.eq$MD)[outliers],
       riv.eq$weight[outliers],
       cex=1.5, pch=19)


## load data mortality
data(mortality) 
Y <- as.matrix(mortality[,1])            ## M070
Xex <- as.matrix(mortality[,c(2,3,5,6)]) ## MAGE,CI68,DENS,NONW 
Xend <- as.matrix(mortality[,4])         ## MDOC  
colnames(Xend) <- colnames(mortality)[4] 
Zinst <- as.matrix(mortality[,7:8])      ## EDUC,IN69

## Classical instrumental variables estimator
riv(Y, Xend, Xex, Zinst, method="classical")




library(ODS)


### Name: odsmle
### Title: MSELE estimator for analyzing the primary outcome in ODS design
### Aliases: odsmle

### ** Examples

library(ODS)
# take the example data from the ODS package
# please see the documentation for details about the data set ods_data

Y <- ods_data[,1]
X <- cbind(rep(1,length(Y)), ods_data[,2:5])

# use the simple random sample to get an initial estimate of beta, sig #
# perform an ordinary least squares #
SRS <- ods_data[1:200,]
OLS.srs <- lm(SRS[,1] ~ SRS[,2:5])
OLS.srs.summary <- summary(OLS.srs)

beta <- coefficients(OLS.srs)
sig <- OLS.srs.summary$sigma^2
pis <- c(0.1,0.8,0.1)

# the cut points for this data is Y < 0.162, Y > 2.59.
a <- c(0.162,2.59)
rs.size <- 200
size <- c(100,0,100)
strat <- c(1,2,3)

odsmle(Y,X,beta,sig,pis,a,rs.size,size,strat)




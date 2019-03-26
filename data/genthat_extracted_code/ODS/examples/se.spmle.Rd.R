library(ODS)


### Name: se.spmle
### Title: standard error for MSELE estimator
### Aliases: se.spmle

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

# obtain the parameter estimates
ODS.model = odsmle(Y,X,beta,sig,pis,a,rs.size,size,strat)

# calculate the standard error estimate
y <- Y
x <- X
beta <- ODS.model$beta
sig <- ODS.model$sig
pis <- ODS.model$pis
a <- c(0.162,2.59)
N.edf <- rs.size
rhos <- size/pis
strat <- c(1,3)
size.nc <- length(y)

se = se.spmle(y, x, beta, sig, pis, a, N.edf, rhos, strat, size.nc)

# summarize the result
ODS.tvalue <- ODS.model$beta / se
ODS.pvalue <- 2 * pt( - abs(ODS.tvalue), sum(rs.size, size)-2)

ODS.results <- cbind(ODS.model$beta, se, ODS.tvalue, ODS.pvalue)
dimnames(ODS.results)[[2]] <- c("Beta","SEbeta","tvalue","Pr(>|t|)")
row.names(ODS.results) <- c("(Intercept)","X","Z1","Z2","Z3")

ODS.results




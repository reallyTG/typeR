## ----setup, include = FALSE----------------------------------------------
# rmarkdown::html_vignette:
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(knitr)
library(ocp)

## ------------------------------------------------------------------------
 # the true changepoint locations including the first and last point
truecps<- c(1, 51, 71, 121)
#simulate the data
set.seed(1)
uvg<- c(rnorm(n=diff(truecps)[1], mean=0, sd=2), 
        rnorm(n=diff(truecps)[2], mean=20, sd=4),
        rnorm(n=diff(truecps)[3], mean=10, sd=3))

# view the data
plot(uvg, main = "Simulated Univariate Gaussian Data with Changepoints", 
     ylab = "data values", xlab="time point", type= "l", col = "black", cex=0.5)
# show the changepoints on the graph
for(cp in truecps){
  abline(v=cp, col = "green", lwd= 2)
}

## ------------------------------------------------------------------------
# running the basic function with all the default settings
ocpd1<- onlineCPD(uvg) 

# view results
ocpd1

## ------------------------------------------------------------------------
cpdf<- data.frame(method=names(ocpd1$changepoint_lists))
cpdf$changepoints<- unlist(ocpd1$changepoint_lists, recursive = FALSE)
kable(cpdf)

## ------------------------------------------------------------------------
# slowest mode: saving R matrix and optional outputs, no truncation
ocpd2<- onlineCPD(uvg, getR=TRUE, optionalOutputs = TRUE,
                  hazard_func=function(x, lambda){const_hazard(x, lambda=100)})

# plot the results, the R matrix will be visible
plot(ocpd2, cplistID = 3)


## ------------------------------------------------------------------------
# faster mode: not saving R matrix, with optional outputs, with truncation based on probability
ocpd3<- onlineCPD(uvg, getR=FALSE, optionalOutputs = TRUE, truncRlim = 10^(-4),
                  hazard_func=function(x, lambda){const_hazard(x, lambda=100)})

# plot the results, the R matrix will not be visible
plot(ocpd3, cplistID = 3)


## ------------------------------------------------------------------------
# faster mode: not saving R matrix, without optional outputs, with truncation based on length
ocpd4<- onlineCPD(uvg, getR=FALSE, optionalOutputs = FALSE, maxRlength = 200,
                  hazard_func=function(x, lambda){const_hazard(x, lambda=100)})

# plot the results, the R matrix will not be visible,
# also the data will not be visible, because its stored in optional outputs
plot(ocpd4, cplistID = 3)


## ------------------------------------------------------------------------
# truncating with min and max length, and probability threshold
ocpd5<- onlineCPD(uvg, getR=FALSE, optionalOutputs = FALSE, 
                  maxRlength = 100, minRlength = 2, truncRlim = 10^(-2),
                  hazard_func=function(x, lambda){const_hazard(x, lambda=100)})

# plot the results, the R matrix will not be visible,
# also the data will not be visible, because its stored in optional outputs
plot(ocpd5, cplistID = 3)

## ------------------------------------------------------------------------
# example with gaussian
ocpd6<- onlineCPD(uvg, getR=FALSE, optionalOutputs = FALSE, 
                  probModel=list("gaussian"), init_params=list(list(m=0, k=0.01, a=0.01, b=0.0001)),
                  hazard_func=function(x, lambda){const_hazard(x, lambda=100)})
#note: probModel=list("g") also works

# plot the results, the R matrix will not be visible,
# also the data will not be visible, because its stored in optional outputs
plot(ocpd6, cplistID = 3)

## ------------------------------------------------------------------------
mvg<- matrix(ncol = 2, nrow = length(uvg))
mvg[,1]<-uvg
mvg[,2]<-uvg*3
# example with gaussian multivariate, set: multivariate = TRUE
ocpd6<- onlineCPD(mvg, getR=FALSE, optionalOutputs = FALSE, multivariate = TRUE,
                  probModel=list("g"), # note: can input one specification of probability model if is the same for every dimension
                  init_params=list(list(m=0, k=0.01, a=0.01, b=0.0001)),
                  hazard_func=function(x, lambda){const_hazard(x, lambda=100)})
#note: probModel=list("g") also works

# plot the results, the R matrix will not be visible,
# also the data will be visible, because its being input manually as data=mvg
plot(ocpd6, data=mvg, cplistID = 3)

## ------------------------------------------------------------------------
# example with poisson

# sim poisson data:
truecps<- c(1, 51, 71, 121)
#simulate the data
set.seed(1)
uvp<- c(rpois(n=diff(truecps)[1], lambda = 1), 
        rpois(n=diff(truecps)[2], lambda =20),
        rpois(n=diff(truecps)[3], lambda =10))

ocpd7<- onlineCPD(uvp, getR=FALSE, optionalOutputs = FALSE, 
                  probModel=list("p"), init_params=list(list(a=1, b=1)),
                  hazard_func=function(x, lambda){const_hazard(x, lambda=100)})

# plot the results, the R matrix will not be visible,
# also the data willbe visible, because its being input manually as data=uvp
plot(ocpd7, data=uvp, cplistID = 3)

## ------------------------------------------------------------------------
mvgp<- matrix(ncol = 3, nrow = length(uvg))
mvgp[,1]<-uvg
mvgp[,2]<-uvg*3
mvgp[,3]<-uvp
# example with gaussian multivariate, set: multivariate = TRUE
ocpd6<- onlineCPD(mvgp, getR=FALSE, optionalOutputs = FALSE, multivariate = TRUE,
                  probModel=list("g", "g", "p"), 
                  init_params=list(list(m=0, k=0.01, a=0.01, b=0.0001), list(m=0, k=0.01, a=0.01, b=0.0001), list(a=1, b=1)),
                  hazard_func=function(x, lambda){const_hazard(x, lambda=100)})

# plot the results, the R matrix will not be visible,
# also the data will be visible, because its being input manually as data=mvgp
plot(ocpd6, data=mvgp, cplistID = 3)


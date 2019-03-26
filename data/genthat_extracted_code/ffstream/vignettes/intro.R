## ----include = FALSE-----------------------------------------------------
#need to make vignette compile
library(Rcpp)
library(ffstream)

## ------------------------------------------------------------------------
library(ffstream)
result <- demo_ffstream(showPlot=TRUE, plotSmall=TRUE) #'plotSmall' only needed for vignette

## ------------------------------------------------------------------------
print(result)

## ---- message=FALSE------------------------------------------------------
result <- demo_ffstream(returnStream=TRUE)

## ------------------------------------------------------------------------
#a simple stream with changepoints at tau=100, 200, 300
set.seed(5)
x <- rnorm(400, 0, 1) + rep(c(0:3), each=100)

#use the AFF method to detect changepoints in this stream
library(ffstream)
result <- detectAFFMean(x)
print(result)

## ------------------------------------------------------------------------
library(ffstream)

# initialise an AFF change detector with alpha=0.01, eta=0.001 and burn-in length 30
affcd <- initAFFMeanCD(alpha=0.01, eta=0.001, BL=30)

# initialise a FFF change detector with lambda=0.99, alpha=0.05, and burn-in length 50
fffcd <- initFFFMeanCD(lambda=0.99, alpha=0.05, BL=50)

# initialise a CUSUM change detector with h=0.50, k=4.77, and burn-in length 70
cusumcd <- initCUSUMMeanCD(h=0.50, k=4.77, BL=70)

# initialise a EWMA change detector with r=0.25, L=3.023, and burn-in length 50
ewmacd <- initEWMAMeanCD(r=0.25, L=3.023, BL=50)

## ------------------------------------------------------------------------
#generate an observation
x <- rnorm(1, mean=0, sd=1)

#update the detector
affcd$update(x)

#generate another observation
x <- rnorm(1, mean=0, sd=1)

#update the detector
affcd$update(x)

#etc...

## ------------------------------------------------------------------------
#generate a simple stream - same as in the 'Quick start' example above
set.seed(5)
x <- rnorm(400, 0, 1) + rep(c(0:3), each=100)

#initialise a new aff change detector object
affcd2 <- initAFFMeanCD(alpha=0.01, eta=0.01, BL=50)

index <- 0
for (obs in x){
    affcd2$update(obs)

    index <- index + 1
    if (affcd2$changeDetected)
        cat("change detected at observation: ", index, "\n", sep="")
}

## ------------------------------------------------------------------------
#generate a simple stream - same as in the 'Quick start' example above
set.seed(8)
x <- rnorm(400, 5, 1) + rep(c(0:3), each=100) # mean is 5 and s.d. is 1

#multiple changepoints
list_aff <- detectAFFMean(x, alpha=0.01, eta=0.01, BL=50, multiple=TRUE)

#now only a single (the first) changepoint
list_aff2 <- detectAFFMean(x, alpha=0.01, eta=0.01, BL=50, single=TRUE)

#now only a single (the first) changepoint, but with the prechange mean and variance known
list_aff3 <- detectAFFMean(x, alpha=0.01, eta=0.01, single=TRUE, prechangeMean=5, prechangeSigma=1)


#similar for FFF, CUSUM and EWMA:
list_fff <- detectFFFMean(x, alpha=0.01, lambda=0.95, BL=50, multiple=TRUE)
list_cusum <- detectCUSUMMean(x, k=0.25, h=8.00, BL=50, multiple=TRUE)
list_ewma <- detectEWMAMean(x, r=0.25, L=3.023, BL=50, multiple=TRUE)

resultsList <- list("aff"=list_aff$tauhat, "fff"=list_fff$tauhat, 
                    "cusum"=list_cusum$tauhat, "ewma"=list_ewma$tauhat,  
                    "aff_single"=list_aff2$tauhat, "aff_single_prechange"=list_aff3$tauhat)

print(resultsList)


## ------------------------------------------------------------------------
#generate a simple stream - same as in the 'Quick start' example above
set.seed(5)
x <- rnorm(400, 5, 3) + rep(c(0:3), each=100) # mean is 5 and s.d. is 3

#initialise a new aff change detector object
affcd3 <- initAFFMeanCD(alpha=0.01, eta=0.01, BL=50)

affcd3$streamEstMean <- 5
affcd3$streamEstSigma<- 3

#list containing tauhat, the estimated changepoints
returnList <- affcd3$processVectorSave(x)

## ---- message=FALSE------------------------------------------------------
#initialise an AFF mean estimator
aff <- initAFFMean(eta=0.01) #it is not necessary to specify eta

#update sequentially
obs <- rnorm(1)
aff$update(obs)

#update with a vector
vec <- rnorm(20)
aff$processVector(vec)

#in order to get the value of the aff back:
aff <- initAFFMean(eta=0.01) #reset first
thelist <- aff$processVectorSave(vec)
lambda <- thelist$lambda

#initialise an FFF mean estimator
fff <- initFFFMean(lambda=0.95) #specify lambda, otherwise default is lambda=1, no forgetting
fff$processVector(vec)

## ---- message=FALSE------------------------------------------------------
aff <- initAFFMean(eta=0.01) 

#create a stream
set.seed(7)
x <- rnorm(200) + rep(c(0, 2), each=100)

#lambda
thelist <- aff$processVectorSave(x)

titlestr <- "AFF before and after \na changepoint"
plot(thelist$lambda, type='l', col="black", xlab="Observation", ylab="lambda", main=titlestr)
abline(v=100, col="red", lty="dotted", lwd=2)


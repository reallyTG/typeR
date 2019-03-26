library(STAR)


### Name: summary.CountingProcessSamplePath
### Title: Create and Explore Counting Process Sample Path Summaries
### Aliases: summary.CountingProcessSamplePath
###   print.CountingProcessSamplePath.summary
###   plot.CountingProcessSamplePath.summary
### Keywords: distribution ts survival htest

### ** Examples

## Not run: 
##D ## load one spike train data set of STAR
##D data(e060824spont)
##D ## Create the CountingProcessSamplePath object
##D n1spt.cp <- as.CPSP(e060824spont[["neuron 1"]])
##D ## print it
##D n1spt.cp
##D ## plot it
##D plot(n1spt.cp)
##D ## get the summary
##D ## Notice the warning due to few identical interspike intervals
##D ## leading to an inaccurate Berman's test.
##D summary(n1spt.cp)
##D 
##D ## Simulate data corresponding to a renewal process with
##D ## an inverse Gaussian ISI distribution in the spontaneous
##D ## regime modulated by a multiplicative stimulus whose time
##D ## course is a shifted and scaled chi2 density.
##D ## Define the "stimulus" function
##D stimulus <- function(t,
##D                      df=5,
##D                      tonset=5,
##D                      timeFactor=5,
##D                      peakFactor=10) {
##D   dchisq((t-tonset)*timeFactor,df=df)*peakFactor
##D }
##D ## Define the conditional intensity / hazard function
##D hFct <- function(t,
##D                  tlast,
##D                  df=5,
##D                  tonset=5,
##D                  timeFactor=5,
##D                  peakFactor=10,
##D                  mu=0.075,
##D                  sigma2=3
##D                  ) {
##D   
##D   hinvgauss(t-tlast,mu=mu,sigma2=sigma2)*exp(stimulus(t,df,tonset,timeFactor,peakFactor))
##D 
##D }
##D ## define the function simulating the train with the thinning method                   
##D makeTrain <- function(tstop=10,
##D                       peakCI=200,
##D                       preTime=5,
##D                       df=5,
##D                       tonset=5,
##D                       timeFactor=5,
##D                       peakFactor=10,
##D                       mu=0.075,
##D                       sigma2=3) {
##D 
##D   result <- numeric(500) - preTime - .Machine$double.eps
##D   result.n <- 500
##D   result[1] <- 0
##D   idx <- 1
##D   currentTime <- result[1]
##D   while (currentTime < tstop+preTime) {
##D     currentTime <- currentTime+rexp(1,peakCI)
##D     p <- hFct(currentTime,
##D               result[idx],
##D               df=df,
##D               tonset=tonset+preTime,
##D               timeFactor=timeFactor,
##D               peakFactor=peakFactor,
##D               mu=mu,
##D               sigma2=sigma2)/peakCI
##D     rthreshold <- runif(1)
##D     if (p>1) stop("Wrong peakCI")
##D     while(p < rthreshold) {
##D       currentTime <- currentTime+rexp(1,peakCI)
##D       p <- hFct(currentTime,
##D                 result[idx],
##D                 df=df,
##D                 tonset=tonset+preTime,
##D                 timeFactor=timeFactor,
##D                 peakFactor=peakFactor,
##D                 mu=mu,
##D                 sigma2=sigma2)/peakCI
##D       if (p>1) stop("Wrong peakCI")
##D       rthreshold <- runif(1)
##D     }
##D     idx <- idx+1
##D     if (idx > result.n) {
##D       result <- c(result,numeric(500)) - preTime - .Machine$double.eps
##D       result.n <- result.n + 500
##D     }
##D     result[idx] <- currentTime
##D   }
##D 
##D   result[preTime < result & result <= tstop+preTime] - preTime
##D   
##D }
##D ## set the seed
##D set.seed(20061001)
##D ## "make" the train
##D t1 <- makeTrain()
##D ## create the corresponding CountingProcessSamplePath
##D ## object
##D cpsp1 <- mkCPSP(t1)
##D ## print it
##D cpsp1
##D ## test it
##D cpsp1.summary <- summary(cpsp1)
##D cpsp1.summary
##D plot(cpsp1.summary)
##D ## Define a function returning the conditional intensity function (cif)
##D ciFct <- function(t,
##D                   tlast,
##D                   df=5,
##D                   tonset=5,
##D                   timeFactor=5,
##D                   peakFactor=10,
##D                   mu=0.075,
##D                   sigma2=3
##D                   ) {
##D 
##D   sapply(t, function(x) {
##D     if (x <= tlast[1]) return(1/mu)
##D     y <- x-max(tlast[tlast<x])
##D     hinvgauss(y,mu=mu,sigma2=sigma2)*exp(stimulus(x,df,tonset,timeFactor,peakFactor))
##D   }
##D          )
##D 
##D }
##D ## Compute the cif of the train
##D tt <- seq(0,10,0.001)
##D lambda.true <- ciFct(tt,cpsp1$ppspFct())
##D ## plot it together with the events times
##D ## Notice that the representation is somewhat inaccurate, the cif
##D ## is in fact a left continuous function
##D plot(tt,lambda.true,type="l",col=2)
##D rug(cpsp1$ppspFct())
##D ## plot the integrated intensity function and the counting process
##D plot(tt,cumsum(lambda.true)*0.001,type="l",col=2)
##D lines(cpsp1)
##D ## define a function doing the time transformation / rescaling
##D ## by integrating the cif and returning another CountingProcessSamplePath
##D transformCPSP <- function(cpsp,
##D                           ciFct,
##D                           CIFct,
##D                           method=c("integrate","discrete"),
##D                           subdivisions=100,
##D                           ...
##D                           ) {
##D 
##D   if (!inherits(cpsp,"CountingProcessSamplePath"))
##D     stop("cpsp should be a CountingProcessSamplePath objet")
##D   st <- cpsp$ppspFct()
##D   n <- length(st)
##D   from <- cpsp$from
##D   to <- cpsp$to
##D   if (missing(CIFct)) {
##D     if (method[1] == "integrate") {
##D       lwr <- c(from,st)
##D       upr <- c(st,to)
##D       Lambda <- sapply(1:(n+1),
##D                        function(idx)
##D                        integrate(ciFct,
##D                                  lower=lwr[idx],
##D                                  upper=upr[idx],
##D                                  subdivisions=subdivisions,
##D                                  ...)$value
##D                        )
##D       Lambda <- cumsum(Lambda)
##D       st <- Lambda[1:n]
##D       from <- 0
##D       to <- Lambda[n+1]
##D     } ## End of conditional on method[1] == "integrate"
##D     if (method[1] == "discrete") {
##D       lwr <- c(from,st)
##D       upr <- c(st,to)
##D       xx <- unlist(lapply(1:(n+1),
##D                           function(idx) seq(lwr[idx],
##D                                             upr[idx],
##D                                             length.out=subdivisions)
##D                           )
##D                    )
##D       Lambda <- cumsum(ciFct(xx[-length(xx)])*diff(xx))
##D       Lambda <- Lambda - Lambda[1]
##D       st <- Lambda[(1:n)*subdivisions]
##D       from <- 0
##D       to <- Lambda[length(Lambda)]
##D     } ## End of conditional on method[1] == "discrete"
##D   } else {
##D     result <- CIFct(c(from,st,to))
##D     result <- result-result[1]
##D     from <- result[1]
##D     to <- result[n+2]
##D     st <- result[2:(n+1)]
##D   } ## End of conditional on missing(CIFct)
##D   mkCPSP(st,from,to)
##D }
##D ## transform cpsp1
##D cpsp1t <- transformCPSP(cpsp1,function(t) ciFct(t,cpsp1$ppspFct()))
##D ## test it
##D cpsp1t.summary <- summary(cpsp1t)
##D cpsp1t.summary
##D plot(cpsp1t.summary)
##D ## compare the finite sample performances of the
##D ## Kolmogorov test (test the uniformity of the
##D ## jump times given the number of events) with the
##D ## ones of the new "Wiener process test"
##D empiricalCovProb <- function(myRates=c(10,(1:8)*25,(5:10)*50,(6:10)*100),
##D                              nbRep=1000,
##D                              exact=NULL
##D                              ) {
##D 
##D   b95 <- function(t) 0.299944595870772 + 2.34797018726827*sqrt(t)
##D   b99 <- function(t) 0.313071417065285 + 2.88963206734397*sqrt(t)
##D   result <- matrix(numeric(4*length(myRates)),nrow=4)
##D   colnames(result) <- paste(myRates)
##D   rownames(result) <- c("ks95","ks99","wp95","wp99")
##D   for (i in 1:length(myRates)) {
##D     rate <- myRates[i]
##D     partial <- sapply(1:nbRep,
##D                       function(repIdx) {
##D                         st <- cumsum(rexp(5*rate,rate))
##D                         while(max(st) < 1) st <- c(st,max(st)+cumsum(rexp(5*rate,rate)))
##D                         st <- st[st<=1]
##D                         ks <- ks.test(st,punif,exact=exact)$p.value
##D                         w <- (st*rate-seq(st))/sqrt(rate)
##D                         c(ks95=0.95 < ks,
##D                           ks99=0.99 < ks,
##D                           wp95=any(w < -b95(st) | b95(st) < w),
##D                           wp99=any(w < -b99(st) | b99(st) < w)
##D                           )
##D                       }
##D                       )
##D     
##D     result[,i] <- apply(partial,1,sum)
##D   }
##D  
##D   attr(result,"nbRep") <- nbRep
##D   attr(result,"myRates") <- myRates
##D   attr(result,"call") <- match.call()
##D   result/nbRep
##D   
##D }
##D 
##D plotCovProb <- function(covprob,ci=0.95) {
##D 
##D   nbMax <- max(attr(covprob,"myRates"))
##D   plot(c(0,nbMax),c(0.94,1),
##D        type="n",
##D        xlab="Expected number of Spikes",
##D        ylab="Empirical cov. prob.",xaxs="i",yaxs="i")
##D   nbRep <- attr(covprob,"nbRep")
##D   polygon(c(0,nbMax,nbMax,0),
##D           c(rep(qbinom((1-ci)/2,nbRep,0.95)/nbRep,2),rep(qbinom(1-(1-ci)/2,nbRep,0.95)/nbRep,2)),
##D           col="grey50",border=NA)
##D   polygon(c(0,nbMax,nbMax,0),
##D           c(rep(qbinom((1-ci)/2,nbRep,0.99)/nbRep,2),rep(qbinom(1-(1-ci)/2,nbRep,0.99)/nbRep,2)),
##D           col="grey50",border=NA)
##D   nbS <- attr(covprob,"myRates")
##D   points(nbS,1-covprob[1,],pch=3)
##D   points(nbS,1-covprob[2,],pch=3)
##D   points(nbS,1-covprob[3,],pch=1)
##D   points(nbS,1-covprob[4,],pch=1)
##D 
##D }
##D system.time(covprobA <- empiricalCovProb())
##D plotCovProb(covprobA)
## End(Not run)




library(STAR)


### Name: mkGLMdf
### Title: Formats (lists of) spikeTrain and repeatedTrain Objects into
###   Data Frame for use in glm, mgcv and gam
### Aliases: mkGLMdf
### Keywords: ts

### ** Examples

## Not run: 
##D ## Analysis of a "simple" spontaneous train
##D ## load the data
##D data(e060824spont)
##D ## create a data frame using the 1st neuron
##D DFA <- subset(mkGLMdf(e060824spont,0.004,0,59),neuron==1)
##D ## Add the previous ISI to the data frame
##D DFA <- within(DFA,i1 <- isi(DFA,lag=1))
##D DFA <- DFA[complete.cases(DFA),]
##D ## estimate the "map to uniform" functions for 2 variables:
##D ## 1) the elapsed time since the last spike (lN.1)
##D ## 2) the previous insterspike interval
##D ## Do this estimation on the first half of the set
##D m2u1 <- mkM2U(DFA,"lN.1",0,29)
##D m2ui <- mkM2U(DFA,"i1",0,29,maxiter=200)
##D ## create "mapped" variables
##D DFA <- within(DFA,e1t <- m2u1(lN.1))
##D DFA <- within(DFA,i1t <- m2ui(i1))
##D ## split the data in 2 parts, one for the fit, the other for the test
##D DFAe <- subset(DFA, time <= 29)
##D DFAl <- subset(DFA, time > 29)
##D ## fit an additive model with gssanova
##D m1.fit <- gssanova(event ~ e1t + i1t,
##D                    data = DFAe,
##D                    family="binomial",
##D                    seed=20061001)
##D ## test the model by "time transforming" the late part
##D tt.l <- m1.fit %tt% DFAl
##D tt.l.summary <- summary(tt.l)
##D tt.l.summary
##D plot(tt.l.summary,which=c(1,2,4,6))
##D 
##D ## Start with simulatd data #####
##D ## Use thinning method and for that define a couple
##D ## of functions
##D 
##D ## expDecay gives an exponentially decaying
##D ## synaptic effect followin a presynpatic spike.
##D ## All the pre-synaptic spikes between "now" (argument
##D ## t) and the previous spike of the post-synaptic
##D ## neuron have an effect (and the summation is linear)
##D expDecay <- function(t,preT,last,
##D                      delay=0.002,tau=0.015) {
##D   
##D   if (missing(last)) good <- (preT+delay) < t
##D   else good <- last < preT & (preT+delay) < t
##D   if (sum(good) == 0) return(0)
##D   preS <- preT[good]
##D   preS <- t-preS-delay
##D   sum(exp(-preS/tau))
##D 
##D }
##D 
##D ## Same as expDecay except that the effect is pusle like
##D pulseFF <- function(t,preT,last,
##D                     delay=0.005,duration=0.01) {
##D   if (missing(last)) good <- t-duration < (preT+delay) & (preT+delay) < t
##D   else good <- t-duration < (preT+delay) & last < preT & (preT+delay) < t
##D   sum(good)
##D }
##D 
##D ## The work horse. Given a pre-synaptic train (preT),
##D ## a duration, lognormal parameters and a presynaptic
##D ## effect fucntion, mkPostTrain simulates a log-linear
##D ## post-synaptic train using the thinning method
##D mkPostTrain <- function(preT,
##D                         duration=60,
##D                         meanlog=-2.4,
##D                         sdlog=0.4,
##D                         preFF=expDecay,
##D                         beta=log(5),
##D                         maxCI=30,
##D                         ...) {
##D 
##D   nuRest <- exp(-meanlog-0.5*sdlog^2)
##D   poissonRest <- nuRest*ifelse(beta>0,exp(beta),1)
##D   ciRest <- function(t) nuRest*exp(beta*preFF(t,preT,...))
##D 
##D   poissonNext <- maxCI*ifelse(beta>0,exp(beta),1)
##D   ci <- function(t,tLast) hlnorm(t-tLast,meanlog,sdlog)*exp(beta*preFF(t,preT,tLast,...))
##D 
##D   vLength <- poissonRest*300
##D   result <- numeric(vLength)
##D   currentTime <- 0
##D   lastTime <- 0
##D   eventIdx <- 1
##D 
##D   nextTime <- function(currentTime,lastTime) {
##D     if (currentTime > 0) {
##D       currentTime <- currentTime + rexp(1,poissonNext)
##D       ciRatio <- ci(currentTime,lastTime)/poissonNext
##D       if (ciRatio > 1) stop("Problem with thinning.")
##D       while (runif(1) > ciRatio) {
##D         currentTime <- currentTime + rexp(1,poissonNext)
##D         ciRatio <- ci(currentTime,lastTime)/poissonNext
##D         if (ciRatio > 1) stop("Problem with thinning.")
##D       }
##D     } else {
##D       currentTime <- currentTime + rexp(1,poissonRest)
##D       ciRatio <- ciRest(currentTime)/poissonRest
##D       if (ciRatio > 1) stop("Problem with thinning.")
##D       while (runif(1) > ciRatio) {
##D         currentTime <- currentTime + rexp(1,poissonRest)
##D         ciRatio <- ciRest(currentTime)/poissonRest
##D         if (ciRatio > 1) stop("Problem with thinning.")
##D       }
##D     }
##D     currentTime
##D   }
##D 
##D   while(currentTime <= duration) {
##D     currentTime <- nextTime(currentTime,lastTime)
##D     result[eventIdx] <- currentTime
##D     lastTime <- currentTime
##D     eventIdx <- eventIdx+1
##D     if (eventIdx > vLength) {
##D       result <- c(result,numeric(vLength))
##D       vLength <- length(result)
##D     }
##D   }
##D   result[result > 0]
##D   
##D }
##D 
##D ## set the rng seed
##D set.seed(11006,"Mersenne-Twister")
##D ## generate a log-normal pre train
##D preTrain <- cumsum(rlnorm(1000,-2.4,0.4))
##D preTrain <- preTrain[preTrain < 60]
##D ## generate a post synaptic train with an
##D ## exponentially decaying pre-synaptic excitation
##D post1 <- mkPostTrain(preTrain)
##D ## generate a post synaptic train with a
##D ## pulse-like pre-synaptic excitation
##D post2 <- mkPostTrain(preTrain,preFF=pulseFF)
##D ## generate a post synaptic train with a
##D ## pulse-like pre-synaptic inhibition
##D post3 <- mkPostTrain(preTrain,preFF=pulseFF,beta=-log(5))
##D ## make a list of spikeTrain objects out of that
##D interData <- list(pre=as.spikeTrain(preTrain),
##D                   post1=as.spikeTrain(post1),
##D                   post2=as.spikeTrain(post2),
##D                   post3=as.spikeTrain(post3))
##D ## remove the trains
##D rm(preTrain,post1,post2,post3)
##D ## look at them
##D interData[["pre"]]
##D interData[["post1"]]
##D interData[["post2"]]
##D interData[["post3"]]
##D ## compute cross-correlograms
##D interData.lt1 <- lockedTrain(interData[["pre"]],interData[["post1"]],laglim=c(-0.03,0.05),c(0,60))
##D interData.lt2 <- lockedTrain(interData[["pre"]],interData[["post2"]],laglim=c(-0.03,0.05),c(0,60))
##D interData.lt3 <- lockedTrain(interData[["pre"]],interData[["post3"]],laglim=c(-0.03,0.05),c(0,60))
##D ## look at the cross-raster plots
##D interData.lt1
##D interData.lt2
##D interData.lt3
##D ## look at the corresponding histograms
##D hist(interData.lt1,bw=0.0025)
##D hist(interData.lt2,bw=0.0025)
##D hist(interData.lt3,bw=0.0025)
##D ## check out what goes on between post2 and post1
##D interData.lt1v2 <- lockedTrain(interData[["post2"]],interData[["post1"]],laglim=c(-0.03,0.05),c(0,60))
##D interData.lt1v2
##D hist(interData.lt1v2,bw=0.0025)
##D 
##D ## fine
##D ## create a GLM data frame using a 1 ms bin width
##D dfAll <- mkGLMdf(interData,delta=0.001,lwr=0,upr=60)
##D ## build the sub-list relating to neuron 2
##D dfN2 <- dfAll[dfAll$neuron=="2",]
##D ## fit dfN2 with a smooth effect for the elasped time since the last
##D ## event of neuron 2 and another one with the elasped time since the
##D ## last event from neuron 1. Use moroever only the events for which the
##D ## the last event from neuron 1 occurred at most 100 ms ago.
##D dfN2.fit0 <- gam(event ~ s(lN.1,bs="cr") + s(lN.2,bs="cr"), data=dfN2, family=poisson, subset=(dfN2$lN.1 <=0.1))
##D ## look at the summary
##D summary(dfN2.fit0)
##D ## plot the smooth term of neuron 1
##D plot(dfN2.fit0,select=1,rug=FALSE,ylim=c(-0.8,0.8))
##D ## Can you see the exponential presynatic effect with
##D ## a 15 ms decay time appearing?
##D ## Now check the dependence on lN.2
##D xx <- seq(0.001,0.3,0.001)
##D ## plot the estimated conditional intensity when the last spike
##D ## from neuron 1 came a long time ago (100 ms)
##D plot(xx,exp(predict(dfN2.fit0,data.frame(lN.1=rep(100,300)*0.001,lN.2=(1:300)*0.001))),type="l")
##D ## add a line for the true conditional intensity
##D lines(xx,hlnorm(xx,-2.4,0.4)*0.001,col=2)
##D ## do the same thing for the survival function
##D plot(xx,exp(-cumsum(exp(predict(dfN2.fit0,data.frame(lN.1=rep(100,300)*0.001,lN.2=(1:300)*0.001))))),type="l")
##D lines(xx,plnorm(xx,-2.4,0.4,lower.tail=FALSE),col=2)
##D 
##D ## use gssanova
##D ## split the data set in 2 parts, one for the fit, the other for the
##D ## test
##D dfN2e <- dfN2[dfN2$time <= 20,]
##D dfN2l <- dfN2[dfN2$time > 20,]
##D ## fit the same model as before with gssanova
##D dfN2.fit1 <- gssanova(event ~ lN.1 + lN.2, data=dfN2e, family="poisson", seed=20061001) 
##D ## plot the effect of neuron 1
##D pred1 <- predict(dfN2.fit1,data.frame(lN.1=seq(0.001,0.220,0.001),
##D                                       lN.2=rep(median(dfN2e$lN.2),220)),
##D                  se=TRUE)
##D plot(seq(0.001,0.220,0.001),
##D      pred1$fit,type="l",
##D      ylim=c(min(pred1$fit-1.96*pred1$se.fit),max(pred1$fit+1.96*pred1$se.fit))
##D     )
##D lines(seq(0.001,0.220,0.001),pred1$fit-1.96*pred1$se.fit,lty=2)
##D lines(seq(0.001,0.220,0.001),pred1$fit+1.96*pred1$se.fit,lty=2)
##D ## transform the time of the late part of the train
##D ## first make sure than lN.1 and lN.2 are within the right bounds
##D m1 <- max(dfN2e$lN.1)
##D m2 <- max(dfN2e$lN.2)
##D dfN2l$lN.1 <- sapply(dfN2l$lN.1, function(x) min(m1,x))
##D dfN2l$lN.2 <- sapply(dfN2l$lN.2, function(x) min(m2,x))
##D predl <- predict(dfN2.fit1,dfN2l)
##D Lambda <- cumsum(exp(predl))
##D ttl <- mkCPSP(Lambda[dfN2l$event==1])
##D ttl
##D plot(summary(ttl))
##D ## see what happens without time transformation
##D rtl <- mkCPSP(dfN2l$time[dfN2l$event==1])
##D plot(summary(rtl))
##D 
##D ## Now repeat the fit including a possible contribution from neuron 3
##D dfN2.fit1 <- gam(event ~ s(lN.1,bs="cr") + s(lN.2,bs="cr") + s(lN.3,bs="cr"), data=dfN2, family=poisson, subset=(dfN2$lN.1 <=0.1) & (dfN2$lN.3 <= 0.1)) 
##D ## Use the summary to see if the new element brings something
##D summary(dfN2.fit1)
##D ## It does not!
##D ## Now look at neurons 3 and 4 (ie, post2 and post3)
##D dfN3 <- dfAll[dfAll$neuron=="3",]
##D dfN3.fit0 <- gam(event ~ s(lN.1,k=20,bs="cr") + s(lN.3,k=15,bs="cr"),data=dfN3,family=poisson, subset=(dfN3$lN.1 <=0.1))
##D summary(dfN3.fit0)
##D plot(dfN3.fit0,select=1,ylim=c(-1.5,1.8),rug=FALSE)
##D dfN4 <- dfAll[dfAll$neuron=="4",]
##D dfN4.fit0 <- gam(event ~ s(lN.1,k=20,bs="cr") + s(lN.4,k=15,bs="cr"),data=dfN4,family=poisson, subset=(dfN4$lN.1 <=0.1))
##D summary(dfN4.fit0)
##D plot(dfN4.fit0,select=1,ylim=c(-1.8,1.5),rug=FALSE)
## End(Not run)




library(STAR)


### Name: thinProcess
### Title: Simulate and Analyse Data From a Model Fitted With gss
### Aliases: thinProcess maxIntensity mkSelf mkMappedI mkSimFct
###   mkPostSimAnalysis
### Keywords: ts htest datagen

### ** Examples

## Not run: 
##D ## The run times given in the sequel were measured on a laptop
##D ## with a dual core CPU: 2x Intel Core 2 Duo CPU P9500 @ 2.53GHz
##D ## The RAM was 4 GB large. The PC ran Ubuntu 9.04 and R-2.9.2
##D ## compiled with a dynamically link ATLAS version of BLAS.
##D 
##D ## Start by loading the data set into the work space.
##D data(e060824spont)
##D ## Get a summary of neuron 1 spike train. 
##D summary(e060824spont[["neuron 1"]])
##D ## Run an automatic analysis of the train (takes ~ 4.22 s)
##D reportHTML(e060824spont[["neuron 1"]],filename="e060824spont_1",otherST=e060824spont[c(2)],maxiter=100)
##D ## The renewal tests show that the discharge is not the one of
##D ## a renewal process. The cross-correlogram shows no sign of
##D ## coupling between the two neurons of the data set.
##D 
##D ## Compute the partial autocorrelation function to get an idea
##D ## of how many previous interspike intervals (ISIs) should be
##D ## included in the model.
##D acf(diff(e060824spont[["neuron 1"]]),type="partial")
##D ## The pacf plot suggests that the last ISI should be enough.
##D ## Build the data frame.
##D DFA <- mkGLMdf(e060824spont[["neuron 1"]],0.004,0,59)
##D DFA <- within(DFA,i1 <- isi(DFA,lag=1))
##D DFA <- DFA[complete.cases(DFA),]
##D 
##D ## look a the ECDF of the elapsed time since the last spike,
##D ## that is, variable lN.1 of the data frame and of the last
##D ## ISI (variable i1 of the data frame).
##D layout(matrix(1:2,nc=2))
##D with(DFA,plot(ecdf(lN.1),pch="."))
##D with(DFA,lines(range(lN.1),c(0,1),col=2,lty=2))
##D with(DFA,plot(ecdf(i1),pch="."))
##D with(DFA,lines(range(i1),c(0,1),col=2,lty=2))
##D ## The distributions of these varaibles are clearly (and not
##D ## surprisingly) non-uniform.
##D 
##D ## Build emprirical functions mapping the two variables to uniform
##D ## ones
##D m2u1 <- mkM2U(DFA,"lN.1",0,28.5)
##D m2ui <- mkM2U(DFA,"i1",0,28.5,maxiter=200)
##D DFA <- within(DFA,e1t <- m2u1(lN.1))
##D DFA <- within(DFA,i1t <- m2ui(i1))
##D ## Cehck that the transformations did their job.
##D with(DFA,plot(ecdf(e1t),pch="."))
##D with(DFA,lines(range(e1t),c(0,1),col=2,lty=2))
##D with(DFA,plot(ecdf(i1t),pch="."))
##D with(DFA,lines(range(i1t),c(0,1),col=2,lty=2))
##D 
##D ## The heavy computations to follow will be performed
##D ## in parallel using the snow package.
##D library(snow)
##D ## Define the number of slaves
##D nbSlaves <- 2
##D ## Create the cluster.
##D cl <- makeCluster(rep("localhost",nbSlaves),type="SOCK")
##D ## load STAR on each slave.
##D clusterEvalQ(cl,library(STAR))
##D 
##D ## Define a function making a function performing the 
##D ## fit with gssanova and suitable for a parallel implementation.
##D ## The returned function does in addition time transform the
##D ## spike train on the time window not used for the fit.
##D mkPFct <- function(df=DFA) {
##D   df
##D   PFct <- function(gtime,
##D                    fmla=event~e1t*i1t,
##D                    seed=20061001) {
##D     GF <- gssanova(fmla,
##D                    data=subset(df, time %in% gtime),
##D                    family="binomial",
##D                    seed=seed)
##D     tt <- GF %tt% subset(df, !(time %in% gtime))
##D     list(GF=GF,tt=tt)
##D   }
##D   PFct
##D }
##D 
##D PFct1 <- mkPFct()
##D ## Now PFct1 returns a list with two elements: the "fit object" (GF)
##D ## and the time transformed train (tt)
##D 
##D ## Create a list suitable as the second argument for clusterApply
##D gtList <- list(early=with(DFA,time[time<=29.5]),
##D                late=with(DFA,time[time>29.5])
##D                )
##D 
##D ## Fit and test a model with interaction between the (mapped)
##D ## ellasped time since the last spike and the (mapped) last
##D ## ISI. This takes ~ 95 s.
##D GF1.e060824spont.1 <- clusterApply(cl, gtList, PFct1)
##D 
##D ## Look a the test battery
##D plot(summary(GF1.e060824spont.1[[1]][[2]]),which=c(1,2,4,6))
##D plot(summary(GF1.e060824spont.1[[2]][[2]]),which=c(1,2,4,6))
##D 
##D ## Fit and test a model without interaction between the (mapped)
##D ## ellasped time since the last spike and the (mapped) last
##D ## ISI. This takes ~ 61 s.
##D GF2.e060824spont.1 <- clusterApply(cl, gtList, PFct1,fmla=event ~ e1t+i1t)
##D 
##D ## Look a the test battery
##D plot(summary(GF2.e060824spont.1[[1]][[2]]),which=c(1,2,4,6))
##D plot(summary(GF2.e060824spont.1[[2]][[2]]),which=c(1,2,4,6))
##D 
##D ## Compute the "predictive log probability" with Model 2
##D ## (without interaction). This takes ~ 1.6 s
##D (GF2.e060824spont.1.logProb <- predictLogProb(GF2.e060824spont.1[[1]][[1]],subset(DFA,time>29.5))+predictLogProb(GF2.e060824spont.1[[2]][[1]],subset(DFA,time<=29.5)))
##D 
##D ## Compute the "predictive log probability" with Model 1
##D ## (with interaction). This takes ~ 3.5 s
##D (GF1.e060824spont.1.logProb <- predictLogProb(GF1.e060824spont.1[[1]][[1]],subset(DFA,time>29.5))+predictLogProb(GF1.e060824spont.1[[2]][[1]],subset(DFA,time<=29.5)))
##D 
##D ## Prepare the simulations using Model 1 and 2
##D ## Define a function initializing a mrg32k3a RNG from
##D ## the rstream package on each slave
##D initMRG32k3a <- function(cl) {
##D   clusterEvalQ(cl,library(rstream))
##D   invisible(clusterCall(cl,
##D                         function() {
##D                           cmd <- parse(text=".s <- new(\"rstream.mrg32k3a\")")
##D                           eval(cmd,env=globalenv())
##D                         }
##D                         )
##D             )
##D   cat(paste(paste(clusterEvalQ(cl,rstream.sample(.s)),collapse=","),"\n"))
##D   invisible(clusterEvalQ(cl,rstream.reset(.s)))
##D }
##D 
##D ## Define a function returning a list of independent and packed
##D ## mrg32k3a rngs.
##D mkLecuyerList <- function(cl, ## a snow cluster
##D                           seed,
##D                           ...) {
##D   nbWorkers <- length(cl)
##D   lecuyerList <- vector(mode="list",length=nbWorkers)
##D   for (wIdx in 1:nbWorkers) {
##D     if (wIdx == 1) {
##D       if (!missing(seed)) lecuyerList[[1]] <- new("rstream.mrg32k3a",seed=seed)
##D       else lecuyerList[[1]] <- new("rstream.mrg32k3a")
##D     } else lecuyerList[[wIdx]] <- new("rstream.mrg32k3a")
##D     rstream.packed(lecuyerList[[wIdx]]) <- TRUE
##D   }
##D   lecuyerList
##D }
##D 
##D ## Define a function setting the uniform rng of each slave
##D ## to one of the independent mrg32k3a rngs created by
##D ## mkLecuyerList.
##D clusterSetupRSTREAM <- function(cl, ## a snow cluster
##D                                 lecuyerList
##D                                 ) {
##D 
##D 
##D   setLecuyer <- function(packedlecuyer) {
##D     assign("lecuyer",packedlecuyer,env=globalenv())
##D     cmd <- parse(text="rstream.packed(lecuyer)<-FALSE")
##D     eval(cmd,env=globalenv())
##D   }
##D 
##D   clusterApply(cl,lecuyerList,setLecuyer)
##D   clusterEvalQ(cl,rstream.RNG(lecuyer))
##D 
##D }
##D 
##D ## Load package rstream on master.
##D library(rstream)
##D ## Initialize mrg32k3a rngs on each slave.
##D initMRG32k3a(cl)
##D ## Create the list of independent mrg32k3a rngs
##D ## on master.
##D theList <- mkLecuyerList(cl,seed=rep(20061001,6))
##D ## Set the uniform rng of each slave to one of the
##D ## independent mrg32k3a rngs just created.
##D clusterSetupRSTREAM(cl,theList)
##D 
##D ## Define a list of map to uniform functions
##D fList.e060824spont.1 <- list(e1t=mkSelf(m2u1), i1t=mkMappedI(m2ui))
##D ## Define a simulating function from Model 1 fitted on the
##D ## half of the data set.
##D simF1.e060824spont.1 <- mkSimFct(object=GF1.e060824spont.1[[1]][[1]],
##D                                  m2uFctList=fList.e060824spont.1,
##D                                  trueData=subset(DFA,time>29.5),
##D                                  formerSpikes=with(DFA,time[event==1][time[event==1] <= 29.5])
##D                                  )
##D 
##D ## Define a simulating function from Model 2 fitted on the
##D ## half of the data set.
##D simF2.e060824spont.1 <- mkSimFct(object=GF2.e060824spont.1[[1]][[1]],
##D                                  m2uFctList=fList.e060824spont.1,
##D                                  trueData=subset(DFA,time>29.5),
##D                                  formerSpikes=with(DFA,time[event==1][time[event==1] <= 29.5])
##D                                  )
##D 
##D ## Define the number of simulations to carry out.
##D nbRep <- 100
##D ## Simulate spike trains in parallel using Model 1.
##D ## This takes ~ 670 s.
##D sim1.e060824spont.1 <- clusterApply(cl,
##D                                     rep(nbRep/nbSlaves,nbSlaves),
##D                                     function(n,SF) lapply(1:n, function(idx) SF()),
##D                                     SF=simF1.e060824spont.1)
##D 
##D ## Convert the returned list of lists into a single
##D ## big list.
##D sim1.e060824spont.1 <- c(sim1.e060824spont.1[[1]],
##D                          sim1.e060824spont.1[[2]])
##D 
##D ## Simulate spike trains in parallel using Model 1.
##D ## This takes ~ 425 s.
##D sim2.e060824spont.1 <- clusterApply(cl,
##D                                     rep(nbRep/nbSlaves,nbSlaves),
##D                                     function(n,SF) lapply(1:n, function(idx) SF()),
##D                                     SF=simF2.e060824spont.1)
##D 
##D ## Convert the returned list of lists into a single
##D ## big list.
##D sim2.e060824spont.1 <- c(sim2.e060824spont.1[[1]],
##D                          sim2.e060824spont.1[[2]])
##D 
##D ## Define a function generating automatically the
##D ## proper data frame from the simulated data.
##D mkDF.e060824spont.1 <- function(stList) {
##D   DF <- mkGLMdf(stList,0.004,0,59)
##D   DF <- within(DF,i1 <- isi(DF,lag=1))
##D   DF <- DF[complete.cases(DF),]
##D   DF <- within(DF,e1t <- m2u1(lN.1))
##D   DF <- within(DF,i1t <- m2ui(i1))
##D   DF
##D }
##D 
##D ## Define a function analysis the simulated trains with
##D ## both Model 1 and 2.
##D PSAFct <- mkPostSimAnalysis(e060824spont[[1]],1,29.5,list(GF1.e060824spont.1[[1]][[1]],GF2.e060824spont.1[[1]][[1]]),mkDF.e060824spont.1)
##D 
##D ## Analyze the simulations done with Model 1.
##D ## This takes ~ 400 s
##D sim1.e060824spont.1.psa <- clusterApply(cl,sim1.e060824spont.1,PSAFct)
##D 
##D ## Analyze the simulations done with Model 2.
##D ## This takes ~ 400 s
##D sim2.e060824spont.1.psa <- clusterApply(cl,sim2.e060824spont.1,PSAFct)
##D 
##D ## Get the log predictive probability assuming Model 1 for
##D ## simulations done with Model 1.
##D sim1.e060824spont.1.lpp1 <- sapply(sim1.e060824spont.1.psa, function(l) l[[1]]$lpp)
##D ## Get the log predictive probability assuming Model 2 for
##D ## simulations done with Model 1.
##D sim1.e060824spont.1.lpp2 <- sapply(sim1.e060824spont.1.psa, function(l) l[[2]]$lpp)
##D ## Get the log predictive probability assuming Model 1 for
##D ## simulations done with Model 2.
##D sim2.e060824spont.1.lpp1 <- sapply(sim2.e060824spont.1.psa, function(l) l[[1]]$lpp)
##D ## Get the log predictive probability assuming Model 2 for
##D ## simulations done with Model 2.
##D sim2.e060824spont.1.lpp2 <- sapply(sim2.e060824spont.1.psa, function(l) l[[2]]$lpp)
##D 
##D ## Get the observed log predictive probability with each model.
##D e060824spont.1.lpp1 <- predictLogProb(GF1.e060824spont.1[[1]][[1]],subset(DFA,time>29.5))
##D e060824spont.1.lpp2 <- predictLogProb(GF2.e060824spont.1[[1]][[1]],subset(DFA,time>29.5))
##D 
##D ## Get the difference of observed log predictive probabilities.
##D e060824spont.1.lppDiff <- e060824spont.1.lpp1 - e060824spont.1.lpp2
##D 
##D ## Look at the correlation between the log predictive probabilities
##D ## obtained with Model 1 and 2 with data simulated with Model 1.
##D plot(sim1.e060824spont.1.lpp1,sim1.e060824spont.1.lpp2,main="log prob with M2 vs log prob with M1 when M1 is true",xlab="log prob with M1",ylab="log prob with M2")
##D 
##D ## Plot the ECDF of the log predictive probabilities obtained
##D ## with Model 1 with data simulated with Model 1.
##D plot(ecdf(sim1.e060824spont.1.lpp1),pch=".",main="log prob with Model 1 when Model 1 is true")
##D ## Show the observed value of this statistic.
##D segments(e060824spont.1.lpp1,0,e060824spont.1.lpp1,sum(sim1.e060824spont.1.lpp1 <= e060824spont.1.lpp1)/nbRep,col=2,lwd=2)
##D segments(-1600,sum(sim1.e060824spont.1.lpp1 <= e060824spont.1.lpp1)/nbRep,e060824spont.1.lpp1,sum(sim1.e060824spont.1.lpp1 <= e060824spont.1.lpp1)/nbRep,col=2,lwd=2)
##D ## Plot the ECDF of the log predictive probabilities obtained
##D ## with Model 2 with data simulated with Model 1.
##D plot(ecdf(sim1.e060824spont.1.lpp2),pch=".",main="log prob with Model 2 when Model 1 is true")
##D ## Show the observed value of this statistic.
##D segments(e060824spont.1.lpp2,0,e060824spont.1.lpp2,sum(sim1.e060824spont.1.lpp2 <= e060824spont.1.lpp2)/nbRep,col=2,lwd=2)
##D segments(-1800,sum(sim1.e060824spont.1.lpp2 <= e060824spont.1.lpp2)/nbRep,e060824spont.1.lpp2,sum(sim1.e060824spont.1.lpp2 <= e060824spont.1.lpp2)/nbRep,col=2,lwd=2)
##D 
##D ## Plot the ECDF of the difference of the log predictive probabilities 
##D ## obtained with data simulated with Model 1.
##D plot(ecdf(sim1.e060824spont.1.lpp1-sim1.e060824spont.1.lpp2),pch=".",main="log prob with M1 - log prob with M2 when M1 is true")
##D ## Show the observed value of this statistic.
##D segments(e060824spont.1.lppDiff,0,e060824spont.1.lppDiff,sum(sim1.e060824spont.1.lpp1-sim1.e060824spont.1.lpp2<=e060824spont.1.lppDiff)/nbRep,col=2,lwd=2)
##D segments(-10,sum(sim1.e060824spont.1.lpp1-sim1.e060824spont.1.lpp2<=e060824spont.1.lppDiff)/nbRep,e060824spont.1.lppDiff,sum(sim1.e060824spont.1.lpp1-sim1.e060824spont.1.lpp2<=e060824spont.1.lppDiff)/nbRep,col=2,lwd=2)
##D 
##D ## Look at the correlation between the log predictive probabilities
##D ## obtained with Model 1 and 2 with data simulated with Model 2.
##D plot(sim2.e060824spont.1.lpp1,sim2.e060824spont.1.lpp2,main="log prob with M2 vs log prob with M1 when M2 is true",xlab="log prob with M1",ylab="log prob with M2")
##D ## Plot the ECDF of the log predictive probabilities obtained
##D ## with Model 1 with data simulated with Model 2.
##D plot(ecdf(sim2.e060824spont.1.lpp1),pch=".",main="log prob with Model 1 when Model 2 is true")
##D ## Show the observed value of this statistic.
##D segments(e060824spont.1.lpp1,0,e060824spont.1.lpp1,sum(sim2.e060824spont.1.lpp1 <= e060824spont.1.lpp1)/nbRep,col=2,lwd=2)
##D segments(-2000,sum(sim2.e060824spont.1.lpp1 <= e060824spont.1.lpp1)/nbRep,e060824spont.1.lpp1,sum(sim2.e060824spont.1.lpp1 <= e060824spont.1.lpp1)/nbRep,col=2,lwd=2)
##D ## Plot the ECDF of the log predictive probabilities obtained
##D ## with Model 2 with data simulated with Model 2.
##D plot(ecdf(sim2.e060824spont.1.lpp2),pch=".",main="log prob with Model 2 when Model 2 is true")
##D ## Show the observed value of this statistic.
##D segments(e060824spont.1.lpp2,0,e060824spont.1.lpp2,sum(sim2.e060824spont.1.lpp2 <= e060824spont.1.lpp2)/nbRep,col=2,lwd=2)
##D segments(-2000,sum(sim2.e060824spont.1.lpp2 <= e060824spont.1.lpp2)/nbRep,e060824spont.1.lpp2,sum(sim2.e060824spont.1.lpp2 <= e060824spont.1.lpp2)/nbRep,col=2,lwd=2)
##D ## Plot the ECDF of the difference of the log predictive probabilities 
##D ## obtained with data simulated with Model 1.
##D ## Make sure that the scale of the x axis is right.
##D xlim=c(min(c(-e060824spont.1.lppDiff,sim2.e060824spont.1.lpp2-sim2.e060824spont.1.lpp1)),max(sim2.e060824spont.1.lpp2-sim2.e060824spont.1.lpp1))
##D plot(ecdf(sim2.e060824spont.1.lpp2-sim2.e060824spont.1.lpp1),pch=".",main="log prob with M2 - log prob with M1 when M2 is true",xlim=xlim)
##D ## Show the observed value of this statistic.
##D points(-e060824spont.1.lppDiff,0,pch=16,col=2)
##D 
##D ## Stop the snow cluster.
##D stopCluster(cl)
## End(Not run)




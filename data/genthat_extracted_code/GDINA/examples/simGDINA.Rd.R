library(GDINA)


### Name: simGDINA
### Title: Data simulation based on the G-DINA models
### Aliases: simGDINA extract.simGDINA

### ** Examples

## Not run: 
##D ####################################################
##D #                     Example 1                    #
##D #             Data simulation (DINA)               #
##D ####################################################
##D N <- 500
##D Q <- sim30GDINA$simQ
##D J <- nrow(Q)
##D gs <- data.frame(guess=rep(0.1,J),slip=rep(0.1,J))
##D 
##D # Simulated DINA model; to simulate G-DINA model
##D # and other CDMs, change model argument accordingly
##D 
##D sim <- simGDINA(N,Q,gs.parm = gs,model = "DINA")
##D 
##D # True item success probabilities
##D extract(sim,what = "catprob.parm")
##D 
##D # True delta parameters
##D extract(sim,what = "delta.parm")
##D 
##D # simulated data
##D extract(sim,what = "dat")
##D 
##D # simulated attributes
##D extract(sim,what = "attribute")
##D 
##D ####################################################
##D #                     Example 2                    #
##D #             Data simulation (RRUM)               #
##D ####################################################
##D N <- 500
##D Q <- sim30GDINA$simQ
##D J <- nrow(Q)
##D gs <- data.frame(guess=rep(0.2,J),slip=rep(0.2,J))
##D # Simulated RRUM
##D # deltas except delta0 for each item will be simulated
##D # randomly subject to the constraints of RRUM
##D sim <- simGDINA(N,Q,gs.parm = gs,model = "RRUM")
##D 
##D # simulated data
##D extract(sim,what = "dat")
##D 
##D # simulated attributes
##D extract(sim,what = "attribute")
##D 
##D ####################################################
##D #                     Example 3                    #
##D #             Data simulation (LLM)                #
##D ####################################################
##D N <- 500
##D Q <- sim30GDINA$simQ
##D J <- nrow(Q)
##D gs <- data.frame(guess=rep(0.1,J),slip=rep(0.1,J))
##D # Simulated LLM
##D # By specifying type="equal", each required attribute is
##D # assumed to contribute to logit(P) equally
##D sim <- simGDINA(N,Q,gs.parm = gs,model = "LLM",gs.args = list (type="equal"))
##D #check below for what the equal contribution means
##D extract(sim,what = "delta.parm")
##D 
##D # simulated data
##D extract(sim,what = "dat")
##D 
##D # simulated attributes
##D extract(sim,what = "attribute")
##D 
##D ####################################################
##D #                   Example 4                      #
##D #          Data simulation (all CDMs)              #
##D ####################################################
##D 
##D set.seed(12345)
##D 
##D N <- 500
##D Q <- sim10GDINA$simQ
##D J <- nrow(Q)
##D gs <- data.frame(guess=rep(0.1,J),slip=rep(0.1,J))
##D # Simulated different CDMs for different items
##D models <- c("GDINA","DINO","DINA","ACDM","LLM","RRUM","GDINA","LLM","RRUM","DINA")
##D sim <- simGDINA(N,Q,gs.parm = gs,model = models,gs.args = list(type="random"))
##D 
##D # simulated data
##D extract(sim,what = "dat")
##D 
##D # simulated attributes
##D extract(sim,what = "attribute")
##D 
##D ####################################################
##D #                   Example 5                      #
##D #          Data simulation (all CDMs)              #
##D #  using probability of success in list format     #
##D ####################################################
##D 
##D # success probabilities for each item need to be provided in list format as follows:
##D # if item j requires Kj attributes, 2^Kj success probabilities
##D # need to be specified
##D # e.g., item 1 only requires 1 attribute
##D # therefore P(0) and P(1) should be specified;
##D # similarly, item 10 requires 3 attributes,
##D # P(000),P(100),P(010)...,P(111) should be specified;
##D # the latent class represented by each element can be obtained
##D # by calling attributepattern(Kj)
##D itemparm.list <- list(item1=c(0.2,0.9),
##D                     item2=c(0.1,0.8),
##D                     item3=c(0.1,0.9),
##D                     item4=c(0.1,0.3,0.5,0.9),
##D                     item5=c(0.1,0.1,0.1,0.8),
##D                     item6=c(0.2,0.9,0.9,0.9),
##D                     item7=c(0.1,0.45,0.45,0.8),
##D                     item8=c(0.1,0.28,0.28,0.8),
##D                     item9=c(0.1,0.4,0.4,0.8),
##D                     item10=c(0.1,0.2,0.3,0.4,0.4,0.5,0.7,0.9))
##D set.seed(12345)
##D N <- 500
##D Q <- sim10GDINA$simQ
##D # When simulating data using catprob.parm argument,
##D # it is not necessary to specify model and type
##D sim <- simGDINA(N,Q,catprob.parm = itemparm.list)
##D 
##D 
##D ####################################################
##D #                   Example 6                      #
##D #            Data simulation (all CDMs)            #
##D #      using delta parameters in list format       #
##D ####################################################
##D 
##D delta.list <- list(c(0.2,0.7),
##D                     c(0.1,0.7),
##D                     c(0.1,0.8),
##D                     c(0.1,0.7),
##D                     c(0.1,0.8),
##D                     c(0.2,0.3,0.2,0.1),
##D                     c(0.1,0.35,0.35),
##D                     c(-1.386294,0.9808293,1.791759),
##D                     c(-1.609438,0.6931472,0.6),
##D                     c(0.1,0.1,0.2,0.3,0.0,0.0,0.1,0.1))
##D 
##D model <- c("GDINA","GDINA","GDINA","DINA","DINO","GDINA","ACDM","LLM","RRUM","GDINA")
##D N <- 500
##D Q <- sim10GDINA$simQ
##D # When simulating using delta.parm argument, model needs to be
##D # specified
##D sim <- simGDINA(N,Q,delta.parm = delta.list, model = model)
##D 
##D 
##D ####################################################
##D #                   Example 7                      #
##D #      Data simulation (higher order DINA model)   #
##D ####################################################
##D 
##D Q <- sim30GDINA$simQ
##D gs <- matrix(0.1,nrow(Q),2)
##D N <- 500
##D set.seed(12345)
##D theta <- rnorm(N)
##D K <- ncol(Q)
##D lambda <- data.frame(a=rep(1,K),b=seq(-2,2,length.out=K))
##D sim <- simGDINA(N,Q,gs.parm = gs, model="DINA", att.dist = "higher.order",
##D                  higher.order.parm = list(theta = theta,lambda = lambda))
##D 
##D ####################################################
##D #                   Example 8                      #
##D #      Data simulation (higher-order CDMs)         #
##D ####################################################
##D 
##D Q <- sim30GDINA$simQ
##D gs <- matrix(0.1,nrow(Q),2)
##D models <- c(rep("GDINA",5),
##D             rep("DINO",5),
##D             rep("DINA",5),
##D             rep("ACDM",5),
##D             rep("LLM",5),
##D             rep("RRUM",5))
##D N <- 500
##D set.seed(12345)
##D theta <- rnorm(N)
##D K <- ncol(Q)
##D lambda <- data.frame(a=runif(K,0.7,1.3),b=seq(-2,2,length.out=K))
##D sim <- simGDINA(N,Q,gs.parm = gs, model=models, att.dist = "higher.order",
##D                  higher.order.parm = list(theta = theta,lambda = lambda))
##D 
##D 
##D ####################################################
##D #                   Example 9                      #
##D #      Data simulation (higher-order model)        #
##D #  using the multivariate normal threshold model   #
##D ####################################################
##D 
##D 
##D # See Chiu et al., (2009)
##D 
##D N <- 500
##D Q <- sim10GDINA$simQ
##D K <- ncol(Q)
##D gs <- matrix(0.1,nrow(Q),2)
##D cutoffs <- qnorm(c(1:K)/(K+1))
##D m <- rep(0,K)
##D vcov <- matrix(0.5,K,K)
##D diag(vcov) <- 1
##D simMV <- simGDINA(N,Q,gs.parm = gs, att.dist = "mvnorm",
##D                  mvnorm.parm=list(mean = m, sigma = vcov,cutoffs = cutoffs))
##D 
##D ####################################
##D #          Example 10              #
##D #        Simulation using          #
##D #      user-specified att structure#
##D ####################################
##D 
##D # --- User-specified attribute structure ----#
##D Q <- sim30GDINA$simQ
##D K <- ncol(Q)
##D # divergent structure A1->A2->A3;A1->A4->A5;A1->A4->A6
##D diverg <- list(c(1,2),
##D                c(2,3),
##D                c(1,4),
##D                c(4,5))
##D struc <- att.structure(diverg,K)
##D 
##D # data simulation
##D N <- 1000
##D # data simulation
##D gs <- matrix(0.1,nrow(Q),2)
##D simD <- simGDINA(N,Q,gs.parm = gs,
##D                    model = "DINA",att.dist = "multinomial",att.prior = struc$att.prob)
##D 
##D 
##D ####################################################
##D #                   Example 11                     #
##D #                Data simulation                   #
##D #  (GDINA with monotonicity constraints)           #
##D ####################################################
##D 
##D set.seed(12345)
##D 
##D N <- 500
##D Q <- sim30GDINA$simQ
##D J <- nrow(Q)
##D gs <- data.frame(guess=rep(0.1,J),slip=rep(0.1,J))
##D # Simulated different CDMs for different items
##D sim <- simGDINA(N,Q,gs.parm = gs,model = "GDINA",gs.args=list(mono.constraint=TRUE))
##D 
##D # True item success probabilities
##D extract(sim,what = "catprob.parm")
##D 
##D # True delta parameters
##D extract(sim,what = "delta.parm")
##D 
##D # simulated data
##D extract(sim,what = "dat")
##D 
##D # simulated attributes
##D extract(sim,what = "attribute")
##D 
##D ####################################################
##D #                   Example 12                     #
##D #                Data simulation                   #
##D # (Sequential G-DINA model - polytomous responses) #
##D ####################################################
##D 
##D set.seed(12345)
##D 
##D N <- 2000
##D # restricted Qc matrix
##D Qc <- sim20seqGDINA$simQ
##D #total number of categories
##D J <- nrow(Qc)
##D gs <- data.frame(guess=rep(0.1,J),slip=rep(0.1,J))
##D # simulate sequential DINA model
##D simseq <- simGDINA(N, Qc, sequential = TRUE, gs.parm = gs, model = "GDINA")
##D 
##D # True item success probabilities
##D extract(simseq,what = "catprob.parm")
##D 
##D # True delta parameters
##D extract(simseq,what = "delta.parm")
##D 
##D # simulated data
##D extract(simseq,what = "dat")
##D 
##D # simulated attributes
##D extract(simseq,what = "attribute")
##D 
##D 
##D ####################################################
##D #                   Example 13
##D #         DINA model Attribute generated using
##D #             multinomial distribution
##D ####################################################
##D 
##D Q <- sim10GDINA$simQ
##D gs <- matrix(0.1,nrow(Q),2)
##D N <- 5000
##D set.seed(12345)
##D prior <- c(0.1,0.2,0,0,0.2,0,0,0.5)
##D sim <- simGDINA(N,Q,gs.parm = gs, model="DINA", att.dist = "multinomial",att.prior = prior)
##D # check latent class sizes
##D table(sim$att.group)/N
##D 
##D ####################################################
##D #                   Example 14
##D #                  MS-DINA model
##D ####################################################
##D 
##D 
##D Q <- matrix(c(1,1,1,1,0,
##D 1,2,0,1,1,
##D 2,1,1,0,0,
##D 3,1,0,1,0,
##D 4,1,0,0,1,
##D 5,1,1,0,0,
##D 5,2,0,0,1),ncol = 5,byrow = TRUE)
##D d <- list(
##D   item1=c(0.2,0.7),
##D   item2=c(0.1,0.6),
##D   item3=c(0.2,0.6),
##D   item4=c(0.2,0.7),
##D   item5=c(0.1,0.8))
##D 
##D   set.seed(12345)
##D sim <- simGDINA(N=1000,Q = Q, delta.parm = d,
##D                model = c("MSDINA","MSDINA","DINA","DINA","DINA","MSDINA","MSDINA"))
##D 
##D # simulated data
##D extract(sim,what = "dat")
##D 
##D # simulated attributes
##D extract(sim,what = "attribute")
## End(Not run)






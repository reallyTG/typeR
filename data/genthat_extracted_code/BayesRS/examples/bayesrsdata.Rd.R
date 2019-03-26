library(BayesRS)


### Name: bayesrsdata
### Title: Example Data Set
### Aliases: bayesrsdata
### Keywords: dataset

### ** Examples

## Not run: 
##D require(MASS)
##D 
##D nsubj <- 40             # number of participants
##D nobs <- 30              # number of observations per cell
##D ncont <- 1              # number of continuous IVs
##D ncat <- 1               # number of categorical IVs
##D ntrials <- nobs * ncont * ncat #total number of trials per subject
##D xcont <- seq(1,5,1)     # values of continuous IV
##D xcont.mc <- xcont-mean(xcont) # mean-centered values of continuous IV
##D xcat <- c(-.5,.5)             # Simple coded categorical IV
##D eff.size.cont <- c(0.3)       # effect size of continuous IV
##D eff.size.cat <- c(0.8)       # effect size of categorical IV
##D eff.size.interaction <- c(0)  # effect size of interaction
##D correlation.predictors <- 0.5     # correlation between b<-subject slopes of the two predictors
##D intercept <- 0          # grand intercept
##D error.sd <- 1           # standard deviation of error term
##D 
##D #-------------------------
##D #  Create Simulated Data -
##D #-------------------------
##D #  correlation between by-subject continuous slope, and by-subject categorical slope
##D subj.cont1.cat1.corr <- mvrnorm(n = nsubj,
##D                                 mu = c(eff.size.cont,eff.size.cat),
##D                                 Sigma = matrix(data = c(1,correlation.predictors,
##D                                                         correlation.predictors,1),
##D                                                nrow = 2, ncol = 2, byrow = TRUE),
##D                                 empirical = TRUE)
##D 
##D b.cont.subj <- data.frame(subject = 1:nsubj, vals = subj.cont1.cat1.corr[,1])
##D b.cat.subj <- data.frame(subject = 1:nsubj, vals = subj.cont1.cat1.corr[,2])
##D b.subj.rand <- data.frame(subject = 1:nsubj, vals = rnorm(n = nsubj, mean = 0, sd = 1))
##D b.ia.subj <- data.frame(subject = 1:nsubj, vals = rnorm(n = nsubj,
##D                                                         mean = eff.size.interaction, sd = 1))
##D 
##D # generate according to lin reg formula
##D bayesrsdata <- data.frame(subject = rep(1:nsubj, each = ntrials),
##D                           x.time = rep(xcont, each = ntrials/5),
##D                           x.domain= rep(xcat, each = ntrials/10))
##D 
##D bayesrsdata$y <- 0
##D 
##D for (i in 1:nrow(bayesrsdata)){
##D   bayesrsdata$y[i] <- b.subj.rand$vals[bayesrsdata$subject[i]==b.subj.rand$subject] +
##D     bayesrsdata$x.time[i] * (eff.size.cont+b.cont.subj$vals[bayesrsdata$subject[i]==
##D                                                               b.cont.subj$subject]) +
##D     bayesrsdata$x.domain[i] * (eff.size.cat+b.cat.subj$vals[bayesrsdata$subject[i]==
##D                                                               b.cat.subj$subject]) +
##D     bayesrsdata$x.time[i] * bayesrsdata$x.domain[i] *
##D     (eff.size.interaction+b.ia.subj$vals[bayesrsdata$subj[i]==b.ia.subj$subject])
##D }
##D 
##D # add measurement error
##D bayesrsdata$y <- bayesrsdata$y + rnorm(n = nrow(bayesrsdata), mean = 0, sd = 1)
##D 
##D # create final data set
##D recvars <- which(names(bayesrsdata) %in% c("subject", "item", "x.domain"))
##D bayesrsdata[,recvars] <- lapply(bayesrsdata[,recvars], as.factor)
##D 
##D save(bayesrsdata, file= "bayesrsdata.rda")
##D 
## End(Not run)




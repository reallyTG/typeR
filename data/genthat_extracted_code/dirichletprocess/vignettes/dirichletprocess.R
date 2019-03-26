### R code from vignette source 'dirichletprocess.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: preliminaries
###################################################
#options(prompt = "R> ", continue = "+  ", width = 70, useFancyQuotes = FALSE)
library(dirichletprocess)


###################################################
### code chunk number 2: student-t (eval = FALSE)
###################################################
## y <- rt(200, 3) + 2 #generate sample data
## dp <- DirichletProcessGaussian(y)
## dp <- Fit(dp, 1000)


###################################################
### code chunk number 3: oldfaithfull (eval = FALSE)
###################################################
## its <- 500
## faithfulTransformed <- scale(faithful$waiting)
## dp <- DirichletProcessGaussian(faithfulTransformed)
## dp <- Fit(dp, its)
## plot(dp)
## plot(dp, data_method="hist")


###################################################
### code chunk number 4: customsampling (eval = FALSE)
###################################################
## dp <- DirichletProcessGaussian(y)
## 
## samples <- list()
## for(s in seq_len(1000)){
##   dp <- ClusterComponentUpdate(dp)
##   dp <- ClusterParameterUpdate(dp)
## 
##   if(s %% 10 == 0) {
##   	dp <- UpdateAlpha(dp)
##   }
##   samples[[s]] <- list()
##   samples[[s]]$phi <- dp$clusterParameters
##   samples[[s]]$weights <- dp$weights
## }


###################################################
### code chunk number 5: toy-beta (eval = FALSE)
###################################################
## y <- c(rbeta(150, 1, 3), rbeta(150, 7, 3)) #generate sample data
## dp <- DirichletProcessBeta(y, 1)
## dp <- Fit(dp, 1000)


###################################################
### code chunk number 6: toy-beta-plot (eval = FALSE)
###################################################
## posteriorFrame <- PosteriorFrame(dp, ppoints(100), ci_size = 0.05)
## 
## trueFrame <- data.frame(x=ppoints(100),
##                         y=0.5*dbeta(ppoints(100), 1, 3)+
##                           0.5*dbeta(ppoints(100), 7, 3))
## 
## ggplot() +
##   geom_ribbon(data=posteriorFrame,
##               aes(x=x, ymin=X2.5., ymax=X97.5.),
##               alpha=0.2,
##               colour=NA,
##               fill="red") +
##   geom_line(data=posteriorFrame, aes(x=x, y=Mean), colour="red") +
##   geom_line(data=trueFrame, aes(x=x, y=y))


###################################################
### code chunk number 7: clustering (eval = FALSE)
###################################################
## faithfulTrans <- scale(faithful)


###################################################
### code chunk number 8: clustering-fit (eval = FALSE)
###################################################
## dp <-  DirichletProcessMvnormal(faithfulTrans)
## dp <- Fit(dp, 1000)
## plot(dp)


###################################################
### code chunk number 9: rats (eval = FALSE)
###################################################
## numSamples = 200
## thetaDirichlet <- matrix(nrow=numSamples, ncol=nrow(rats))
## 
## dpobj <- DirichletProcessBeta(rats$y/rats$N,
##                               maxY=1,
##                               g0Priors = c(2, 150),
##                               mhStep=c(0.25, 0.25),
##                               hyperPriorParameters = c(1, 1/150))
## dpobj <- Fit(dpobj, 10)
## 
## clusters <- dpobj$clusterParameters
## 
## a <- clusters[[1]] * clusters[[2]]
## b <- (1 - clusters[[1]]) * clusters[[2]]
## 
## for(i in seq_len(numSamples)){
## 
##   posteriorA <- a[dpobj$clusterLabels] + rats$y
##   posteriorB <- b[dpobj$clusterLabels] + rats$N - rats$y
##   thetaDirichlet[i, ] <- rbeta(nrow(rats), posteriorA, posteriorB)
## 
##   dpobj <- ChangeObservations(dpobj, thetaDirichlet[i, ])
##   dpobj <- Fit(dpobj, 5)
##   clusters <- dpobj$clusterParameters
## 
##   a <- clusters[[1]] * clusters[[2]]
##   b <- (1 - clusters[[1]]) * clusters[[2]]
## }


###################################################
### code chunk number 10: rats-plot (eval = FALSE)
###################################################
## ggplot(rats, aes(x=y/N)) +
##   geom_density(fill="black") #Plot the emperical distribution
## 
## 
## posteriorFrame <- PosteriorFrame(dpobj, ppoints(1000))
## 
## ggplot() +
##   geom_ribbon(data=posteriorFrame,
##               aes(x=x, ymin=X5.,ymax=X95.),
##               alpha=0.2) +
##   geom_line(data=posteriorFrame, aes(x=x, y=Mean)) +
##   xlim(c(0, 0.35)) #Plot the resulting prior distribution
## 


###################################################
### code chunk number 11: hierarachical-gen (eval = FALSE)
###################################################
## mu <- c(0.25, 0.75, 0.4)
## tau <- c(5, 6, 10)
## a <- mu * tau
## b <- (1 - mu) * tau
## y1 <- c(rbeta(500, a[1], b[1]), rbeta(500, a[2], b[2]))
## y2 <- c(rbeta(500, a[1], b[1]), rbeta(500, a[3], b[3]))


###################################################
### code chunk number 12: hierarchical (eval = FALSE)
###################################################
## dplist <- DirichletProcessHierarchicalBeta(list(y1, y2),
##                                            maxY=1,
##                                            hyperPriorParameters = c(1, 0.01),
##                                            mhStepSize = c(0.1, 0.1),
##                                            gammaPriors = c(2, 4),
##                                            alphaPriors = c(2, 4))
## dplist <- Fit(dplist, 500)


###################################################
### code chunk number 13: hierarchical-plot (eval = FALSE)
###################################################
## xGrid <- ppoints(100)
## postDraws <- lapply(dplist$indDP,
##                     function(x) {
##                       replicate(1000, PosteriorFunction(x)(xGrid))
##                     }
##                     )
## 
## postMeans <- lapply(postDraws, rowMeans)
## postQuantiles <- lapply(postDraws,
##                         function(x) {
##                           apply(x, 1, quantile, probs=c(0.025, 0.975))
##                         }
##                         )
## 
## postFrame <- do.call(rbind,
##                      lapply(seq_along(postMeans),
##                             function(i) data.frame(Mean=postMeans[[i]],
##                                                       t(postQuantiles[[i]]),
##                                                       x=xGrid, ID=i)
##                             )
##                      )
## 
## trueFrame1 <- data.frame(y=0.5*dbeta(xGrid, a[1], b[1]) +
##                            0.5*dbeta(xGrid, a[2], b[2]),
##                          x=ppoints(100), ID=1)
## trueFrame2 <- data.frame(y=0.5*dbeta(xGrid, a[1], b[1]) +
##                            0.5*dbeta(xGrid, a[3], b[3]),
##                          x=xGrid, ID=2)
## trueFrame <- rbind(trueFrame1, trueFrame2)
## 
## ggplot() +
##   geom_ribbon(data=postFrame, aes(x=x, ymin=X2.5., ymax=X97.5.),
##               alpha=0.2, colour=NA, fill="red") + #credible interval
##   geom_line(data=postFrame, aes(x=x, y=Mean), colour="red") + #mean
##   geom_line(data=trueFrame, aes(x=x, y=y)) + #true density
##   facet_grid(~ID)


###################################################
### code chunk number 14: stickbreaking-gen (eval = FALSE)
###################################################
## y <- cumsum(runif(1000))
## pdf <- function(x) sin(x/50)^2
## accept_prob <- pdf(y)
## pts <- sample(y, 500, prob=accept_prob)


###################################################
### code chunk number 15: stickbreaking (eval = FALSE)
###################################################
## dp <- DirichletProcessBeta(sample(pts, 100), maxY = max(pts)*1.01,
## alphaPrior = c(2, 0.01))
## dp <- Fit(dp, 100, TRUE)
## 
## for(i in seq_len(2000)){
##   lambdaHat <- PosteriorFunction(dp)
##   newPts <- sample(pts, 150, prob=lambdaHat(pts))
##   newPts[is.infinite(newPts)] <- 1
##   newPts[is.na(newPts)] <- 0
##   dp <- ChangeObservations(dp, newPts)
##   dp <- Fit(dp, 2, TRUE)
## }


###################################################
### code chunk number 16: stickbreaking-plot (eval = FALSE)
###################################################
## posteriorFrame <- PosteriorFrame(dp, seq(0, max(pts)*1.01, by=0.1))
## 
## trueFrame <- data.frame(y=pdf(seq(0, max(pts)*1.01, by=0.1))/238,
##                         x=seq(0, max(pts)*1.01, by=0.1))
## 
## ggplot() +
##   geom_ribbon(data=posteriorFrame, aes(x=x, ymin=X5., ymax=X95.),
##               alpha=0.2, fill="red", colour=NA) + #credible interval
##   geom_line(data=posteriorFrame, aes(x=x, y=Mean), colour="red") + #mean
##   geom_line(data=trueFrame, aes(x=x, y=y)) #true intensity


###################################################
### code chunk number 17: poissonMD (eval = FALSE)
###################################################
## poisMd <- MixingDistribution(distribution="poisson",
##                              priorParameters = c(1, 1),
##                              conjugate="conjugate")


###################################################
### code chunk number 18: poisson (eval = FALSE)
###################################################
## y <- c(rpois(150, 3), rpois(150, 10)) #generate sample data
## dp <- DirichletProcessCreate(y, poisMd)
## dp <- Initialise(dp)
## dp <- Fit(dp, 1000)
## 
## pf <- PosteriorFrame(dp, 0:20, 1000)
## 
## trueFrame <- data.frame(x= 0:20,
##                         y= 0.5*dpois(0:20, 3) + 0.5*dpois(0:20, 10))
## 
## ggplot() +
##     geom_ribbon(data=pf,
##                 aes(x=x, ymin=X5., ymax=X95.),
##                 colour=NA,
##                 fill="red",
##                 alpha=0.2) + #credible intervals
##     geom_line(data=pf, aes(x=x, y=Mean), colour="red") + #mean
##     geom_line(data=trueFrame, aes(x=x, y=y)) #true
## 
## 


###################################################
### code chunk number 19: gamma (eval = FALSE)
###################################################
## y <- c(rgamma(100, 2, 4), rgamma(100, 6, 3)) #generate sample data
## dp <- DirichletProcessCreate(y, gammaMd)
## dp <- Initialise(dp)
## dp <- Fit(dp, 1000)
## 
## pf <- PosteriorFrame(dp, ppoints(100)*6, 1000)
## 
## trueFrame <- data.frame(x=ppoints(100)*6,
##                           y= 0.5*dgamma(ppoints(100)*6, 2, 4) +
##                           0.5*dgamma(ppoints(100)*6, 6, 3))
## 
## ggplot() +
##   geom_ribbon(data=pf,
##               aes(x=x,ymin=X5.,ymax=X95.),
##               colour=NA, fill="red", alpha=0.2) +
##   geom_line(data=pf, aes(x=x, y=Mean), colour="red") +
##   geom_line(data=trueFrame, aes(x=x, y=y))


###################################################
### code chunk number 20: censoredMD (eval = FALSE)
###################################################
## mdobjA <- MixingDistribution("weibullcens",
##                              c(1,2,0.5), "nonconjugate",
##                              mhStepSize=c(0.11,0.11),
##                              hyperPriorParameters=c(2.222, 2, 1, 0.05))
## mdobjB <- MixingDistribution("weibullcens",
##                              c(1,2,0.5), "nonconjugate",
##                              mhStepSize=c(0.11,0.11),
##                              hyperPriorParameters=c(2.069, 2, 1, 0.08))
## 
## class(mdobjA) <- c("list", "weibullcens", "weibull", "nonconjugate")
## class(mdobjB) <- c("list", "weibullcens", "weibull", "nonconjugate")


###################################################
### code chunk number 21: censored (eval = FALSE)
###################################################
## dpA <- DirichletProcessCreate(data_a, mdobjA, c(2, 0.9))
## dpA <- Initialise(dpA)
## 
## dpB <- DirichletProcessCreate(data_b, mdobjB, c(2, 0.9))
## dpB <- Initialise(dpB)
## 
## dpA <- Fit(dpA, 500, TRUE)
## dpB <- Fit(dpB, 500, TRUE)


###################################################
### code chunk number 22: cluster-prediciton (eval = FALSE)
###################################################
## faithfulTrans <- scale(faithful)
## trainIndex <- 1:(nrow(faithfulTrans)-5)
## 
## dp <-  DirichletProcessMvnormal(faithfulTrans[trainIndex, ])
## dp <- Fit(dp, 1000)
## 
## labelPred <- ClusterLabelPredict(dp, faithfulTrans[-trainIndex, ])


###################################################
### code chunk number 23: cluster-prediciton-plot (eval = FALSE)
###################################################
## faithfulTrainPlot <- data.frame(faithful[trainIndex, ],
##                                 Label=dp$clusterLabels)
## faithfulTestPlot <- data.frame(faithful[-trainIndex, ],
##                                Label=labelPred$componentIndexes)
## 
## ggplot() +
##     geom_point(data=faithfulTrainPlot,
##                aes(x=eruptions,
##                    y=waiting,
##                    colour=as.factor(Label)),
##                size=1) +
##     geom_point(data=faithfulTestPlot,
##                aes(x=eruptions,
##                    y=waiting,
##                    colour=as.factor(Label)),
##                shape=17, size=5) +
##   guides(colour=FALSE)



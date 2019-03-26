library(mmpp)


### Name: mmpp-package
### Title: A package for Computing Similarity and Distance Metrics for
###   Marked Point Process Data
### Aliases: mmpp mmpp-package

### ** Examples

## An example to show that the prediction error of the magnitude based on
## 1-nearest neighbor predictor can be reduced by taking marks into account.
## It will take about 5 minutes if you run this example
## Not run: 
##D library(mmpp)
##D data(Miyagi20030626)
##D ## split the original MPP by using 3-hour time window
##D sMiyagi <- splitMPP(Miyagi20030626,h=60*60*3,scaleMarks=TRUE)$S
##D 
##D ## target of the prediction is the maximum magnitude in the window
##D y <- NULL
##D for(i in 1:length(sMiyagi)){
##D   y <- c(y, max(sMiyagi[[i]]$magnitude))
##D }
##D 
##D y <- y[-1]
##D sMiyagi[[length(sMiyagi)]] <- NULL
##D 
##D ## number of whole partial MPPs splitted by a 3-hour time window
##D N <- length(sMiyagi)
##D ## training samples are past one week data
##D Ntr <- 24*7/3
##D ## number of different prediction methods
##D Nd <- 10
##D 
##D err <- matrix(0, N-Ntr, Nd)
##D colnames(err) <- c("f SPP","iip SPP","cooc smooth SPP","cooc count SPP","iei SPP",
##D                    "f MPP","iip MPP","cooc smooth MPP","cooc count MPP","iei MPP")
##D 
##D ## predict the max magnitude in the next 3-hour based on the similarity
##D ## between the current partial point process and the 7-days past partial point process
##D cat("running prediction experiment")
##D for(t in 1:(N-Ntr)){
##D   cat(".")
##D   qid <- Ntr+t
##D   q <- sMiyagi[[qid]]
##D 
##D   ## simple PP
##D   ## fmetric with tau=1
##D   sim2query <- NULL
##D   for(i in 1:Ntr){
##D     sim2query <- c(sim2query,fmetric(q$time,sMiyagi[[qid-i]]$time))
##D   }
##D   err[t,1] <- abs(y[qid]-y[t:(Ntr+t-1)][which.max(sim2query)])
##D 
##D   ## iipmetric with tau=1
##D   sim2query <- NULL
##D   for(i in 1:Ntr){
##D     sim2query <- c(sim2query,iipmetric(q$time,sMiyagi[[qid-i]]$time))
##D   }
##D   err[t,2] <- abs(y[qid]-y[t:(Ntr+t-1)][which.max(sim2query)])
##D 
##D   ## coocmetric (smooth) with tau=1
##D   sim2query <- NULL
##D   for(i in 1:Ntr){
##D     sim2query <- c(sim2query,coocmetric(q$time,sMiyagi[[qid-i]]$time,type="smooth"))
##D   }
##D   err[t,3] <- abs(y[qid]-y[t:(Ntr+t-1)][which.max(sim2query)])
##D 
##D   ## coocmetric (count)
##D   sim2query <- NULL
##D   for(i in 1:Ntr){
##D     sim2query <- c(sim2query,coocmetric(q$time,sMiyagi[[qid-i]]$time,type="count"))
##D   }
##D   err[t,4] <- abs(y[qid]-y[t:(Ntr+t-1)][which.max(sim2query)])
##D 
##D   ## iei metric
##D   sim2query <- NULL
##D   for(i in 1:Ntr){
##D     sim2query <- c(sim2query,ieimetric(q$time,sMiyagi[[qid-i]]$time))
##D   }
##D   err[t,5] <- abs(y[qid]-y[t:(Ntr+t-1)][which.max(sim2query)])
##D 
##D   ## marked PP with latitude, longitude, depth, and magnitude
##D   ## fmetric with tau=1
##D   sim2query <- NULL
##D   for(i in 1:Ntr){
##D     sim2query <- c(sim2query,fmetric(q,sMiyagi[[qid-i]]))
##D   }
##D   err[t,6] <- abs(y[qid]-y[t:(Ntr+t-1)][which.max(sim2query)])
##D 
##D   ## iipmetric with tau=1
##D   sim2query <- NULL
##D   for(i in 1:Ntr){
##D     sim2query <- c(sim2query,iipmetric(q,sMiyagi[[qid-i]]))
##D   }
##D   err[t,7] <- abs(y[qid]-y[t:(Ntr+t-1)][which.max(sim2query)])
##D 
##D   ## coocmetric (smooth) with tau=1
##D   sim2query <- NULL
##D   for(i in 1:Ntr){
##D     sim2query <- c(sim2query,coocmetric(q,sMiyagi[[qid-i]],type="smooth"))
##D   }
##D   err[t,8] <- abs(y[qid]-y[t:(Ntr+t-1)][which.max(sim2query)])
##D 
##D   ## coocmetric (count)
##D   sim2query <- NULL
##D   for(i in 1:Ntr){
##D     sim2query <- c(sim2query,coocmetric(q,sMiyagi[[qid-i]],type="count"))
##D   }
##D   err[t,9] <- abs(y[qid]-y[t:(Ntr+t-1)][which.max(sim2query)])
##D 
##D   ## iei metric
##D   sim2query <- NULL
##D   for(i in 1:Ntr){
##D     sim2query <- c(sim2query,ieimetric(q,sMiyagi[[qid-i]]))
##D   }
##D   err[t,10] <- abs(y[qid]-y[t:(Ntr+t-1)][which.max(sim2query)])
##D 
##D }
##D cat("done\n")
##D print(colMeans(err))
##D ##f SPP      iip SPP     cooc smooth SPP  cooc count SPP  iei SPP
##D ##0.7002634  0.6839529   0.7263602        0.6632930       0.7905148
##D ##f MPP      iip MPP     cooc smooth MPP  cooc count MPP  iei MPP
##D ##0.6839529  0.6317594   0.6643804        0.6622056       0.7698548
## End(Not run)




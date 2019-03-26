library(irtProb)


### Name: utilities
### Title: Utility Functions
### Aliases: rmultinomial propCorrect
### Keywords: distribution

### ** Examples

## Not run: 
##D ## Comparison of the results from the multinomial and multinom functions
##D  x <- c(1,4,9)
##D  # Values draws
##D  rmultinomial(x=x, n=10)
##D  # Binary vectors draws
##D  rmultinom(n=10, size = 1, prob=rep(1,length(x))/length(x))
##D 
##D ## Computation of the expected proportion of correct responses varying values
##D  # of theta (-3 to 3) and of pseudo-guessing (C = 0.0 to 0.6) person parameters
##D  nItems  <- 40
##D  a       <- rep(1.702,nItems); b <- seq(-3,3,length=nItems)
##D  c       <- rep(0,nItems); d <- rep(1,nItems)
##D  theta   <- seq(-3.0, 3.0, by=1.0)
##D  C       <- seq( 0.0, 1.0, by=0.1)
##D  D       <- S <- 0
##D  
##D  results <- matrix(NA, ncol=length(C), nrow=length(theta))
##D  colnames(results) <- C; rownames(results) <- theta
##D  for (i in (1:length(theta))) {
##D   results[i,] <- propCorrect(theta = theta[i], S = 0, C = C, D = 0,
##D                              s = 1/a, b = b, c = c, d = d)
##D   }
##D   round(results, 2)
##D 
##D ## Computation of the expected proportion of correct responses varying values
##D  # of theta (-3 to 3) and of pseudo-guessing (C = 0.0 to 0.6) person parameters
##D  # if we choose the correct modelisation itegrating the C pseudo-guessing papameter
##D  # and if we choose according to a model selection by LL criteria
##D  nItems <- 40
##D  a      <- rep(1.702,nItems); b <- seq(-3,3,length=nItems)
##D  c      <- rep(0,nItems); d <- rep(1,nItems)
##D  nSubjects <- 300
##D  theta     <- rmultinomial(c(-1), nSubjects)
##D  S         <- rmultinomial(c(0), nSubjects)
##D  C         <- rmultinomial(seq(0,0.9,by=0.1), nSubjects)
##D  D         <- rmultinomial(c(0), nSubjects)
##D  set.seed(seed = 100)
##D  X         <- ggrm4pl(n=nItems, rep=1,
##D                       theta=theta, S=S, C=C, D=D,
##D                       s=1/a, b=b,c=c,d=d)
##D  # Results for each subjects for each models
##D  essai     <- m4plModelShow(X, b=b, s=1/a, c=c, d=d, m=0, prior="uniform")
##D  total     <- rowSums(X)
##D  pourcent  <- total/nItems * 100
##D  pCorrect  <- numeric(dim(essai)[1])
##D  for ( i in (1:dim(essai)[1]))
##D   pCorrect[i] <- propCorrect(essai$T[i],0,0,0,s=1/a,b=b,c=c,d=d)
##D  resultLL  <- summary(essai, report="add", criteria="LL")
##D  resultLL  <- data.frame(resultLL, theta=theta, TS=S, TC=C, errorT=resultLL$T - theta,
##D                          total=total, pourcent=pourcent, tpcorrect=pCorrect)
##D  # If the only theta model is badly choosen
##D  results <- resultLL[which(resultLL$MODEL == "T" ),]
##D  byStats <- "TC"; ofStats <- "tpcorrect"
##D  MeansByThetaT <- cbind(
##D   aggregate(results[ofStats], by=list(Theta=factor(results[,byStats]) ),
##D             mean, na.rm=TRUE),
##D   aggregate(results[ofStats], by=list(Theta=factor(results[,byStats])), sd, na.rm=TRUE),
##D   aggregate(results["SeT"], by=list(Theta=factor(results[,byStats])), mean, na.rm=TRUE),
##D   aggregate(results[ofStats], by=list(theta=factor(results[,byStats])), length)
##D   )[,-c(3,5,7)]
##D   names(MeansByThetaT) <- c("C", "pCorrect", "seE", "SeT", "n")
##D   MeansByThetaT[,-c(1,4,5)] <- round(MeansByThetaT[,-c(1,4,5)], 2)
##D   MeansByThetaT[,-c(4,5)]
##D  # Only for the TC model
##D  results <- resultLL[which(resultLL$MODEL == "TC" ),]
##D  byStats <- "TC"; ofStats <- "tpcorrect"
##D  MeansByThetaC <- cbind(
##D   aggregate(results[ofStats], by=list(Theta=factor(results[,byStats]) ),
##D             mean, na.rm=TRUE),
##D   aggregate(results[ofStats], by=list(Theta=factor(results[,byStats])), sd, na.rm=TRUE),
##D   aggregate(results["SeT"], by=list(Theta=factor(results[,byStats])), mean, na.rm=TRUE),
##D   aggregate(results[ofStats], by=list(theta=factor(results[,byStats])), length)
##D   )[,-c(3,5,7)]
##D   names(MeansByThetaC) <- c("C", "pCorrect", "seE", "SeT", "n")
##D   MeansByThetaC[,-c(1,4,5)] <- round(MeansByThetaC[,-c(1,4,5)], 2)
##D   MeansByThetaC[,-c(4,5)]
##D  # For the model choosen according to the LL criteria
##D  results <- resultLL[which(resultLL$critLL == TRUE),]
##D  byStats <- "TC"; ofStats <- "tpcorrect"
##D  MeansByThetaLL <- cbind(
##D   aggregate(results[ofStats], by=list(Theta=factor(results[,byStats]) ),
##D             mean, na.rm=TRUE),
##D   aggregate(results[ofStats], by=list(Theta=factor(results[,byStats])), sd, na.rm=TRUE),
##D   aggregate(results["SeT"], by=list(Theta=factor(results[,byStats])), mean, na.rm=TRUE),
##D   aggregate(results[ofStats], by=list(theta=factor(results[,byStats])), length)
##D   )[,-c(3,5,7)]
##D   names(MeansByThetaLL) <- c("C", "pCorrect", "seE", "SeT", "n")
##D   MeansByThetaLL[,-c(1,4,5)] <- round(MeansByThetaLL[,-c(1,4,5)], 2)
##D   MeansByThetaLL[,-c(4,5)]
##D   # Grapical comparison of the estimation of the ##D 
##D   # by means of the 3 preceeding models
##D   plot(MeansByThetaT$pCorrect   ~ levels(MeansByThetaT$C),  type="l", lty=1,
##D        xlab="Pseudo-Guessing", ylab="% of Correct Responses")
##D   lines(MeansByThetaC$pCorrect  ~ levels(MeansByThetaC$C),  type="l", lty=2)
##D   lines(MeansByThetaLL$pCorrect ~ levels(MeansByThetaLL$C), type="l", lty=3)
##D   text(x=0.60, y=0.80, "Without correction", cex=0.8)
##D   text(x=0.50, y=0.38, "Without Knowledge of the Correct Model", cex=0.8)
##D   text(x=0.65, y=0.50, "With Knowledge of the Correct Model", cex=0.8)
##D  
## End(Not run)
 



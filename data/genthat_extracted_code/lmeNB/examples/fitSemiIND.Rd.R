library(lmeNB)


### Name: fitSemiIND
### Title: Fit the semi-parametric negative binomial mixed-effect
###   independent model.
### Aliases: fitSemiIND
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D ## generate a simulated dataset from the negative binomial 
##D ## mixed-effect independent model:
##D ## Y_ij | G_i = g_i ~ NB(r_ij,p_i) where r_ij = exp(X^T beta)/a , p_i =1/(a*g_i+1)
##D ## with G_i is from unknown distribution
##D ## For the simulation purpose, G_i's are from the mixture of 
##D ## the gamma and the log-normal distributions.
##D 
##D 
##D sn <- 5 ## the number of repeated measures of each subject
##D n <- 80 ## the number of subjects
##D logtheta <- 1.3
##D th <- exp(logtheta) ## the parameter for the gamma distribution of g_i
##D loga <- -0.5
##D ## the parameter for the failure probability of the negative binomial distribution
##D a <- exp(loga) 
##D b0 <- 0.5
##D u1 <- rep(exp(b0),sn) ## the mean vector for group 1 at time point 1,...,sn
##D u2 <- rep(exp(b0),sn) ## the mean vector for group 2 at time point 1,...,sn
##D 
##D DT3 <- rNBME.R(gdist="GN", n=n, a=a, th=th, u1=u1, u2=u2, sn=sn,
##D 	       othrp=list(p.mx=0.1,u.n=3,s.n=1,sh.mx = NA) ## 0  < p.mx < 1
##D 	       )
##D 
##D ID <- DT3$id
##D dt3 <- data.frame(CEL=DT3$y)
##D 
##D Vcode <- rep(-1:(sn-2),n) # scan number -1, 0, 1, 2, 3
##D new <-Vcode>0         # new scans: 1,2,3
##D 
##D 
##D ## 1) Fit the negative binomial mixed-effect AR(1) model 
##D ## where random effects is from the gamma distribution
##D 
##D logitd <- -0.2
##D re.gamma.ar1 <- fitParaAR1(formula=CEL~1,data=dt3,ID=ID,
##D 		          Vcode=Vcode, 
##D 		          p.ini=c(loga,logtheta,logitd,b0), 
##D 		          ## log(a), log(theta), logit(d), b0
##D 		          RE="G", 
##D 		          IPRT=TRUE)
##D 
##D 
##D ## compute the estimates of the conditional probabilities 
##D ## with sum of the new repeated measure as a summary statistics 
##D ## i.se=FALSE,C=TRUE options for speed up!
##D Psum <- index.batch(olmeNB=re.gamma.ar1,data=dt3,ID=ID, Vcode=Vcode, 
##D                     labelnp=new,qfun="sum", IPRT=TRUE,i.se=FALSE,C=TRUE,i.tol=1E-3)  
##D 		 
##D 
##D 
##D ## 2) Fit the negative binomial mixed-effect AR(1) model 
##D ## where random effects is from the log-normal distribution
##D 
##D 
##D re.logn.ar1 <- fitParaAR1(formula=CEL~1,data=dt3,ID=ID,
##D 		          Vcode=Vcode, RE="N", IPRT=TRUE)
##D 
##D ## REQUIRES SOME TIME..
##D Psum <- index.batch(olmeNB=re.logn.ar1, data=dt3,ID=ID,Vcode=Vcode,
##D 	            labelnp=new,qfun="sum", IPRT=TRUE,i.se=FALSE,C=TRUE,i.tol=1E-3) 
##D 
##D 
##D 
##D ## 3) Fit the negative binomial independent model 
##D ## where random effects is from the gamma distribution
##D re.gamma.ind <- fitParaIND(formula=CEL~1,data=dt3,ID=ID, 
##D                            RE="G",IPRT=TRUE)
##D 
##D Psum <- index.batch(olmeNB=re.gamma.ind, data=dt3,ID=ID,Vcode=Vcode,
##D                     labelnp=new,qfun="sum", IPRT=TRUE,i.se=TRUE) 
##D 
##D 
##D 
##D ## 4) Fit the negative binomial independent model 
##D ## where random effects is from the lognormal distribution
##D re.logn.ind <- fitParaIND(formula=CEL~1,data=dt3,ID=ID, 
##D                           RE="N", 			   	
##D 		          p.ini=c(loga,logtheta,b0), 		
##D 		          IPRT=TRUE)
##D 
##D Psum <- index.batch(olmeNB=re.logn.ind,data=dt3,ID=ID,labelnp=new,qfun="sum", IPRT=TRUE) 
##D 
##D ## 5) Fit the semi-parametric negative binomial AR(1) model 
##D 
##D logvarG <- -0.4
##D 
##D re.semi.ar1 <- fitSemiAR1(formula=CEL~1,data=dt3,ID=ID,Vcode=Vcode)
##D Psum <- index.batch(olmeNB=re.semi.ar1,data=dt3,ID=ID,Vcode=Vcode, 
##D                     labelnp=new,qfun="sum", IPRT=TRUE,MC=TRUE,i.se=FALSE) 
##D 
##D 
##D ## 6) Fit the semi-parametric negative binomial independent model 
##D ## This is closest to the true model
##D re.semi.ind <- fitSemiIND(formula=CEL~1,data=dt3,ID=ID, p.ini=c(loga, logvarG, b0))
##D 
##D ## compute the estimates of the conditional probabilities 
##D ## with sum of the new repeated measure as a summary statistics 
##D Psum <- index.batch(olmeNB=re.semi.ind,data=dt3,ID=ID, labelnp=new, 
##D                     qfun="sum", IPRT=TRUE,i.se=FALSE) 
##D ## compute the estimates of the conditional probabilities 
##D ## with max of the new repeated measure as a summary statistics 
##D Pmax <- index.batch(olmeNB=re.semi.ind, data=dt3,ID=ID,labelnp=new, qfun="max", 
##D                     IPRT=TRUE,i.se=FALSE) 
##D 
##D 
##D ## Which patient's estimated probabilities based on the sum and max 
##D ## statistics disagrees the most?
##D ( IDBigDif <- which(rank(abs(Pmax$condProbSummary[,1]-Psum$condProbSummary[,1]))==80) )
##D ## Show the patient's CEL counts  
##D dt3$CEL[ID==IDBigDif]
##D ## Show the estimated conditional probabilities based on the sum summary statistics
##D Psum$condProbSummary[IDBigDif,]
##D ## Show the estimated conditional probabilities based on the max summary statistics
##D Pmax$condProbSummary[IDBigDif,]
##D 
##D 
##D ## ======================================================================== ##
##D ## == Which model performed the best in terms of the estimation of beta0 == ##
##D ## ======================================================================== ##
##D 
##D getpoints <- function(y,estb0,sdb0=NULL,crit=qnorm(0.975))
##D {	
##D points(estb0,y,col="blue",pch=16)
##D if (!is.null(sdb0))
##D {
##D points(c(estb0-crit*sdb0,estb0+crit*sdb0),rep(y,2),col="red",type="l")
##D }
##D }
##D ordermethod <- c("gamma.ar1","logn.ar1","gamma.ind","logn.ind","semi.ar1","semi.ind")
##D 
##D estb0s <- c(
##D re.gamma.ar1$est[4,1],
##D re.logn.ar1$est[4,1],
##D re.gamma.ind$est[3,1],
##D re.logn.ind$est[3,1],
##D re.semi.ar1$est[4],
##D re.semi.ind$est[3]
##D )
##D 
##D ## The true beta0 is:
##D b0
##D c <- 1.1
##D plot(0,0,type="n",xlim=c(min(estb0s)-0.5,max(estb0s)*c),ylim=c(0,7),yaxt="n",
##D main="Simulated from the independent model \n with random effect ~ mixture of normal and gamma")
##D 
##D legend("topright",
##D 	legend=ordermethod)
##D abline(v=b0,lty=3)
##D 
##D ## 1) gamma.ar1
##D sdb0 <- re.gamma.ar1$est[4,2]
##D getpoints(6,estb0s[1],sdb0)
##D 
##D ## 2)logn.ar1
##D sdb0 <- re.logn.ar1$est[4,2]
##D getpoints(5,estb0s[2],sdb0)
##D 
##D ## 3) gamma.ind
##D sdb0 <- re.gamma.ind$est[3,2]
##D getpoints(4,estb0s[3],sdb0)
##D 
##D ## 4) logn.ind
##D sdb0 <- re.logn.ind$est[3,2]
##D getpoints(3,estb0s[4],sdb0)
##D 
##D ## 5) semi.ar1
##D getpoints(2,estb0s[5])
##D 
##D ## 6) semi.ind
##D getpoints(1,estb0s[6])
## End(Not run)




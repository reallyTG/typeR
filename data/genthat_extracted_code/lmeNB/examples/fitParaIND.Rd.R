library(lmeNB)


### Name: fitParaIND
### Title: Performs the maximum likelihood estimation for the negative
###   binomial mixed-effect independent model
### Aliases: fitParaIND formulaToDat
### Keywords: ~kwd1 ~kwd2

### ** Examples



## Not run: 
##D 
##D ## ================================================================================ ##
##D ## generate a simulated dataset from the negative binomial mixed-effect independent model:
##D ## Y_ij | G_i = g_i ~ NB(r_ij,p_i) where r_ij = exp(X^T beta)/a , p_i =1/(a*g_i+1)
##D ## with G_i ~ Gamma(scale=th,shape=1/th)
##D set.seed(1)
##D sn <- 5 ## the number of repeated measures of each patient
##D n <- 80 ## the number of patients
##D loga <- - 0.5
##D a <- exp(loga) ## the parameter for the failure probability of the negative binomial distribution
##D logtheta <- 1.3
##D th <- exp(logtheta) ## the parameter for the gamma distribution of g_i
##D 
##D ## No difference between the means of groups 
##D ## The model only has an intercept term beta0 = 0.5
##D b0 <- 0.5
##D u1 <- rep(exp(b0),sn) ## the mean vector for group 1 at time point 1,...,sn
##D u2 <- rep(exp(b0),sn) ## the mean vector for group 2 at time point 1,...,sn
##D 
##D 
##D DT0 <- rNBME.R(gdist="G", n=n, a=a, th=th, u1=u1, u2=u2, sn=sn)
##D ID <- DT0$id
##D Vcode <- rep(-1:(sn-2),n) # scan number -1, 0, 1, 2, 3
##D new <- Vcode > 0 
##D dt1 <- data.frame(CEL=DT0$y)
##D logitd <- -0.5
##D 
##D ## ================================================================================ ##
##D 
##D 
##D ## [1]: Fit the negative binomial independent model 
##D ## where the random effects are from the gamma distribution. This is the true model.
##D 
##D re.gamma.ind <- fitParaIND(formula=CEL~1,data=dt1,ID=ID,RE="G", 
##D 	                  p.ini=c(loga,logtheta,b0),IPRT=TRUE)
##D ## compute the estimates of the conditional probabilities 
##D ## with sum of the new repeated measure as a summary statistics 
##D Psum <- index.batch(olmeNB=re.gamma.ind, ID=ID,data=dt1,
##D                     labelnp=new,qfun="sum", IPRT=TRUE) 
##D 
##D ## compute the estimates of the conditional probabilities 
##D ## with max of the new repeated measure as a summary statistics 
##D Pmax <- index.batch(olmeNB=re.gamma.ind, ID=ID,data=dt1,
##D                    labelnp=new,qfun="max", IPRT=TRUE)
##D 
##D ## Which patient's estimated probabilities 
##D ## based on the sum and max statistics disagrees the most?
##D ( IDBigDif <- which(rank(abs(Pmax$condProbSummary[,1]-Psum$condProbSummary[,1]))==80) )
##D ## Show the patient's CEL counts  
##D dt1$CEL[ID==IDBigDif]
##D ## Show the estimated conditional probabilities based on the sum summary statistics
##D Psum$condProbSummary[IDBigDif,]
##D ## Show the estimated conditional probabilities based on the max summary statistics
##D Pmax$condProbSummary[IDBigDif,]
##D 
##D 
##D 
##D ## [2]: Fit the negative binomial independent model 
##D ## where the random effects are from the lognormal distribution. 
##D re.logn.ind <- fitParaIND(formula=CEL~1,data=dt1,ID=ID, 
##D                           RE="N", 			   	
##D 		          p.ini=c(loga,logtheta,b0), 		
##D 		          IPRT=TRUE)
##D 
##D Psum <- index.batch(olmeNB=re.logn.ind, ID=ID,data=dt1,C=TRUE,
##D                    labelnp=new,qfun="sum", IPRT=TRUE) 
##D 
##D ## [3]: Fit the semi-parametric negative binomial independent model 
##D 
##D 
##D re.semi.ind <- fitSemiIND(formula=CEL~1,data=dt1,ID=ID)
##D 
##D Psum <- index.batch(olmeNB=re.semi.ind,ID=ID,data=dt1, i.se = FALSE,
##D                    labelnp=new, qfun="sum", IPRT=TRUE) 
##D 
##D 
##D 
##D ## [4]: Fit the negative binomial mixed-effect AR(1) model 
##D ## where random effects are from the gamma distribution
##D 
##D 
##D re.gamma.ar1 <- fitParaAR1(formula=CEL~1,data=dt1,ID=ID,
##D 		           p.ini=c(loga,logtheta,logitd,b0), 
##D 		           RE="G", Vcode=Vcode,
##D 		           IPRT=TRUE)
##D 
##D Psum <- index.batch(olmeNB=re.gamma.ar1, ID=ID,data=dt1, labelnp=new,Vcode=Vcode,
##D                     qfun="sum", IPRT=TRUE,i.se=FALSE) ## i.se=TRUE requires more time...
##D 	 
##D 
##D 
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
##D 
##D ordermethod <- c("gamma.ind","logn.ind","semi.ind","gamma.ar1")
##D 
##D estb0s <- c(
##D re.gamma.ind$est[3,1], 
##D re.logn.ind$est[3,1],
##D re.semi.ind$est[3],
##D re.gamma.ar1$est[4,1]
##D )
##D 
##D ## The true beta0 is:
##D b0
##D c <- 1.1
##D plot(0,0,type="n",xlim=c(min(estb0s)-0.5,max(estb0s)*c),
##D 	ylim=c(0,5),yaxt="n",
##D main="Simulated from the independent model \n with random effect ~ gamma")
##D 
##D legend("topright",
##D 	col="red",
##D 	legend=ordermethod)
##D abline(v=b0,lty=3)
##D 
##D ## [1] gamma.ind
##D sdb0 <- re.gamma.ind$est[3,2]
##D getpoints(4,estb0s[1],sdb0)
##D 
##D ## [2] logn.ind
##D sdb0 <- re.logn.ind$est[3,2]
##D getpoints(3,estb0s[2],sdb0)
##D 
##D ## [3] semi.ind
##D getpoints(2,estb0s[3])
##D 
##D ## [4] gamma.ar1
##D sdb0 <- re.gamma.ar1$est[4,2]
##D getpoints(1,estb0s[4],sdb0)
##D 
## End(Not run)





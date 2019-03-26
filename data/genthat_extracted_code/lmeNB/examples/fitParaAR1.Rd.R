library(lmeNB)


### Name: fitParaAR1
### Title: Performs the maximum likelihood estimation for the negative
###   binomial mixed-effect AR(1) model
### Aliases: fitParaAR1
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D 
##D ## ==================================================================================
##D ## generate a data based on the negative binomial mixed-effect AR(1) model.
##D ## Under this model, the response counts follows the negative binomial:
##D ## Y_ij | G_i = g_i ~ NB(r_ij,p_i) where r_ij = exp(X^T beta)/a , p_i =1/(a*g_i+1)
##D ## with G_i ~ Gamma(scale=th,shape=1/th)
##D ## 
##D ## The adjacent repeated measures of the same subject are correlated 
##D ## with correlation structure:
##D ## cov(Y_ij,Y_ij'|G_i=g_i)=d^{j-j'} E(Y_ij')*(a*g_i^2+g_i)  
##D 
##D loga <- -0.5
##D logtheta<- 1.3
##D logitd <- -0.2
##D b0 <- 0.5 ## no covariates; 
##D ## 80 subjects each with 5 scans
##D n <- 80
##D sn <- 5
##D 
##D set.seed(1)
##D DT2 <-  rNBME.R(gdist = "G",
##D                n = n, ## 	the total number of subjectss	       
##D 	       sn = sn,
##D 	       th=exp(logtheta),
##D                u1 = rep(exp(b0),sn),
##D 	       u2 = rep(exp(b0),sn),
##D 	       a = exp(loga),
##D 	       d = exp(logitd)/(1+exp(logitd))
##D 	      )
##D Vcode <- rep(-1:(sn-2),n) # scan number -1, 0, 1, 2, 3
##D ID <- DT2$id
##D new <- Vcode > 0
##D dt2 <- data.frame(CEL=DT2$y)
##D 
##D ## ================================================================================
##D 
##D ## 1) Fit the negative binomial mixed-effect AR(1) model 
##D ## where the random effects are from the gamma distribution
##D ## This is the true model
##D 
##D re.gamma.ar1 <- fitParaAR1(formula=CEL~1,data=dt2,ID=ID,
##D 		           Vcode=Vcode, 
##D 		           p.ini=c(loga,logtheta,logitd,b0), 
##D 		           ## log(a), log(theta), logit(d), b0
##D 		           RE="G", 
##D 		           IPRT=TRUE) 
##D 
##D 
##D 
##D ## compute the estimates of the conditional probabilities 
##D ## with sum of the new repeated measure as a summary statistics 
##D ## Note C=TRUE with i.tol=1E-3 options compute the index faster
##D ## i.se=TRUE requires more time
##D Psum <- index.batch(olmeNB=re.gamma.ar1,data=dt2,ID=ID,Vcode=Vcode,
##D 	 	   labelnp=new,qfun="sum", IPRT=TRUE,i.se=FALSE,C=TRUE,i.tol=1E-3)  
##D 		 
##D 
##D ## compute the estimates of the conditional probabilities 
##D ## with max of the new repeated measure as a summary statistics 
##D Pmax <-index.batch(olmeNB=re.gamma.ar1,data=dt2,ID=ID,Vcode=Vcode, 
##D                   labelnp=new,qfun="max", IPRT=TRUE,i.se=FALSE,C=TRUE,i.tol=1E-3)
##D 
##D ## Which patient's estimated probabilities based on the sum and max 
##D ## statistics disagrees the most?
##D ( IDBigDif <- which(rank(abs(Pmax$condProbSummary[,1]-Psum$condProbSummary[,1]))==80) )
##D ## Show the patient's CEL counts  
##D dt2$CEL[ID==IDBigDif]
##D ## Show the estimated conditional probabilities based on the sum summary statistics
##D Psum$condProbSummary[IDBigDif,]
##D ## Show the estimated conditional probabilities based on the max summary statistics
##D Pmax$condProbSummary[IDBigDif,]
##D 
##D 
##D ## 2) Fit the negative binomial mixed-effect AR(1) model 
##D ## where random effects is from the log-normal distribution
##D 
##D re.logn.ar1 <- fitParaAR1(formula=CEL~1,data=dt2,ID=ID,
##D 		          Vcode=Vcode, 
##D 		          p.ini=c(loga,logtheta,logitd,b0), ## log(a), log(theta), logit(d), b0
##D    		          RE="N",IPRT=TRUE)
##D 
##D Psum <- index.batch(olmeNB=re.logn.ar1,data=dt2,ID=ID,Vcode=Vcode, 
##D                     labelnp=new,qfun="sum", IPRT=TRUE,i.se=FALSE,C=TRUE,i.tol=1E-3) 
##D re.logn.ar1$Psum <- Psum
##D 
##D 
##D ## 3) Fit the negative binomial independent model 
##D ## where random effects are from the gamma distribution
##D re.gamma.ind <- fitParaIND(formula=CEL~1,data=dt2,ID=ID, 
##D                            RE="G", 
##D 	         	   p.ini=c(loga,logtheta,b0), 
##D 		           IPRT=TRUE)
##D 
##D Psum <- index.batch(olmeNB=re.gamma.ind,data=dt2,ID=ID, 
##D                     labelnp=new,qfun="sum", IPRT=TRUE,i.se=TRUE)  
##D 
##D 
##D 
##D ## 4) Fit the negative binomial independent model 
##D ## where random effects are from the lognormal distribution
##D re.logn.ind <- fitParaIND(formula=CEL~1,data=dt2,ID=ID, 
##D                           RE="N", 			   	
##D 		          p.ini=c(loga,logtheta,b0), 		
##D 		          IPRT=TRUE)
##D 
##D Psum <- index.batch(olmeNB=re.logn.ind, data=dt2,ID=ID, 
##D                    labelnp=new,qfun="sum", IPRT=TRUE,i.se=TRUE) 
##D 
##D 
##D ## 5) Fit the semi-parametric negative binomial AR(1) model 
##D 
##D logvarG <- -0.5
##D re.semi.ar1 <- fitSemiAR1(formula=CEL~1,data=dt2,ID=ID, 
##D                           p.ini=c(loga, logvarG, logitd,b0),Vcode=Vcode)
##D Psum <- index.batch(olmeNB=re.semi.ar1,data=dt2,ID=ID, Vcode=Vcode,
##D 	       	    labelnp=new,qfun="sum", IPRT=TRUE,i.se=FALSE)  
##D 
##D 
##D ## 6) Fit the semi-parametric negative binomial independent model 
##D re.semi.ind <- fitSemiIND(formula=CEL~1,data=dt2,ID=ID, p.ini=c(loga, logvarG, b0))
##D Psum <- index.batch(olmeNB=re.semi.ind,data=dt2,ID=ID,  
##D                    labelnp=new, qfun="sum", IPRT=TRUE,i.se=FALSE) 
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
##D main="Simulated from the AR(1) model \n with random effect ~ gamma")
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
##D 
##D 
## End(Not run)





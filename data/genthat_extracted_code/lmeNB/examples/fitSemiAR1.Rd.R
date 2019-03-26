library(lmeNB)


### Name: fitSemiAR1
### Title: Fit the semi-parametric negative binomial mixed-effect AR(1)
###   model.
### Aliases: fitSemiAR1
### Keywords: ~kwd1 ~kwd2

### ** Examples


## Not run: 
##D ## ================================================================================ ##
##D ## generate a data based on the semi-parametric negative binomial 
##D ## mixed-effect AR(1) model.
##D ## Under this model, the response counts follows the negative binomial:
##D ## Y_ij | G_i = g_i ~ NB(r_ij,p_i) where r_ij = exp(X^T beta)/a , p_i =1/(a*g_i+1)
##D ## G_i is from unknown distribution.
##D ## For simulation purpose, we generate the sample of gi from 
##D ## the mixture of three gamma distribuions.
##D 
##D ## The adjacent repeated measures of the same subjects are correlated 
##D ## with correlation structure:
##D ## cov(Y_ij,Y_ij'|G_i=g_i)=d^{j-j'} E(Y_ij')*(a*g_i^2+g_i)  
##D 
##D # log(a) = -0.5, log(th)=1.3, logit(delta) = -0.2
##D # b0 =  0.5, no covariates; 
##D loga <- -0.5
##D logtheta <- 1.3
##D logitd <- -0.2
##D b0 <- 0.5
##D # 80 subjects each with 5 scans
##D n <- 80
##D sn <- 5
##D 
##D ## generate a sample of size B from the mixture of three gamma distribution:
##D p1 <- 0.5  
##D p2 <- 0.3
##D B <- 1000
##D sampledG<- c(
##D rgamma(n=p1*B,scale=1,shape=10),
##D rgamma(n=p2*B,scale=3,shape=5),
##D rgamma(n=(1-p1-p2)*B,scale=5,shape=5)
##D )
##D 
##D 
##D ## mean is set to 1;
##D sampledG <- sampledG/mean(sampledG) 
##D logvarG <- log(var(sampledG))
##D ## hist(sampledG)
##D 
##D DT4 <-  rNBME.R(gdist = "NoN",
##D                n = n, ## 	the total number of subjectss	       
##D 	       sn = sn,
##D                u1 = rep(exp(b0),sn),
##D 	       u2 = rep(exp(b0),sn),
##D 	       a = exp(loga),
##D 	       d = exp(logitd)/(1+exp(logitd)),
##D 	       othrp = sampledG
##D 	      )
##D Vcode<-rep(-1:(sn-2),n) # scan number -1, 0, 1, 2, 3
##D ID <- DT4$id
##D new <- Vcode > 0
##D dt4<-data.frame(CEL=DT4$y)
##D ## ================================================================================ ##
##D 
##D ## [1] Fit the negative binomial mixed-effect AR(1) model 
##D ## where random effects is from the gamma distribution
##D 
##D 
##D re.gamma.ar1 <- fitParaAR1(formula=CEL~1,data=dt4,ID=ID,
##D 		         Vcode=Vcode, 
##D 		          p.ini=c(loga,logtheta,logitd,b0), 
##D 		          ## log(a), log(theta), logit(d), b0
##D 		          RE="G", 
##D 		          IPRT=TRUE)
##D 
##D Psum<-index.batch(olmeNB=re.gamma.ar1, data=dt4,ID=ID,Vcode=Vcode,
##D 	          labelnp=new,qfun="sum", IPRT=TRUE,i.se=FALSE) 
##D 
##D 
##D 
##D ## [2] Fit the negative binomial mixed-effect AR(1) model 
##D ## where random effects is from the log-normal distribution
##D 
##D 
##D re.logn.ar1<-fitParaAR1(formula=CEL~1,data=dt4,ID=ID,
##D 		        Vcode=Vcode, 
##D 		        p.ini=c(loga,logtheta,logitd,b0), 
##D 		        ## log(a), log(theta), logit(d), b0
##D 		        RE="N", IPRT=TRUE)
##D 
##D ## Requires some time
##D Psum<-index.batch(olmeNB=re.logn.ar1,data=dt4,ID=ID,Vcode=Vcode,
##D 	          labelnp=new,qfun="sum", IPRT=TRUE) 
##D 
##D 
##D 
##D ## [3] Fit the negative binomial independent model 
##D ## where random effects is from the lognormal distribution
##D re.logn.ind<-fitParaIND(formula=CEL~1,data=dt4,ID=ID, 
##D                         RE="N", 			   	
##D 		        p.ini=c(loga,logtheta,b0), 		
##D 		        IPRT=TRUE)
##D 
##D Psum <- index.batch(olmeNB=re.logn.ind,data=dt4,ID=ID,
##D                     labelnp=new,qfun="sum", IPRT=TRUE) 
##D 
##D 
##D ## [4] Fit the semi-parametric negative binomial AR(1) model 
##D ## This model is closest to the true model
##D 
##D logvarG <- log(var(sampledG))
##D 
##D re.semi.ar1 <- fitSemiAR1(formula=CEL~1,data=dt4,ID=ID, 
##D                           p.ini=c(loga, logvarG, logitd,b0),Vcode=Vcode)
##D  
##D ## compute the estimates of the conditional probabilities 
##D ## with sum of the new repeated measure as a summary statistics 
##D Psum <- index.batch(olmeNB=re.semi.ar1, labelnp=new,data=dt4,ID=ID,Vcode=Vcode,
##D                     qfun="sum", IPRT=TRUE,i.se=TRUE) 
##D 
##D ## compute the estimates of the conditional probabilities 
##D ## with max of the new repeated measure as a summary statistics 
##D Pmax <- index.batch(olmeNB=re.semi.ar1, labelnp=new,qfun="max",data=dt4,ID=ID,Vcode=Vcode,
##D                     IPRT=TRUE,i.se=TRUE) 
##D 
##D ## Which patient's estimated probabilities 
##D ## based on the sum and max statistics disagrees the most?
##D ( IDBigDif <- which(rank(abs(Pmax$condProbSummary[,1]-Psum$condProbSummary[,1]))==80) )
##D ## Show the patient's CEL counts  
##D dt4$CEL[ID==IDBigDif]
##D ## Show the estimated conditional probabilities based on the sum summary statistics
##D Psum$condProbSummary[IDBigDif,1]
##D ## Show the estimated conditional probabilities based on the max summary statistics
##D Pmax$condProbSummary[IDBigDif,1]
##D 
##D 
##D ## [5] Fit the semi-parametric negative binomial independent model 
##D 
##D 
##D re.semi.ind <- fitSemiIND(formula=CEL~1,data=dt4,ID=ID, p.ini=c(loga, logvarG, b0))
##D Psum <- index.batch(olmeNB=re.semi.ind, labelnp=new,
##D                     data=dt4,ID=ID, qfun="sum", IPRT=TRUE,i.se=TRUE) 
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
##D ordermethod <- c("gamma.ar1","logn.ar1","logn.ind","semi.ar1","semi.ind")
##D 
##D estb0s <- c(
##D re.gamma.ar1$est[4,1],
##D re.logn.ar1$est[4,1],
##D re.logn.ind$est[3,1],
##D re.semi.ar1$est[4],
##D re.semi.ind$est[3]
##D )
##D 
##D ## The true beta0 is:
##D b0
##D c <- 1.1
##D plot(0,0,type="n",xlim=c(min(estb0s)-0.5,max(estb0s)*c),ylim=c(0,7),yaxt="n",
##D main <- "Simulated from the AR(1) model \n with random effect ~ a semi-parametric distribution")
##D 
##D legend("topright",
##D 	legend=ordermethod)
##D abline(v=b0,lty=3)
##D 
##D ## [1] gamma.ar1
##D sdb0 <- re.gamma.ar1$est[4,2]
##D getpoints(6,estb0s[1],sdb0)
##D 
##D ## [2] logn.ar1
##D sdb0 <- re.logn.ar1$est[4,2]
##D getpoints(5,estb0s[2],sdb0)
##D 
##D ## [3] logn.ind
##D sdb0 <- re.logn.ind$est[3,2]
##D getpoints(4,estb0s[3],sdb0)
##D 
##D ## [4] semi.ar1
##D getpoints(3,estb0s[4])
##D 
##D ## [5] semi.ind
##D getpoints(2,estb0s[5])
##D 
## End(Not run)




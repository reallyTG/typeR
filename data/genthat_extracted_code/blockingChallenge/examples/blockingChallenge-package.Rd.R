library(blockingChallenge)


### Name: blockingChallenge-package
### Title: Create Blocks or Strata which are Similar Within
### Aliases: blockingChallenge-package blockingChallenge
### Keywords: package

### ** Examples

## Not run: 
##D data(wls)
##D library(optmatch)
##D wls4match <- wls
##D 
##D ## This code replicates the blocking algorithm used in the paper
##D ##	Karmakar, Small, and Rosenbaum (2018).
##D 
##D ## Create the distance matrix
##D 
##D distmat1 <- smahal(wls4match[,"gwiiq_bm"]) 				## IQ
##D 
##D ## Father's and mother's edu and parent's income
##D distmat2 <- smahal(wls4match[,c("edfa57q.NoNA", "edmo57q.NoNA", "bmpin1.NoNA",	
##D               ## Father's and mother's edu and parent's income
##D               "incg400", "incg250")])				
##D               ## Indicators for income in the top 5##D 
##D 			  
##D ## occupation score
##D distmat2.2 <- smahal(wls4match[,c("ocsf57.NoNA", "ocpf57.NoNA")])		
##D 
##D ## missing indicators
##D distmat3 <- smahal(wls4match[,c("edfa57q.miss", "edmo57q.miss", 	
##D               "bmpin1.miss", "ocsf57.miss", "ocpf57.miss")])
##D 
##D ## The IQ = gwiiq_bm is given more weight.
##D ##  parents' education and parent's income 
##D distmat = distmat1*10+6*distmat2+3*distmat2.2+2*distmat3
##D 
##D ## creating the blocks.  This can take about 30min to run.
##D ##	May take more time depending of the computation power of the system.
##D set.seed(0841)
##D res.20.2 = makeblocks(distmat, bsize=25, Itr=250, maxItr=250, .data=wls4match)
##D 
##D 
##D ## Here we provide the code for the 
##D ##  analysis of the wls data for the effect of 
##D ##	Catholic schooling on earning later in life. 
##D ## This code reproduces the computation presented 
##D ##   in the paper Karmakar, Small, and Rosenbaum (2018).
##D 
##D ## Some reorganization of the data set
##D d <- res.20.2$.data
##D religion<-d$relfml*1
##D religion<-factor(religion,levels=c(1,0),
##D 			labels=c("Catholic","Other"),ordered=T)
##D urban<-d$res57Dic*1
##D urban<-factor(urban,levels=c(1,0),labels=c("Urban","Rural"),ordered=T)
##D school<-factor(d$hsdm57*1,levels=c(1,0),
##D 			labels=c("Catholic","Public"),ordered=T)
##D d<-cbind(d,religion,urban,school)
##D rm(religion,urban,school)
##D d$yrwg74[d$yrwg74<0]<-NA
##D 
##D ## Create table 1
##D d3<-d[d$strata>0,]
##D dim(d3)
##D t1<-rep(table(d3$urban),4)
##D t2<-rep(table(d3$religion:d3$urban),2)
##D t3<-table(d3$school:d3$religion:d3$urban)
##D t1a<-rep(round(100*tapply(1*(d3$school=="Catholic"),d3$urban,mean)),4)
##D t2a<-rep(round(100*tapply(1*(d3$school=="Catholic"),d3$religion:d3$urban,mean)),2)
##D t3a<-round(100*tapply(1*(d3$school=="Catholic"),
##D                d3$school:d3$religion:d3$urban,mean))
##D tab1<-cbind(t3,t2,t1,t3a,t2a,t1a)
##D tab1<-tab1[c(1,5,3,7,2,6,4,8),c(3,2,1,6,5,4)]
##D round(tab1)
##D rm(d3)
##D 
##D ## Create plots in Figure 1
##D 
##D ##  A supplementary function
##D densityit<-function(x,main="",yl=""){
##D   who<-d$strata>0
##D   s<-d$strata[who]
##D   x<-x[who]
##D   a<-aov(x~factor(s))
##D   x<-x[order(s)]
##D   xm<-matrix(x,25,length(unique(s)))
##D   xbar<-apply(xm,2,mean,na.rm=TRUE)
##D   xc<-xm-outer(rep(1,25),xbar,"*")
##D   fval<-round(as.vector(anova(a)$F),1)[1]
##D   adj<-mean(x,na.rm=TRUE)+as.vector(xc)
##D   tmp<-c(x,adj)
##D   mx<-max(tmp,na.rm=TRUE)
##D   mn<-min(tmp,na.rm=TRUE)
##D   sub<-paste("     F = ",fval)
##D   sdall<-round(sd(x,na.rm=TRUE),1)
##D   sdwithin<-round(sqrt(anova(a)$Mean[2]),1)
##D   sub<-paste("st. dev: all=",sdall,", within=",sdwithin,sub,sep="")
##D   plot(density(adj[!is.na(adj)],adjust=4),xlim=c(mn,mx),
##D                main=main,xlab=yl,sub=sub,cex.sub=.9)
##D   lines(density(x[!is.na(x)]),lty=2)
##D   abline(v=mean(x,na.rm=TRUE),lty=1,col="grey")
##D }
##D 
##D ## Plot for IQ
##D densityit(d$gwiiq_bm,main="IQ Before High School",yl="IQ")
##D 
##D 
##D ## The following code shows the steps 
##D ##  of calculating the upper bounds of one p-values in Table 2
##D ## 	of the paper Karmakar, Small, and Rosenbaum (2018).
##D ## Please see the paper for details of the analysis and the
##D ##  relevant references.
##D 
##D library(senstrat)
##D library(sensitivitymv)
##D ## Some preliminary 
##D d2<-d[d$strata>0,]
##D d2$strata<-factor(d2$strata)
##D wages<-d2$yrwg74/10 # convert from hundreds to thousands
##D wages[wages<0]<-NA
##D d2<-cbind(d2,wages)
##D d2<-d2[!is.na(d2$wages),]
##D rm(wages)
##D library(MASS)
##D 
##D ## van Elteren's rank test for two sample
##D ## tests with multiple strata
##D VEwilcoxon<-function (y, z, st, tau = 0) { 
##D   ymiss<-is.na(y)
##D   y<-y[!ymiss]
##D   z<-z[!ymiss]
##D   st<-st[!ymiss]
##D   if (is.factor(st))   st <- as.integer(st)
##D   ust <- sort(unique(st))
##D   nst <- length(ust)
##D   if (tau != 0)     y <- y - tau * z
##D   sc <- rep(NA, length(y))
##D   for (i in 1:nst) {
##D     who <- (st == ust[i])
##D     yi <- y[who]
##D     vi <- rank(yi)/(length(yi)+1)
##D     sc[who] <- vi
##D   }
##D   list(sc=sc,z=z,st=st)
##D }
##D 
##D ## A function that calculates one row 
##D ##	of Table 2
##D calculatePval <- function(y, gamma){
##D     ws<-VEwilcoxon(y,1*(urban=="Urban"),strata)
##D     rurban<-senstrat(ws$sc,ws$z,ws$st,gamma=gamma,detail=TRUE)
##D     purban<-rurban$LinearBoundResult[1]
##D 
##D     ws<-VEwilcoxon(y,1*(religion=="Catholic"),strata:urban)
##D     rreligion<-senstrat(ws$sc,ws$z,ws$st,gamma=gamma,detail=TRUE)
##D     preligion<-rreligion$LinearBoundResult[1]
##D 
##D     ws<-VEwilcoxon(y,1*(school=="Catholic"),strata:religion:urban)
##D     rdirect<-senstrat(ws$sc,ws$z,ws$st,gamma=gamma,detail=TRUE)
##D     pdirect<-rdirect$LinearBoundResult[1]
##D 
##D     pcomb<-truncatedP(c(preligion,purban,pdirect))
##D     result<-c(purban,preligion,pdirect,pcomb)
##D     names(result)<-c("urban","religion","direct","combination")
##D     round(result, 4)
##D }
##D 
##D attach(d2)
##D 
##D ## The second row on the top part of the table (i.e., 
##D ##  stratified analysis w/o covariate adjustment)
##D calculatePval(y=wages, gamma=1.1)
##D #      urban    religion      direct combination 
##D #     0.0000      0.0835      0.0422      0.0000
##D 
##D ## Stratified analysis with covariate adjustment
##D 
##D l2bmpin1.NoNA<-log2(1+bmpin1.NoNA)
##D 
##D ## Testing for H0: beta=\$0
##D md<-rlm(wages~gwiiq_bm+edfa57q.miss+edmo57q.miss+bmpin1.miss+
##D           ocsf57.miss+edfa57q.NoNA+edmo57q.NoNA+l2bmpin1.NoNA+
##D           ocsf57.NoNA+ocpf57.NoNA+strata)
##D 
##D y<-md$residual
##D calculatePval(y, gamma=1.1)
##D #      urban    religion      direct combination 
##D #     0.0001      0.1115      0.0667      0.0001
##D 	 
##D ## Testing for H0: beta=\$500
##D wages<-d2$yrwg74
##D wages1 = (wages*100)-500*1*(school=="Catholic")
##D md<-rlm(wages1~gwiiq_bm+edfa57q.miss+edmo57q.miss+bmpin1.miss+
##D            ocsf57.miss+edfa57q.NoNA+edmo57q.NoNA+l2bmpin1.NoNA+
##D            ocsf57.NoNA+ocpf57.NoNA+strata)
##D 
##D y<-md$residual
##D calculatePval(y, gamma=1.1)
##D #      urban    religion      direct combination 
##D #     0.0005      0.3105      0.4345      0.0110
## End(Not run)




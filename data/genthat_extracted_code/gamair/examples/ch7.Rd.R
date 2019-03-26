library(gamair)


### Name: ch7
### Title: Code for Chapter 7: GAMs in Practice: mgcv
### Aliases: ch7

### ** Examples

library(gamair); library(mgcv)
## NOTE: Examples are marked 'Not run' to save CRAN check time

## 7.1.1 using smooth constructors

library(mgcv); library(MASS) ## load for mcycle data.
## set up a smoother...
sm <- smoothCon(s(times,k=10),data=mcycle,knots=NULL)[[1]]
## use it to fit a regression spline model...
beta <- coef(lm(mcycle$accel~sm$X-1))
with(mcycle,plot(times,accel)) ## plot data
times <- seq(0,60,length=200)  ## create prediction times
## Get matrix mapping beta to spline prediction at 'times'
Xp <- PredictMat(sm,data.frame(times=times))
lines(times,Xp%*%beta) ## add smooth to plot

## Not run: 
##D ## 7.2 Brain scan
##D ## 7.2.1 preliminary modelling
##D require(gamair); require(mgcv); data(brain)
##D brain <- brain[brain$medFPQ>5e-3,] # exclude 2 outliers
##D m0 <- gam(medFPQ~s(Y,X,k=100),data=brain)
##D gam.check(m0)
##D 
##D e <- residuals(m0); fv <- fitted(m0)
##D lm(log(e^2)~log(fv))
##D 
##D m1<-gam(medFPQ^.25~s(Y,X,k=100),data=brain)
##D gam.check(m1)
##D m2<-gam(medFPQ~s(Y,X,k=100),data=brain,family=Gamma(link=log))
##D mean(fitted(m1)^4);mean(fitted(m2));mean(brain$medFPQ)
##D 
##D m2
##D vis.gam(m2,plot.type="contour",too.far=0.03,
##D         color="gray",n.grid=60,zlim=c(-1,2))
##D 
##D ## 7.2.2 additive?
##D m3 <- gam(medFPQ~s(Y,k=30)+s(X,k=30),data=brain,
##D           family=Gamma(link=log))
##D m3
##D AIC(m2,m3)
##D 
##D ## 7.2.3 isotropic or tensor 
##D tm <- gam(medFPQ~te(Y,X,k=10),data=brain,family=Gamma(link=log))
##D tm1 <- gam(medFPQ ~ s(Y,k=10,bs="cr") + s(X,bs="cr",k=10) +
##D            ti(X,Y,k=10), data=brain, family=Gamma(link=log))
##D AIC(m2,tm,tm1)
##D anova(tm1)
##D 
##D ## 7.2.4 Detecting symmetry
##D brain$Xc <- abs(brain$X - 64.5)
##D brain$right <- as.numeric(brain$X<64.5)
##D m.sy <- gam(medFPQ~s(Y,Xc,k=100),data=brain,
##D             family=Gamma(link=log))
##D m.as <- gam(medFPQ~s(Y,Xc,k=100)+s(Y,Xc,k=100,by=right),
##D             data=brain,family=Gamma(link=log))
##D m.sy
##D m.as
##D 
##D anova(m.as)
##D 
##D vis.gam(m.sy,plot.type="contour",view=c("Xc","Y"),too.far=.03,
##D         color="gray",n.grid=60,zlim=c(-1,2),main="both sides")
##D vis.gam(m.as,plot.type="contour",view=c("Xc","Y"),
##D         cond=list(right=0),too.far=.03,color="gray",n.grid=60,
##D         zlim=c(-1,2),main="left side")
##D vis.gam(m.as,plot.type="contour",view=c("Xc","Y"),
##D         cond=list(right=1),too.far=.03,color="gray",n.grid=60,
##D         zlim=c(-1,2),main="right side")
##D 
##D ## 7.2.5 Comparing surfaces
##D brain1 <- brain
##D mu <- fitted(m2)
##D n<-length(mu)
##D ind <- brain1$X<60 & brain1$Y<20
##D mu[ind] <- mu[ind]/3
##D set.seed(1)
##D brain1$medFPQ <- rgamma(rep(1,n),mu/m2$sig2,scale=m2$sig2)
##D 
##D brain2=rbind(brain,brain1)
##D brain2$sample1 <- c(rep(1,n),rep(0,n))
##D brain2$sample0 <- 1 - brain2$sample1
##D 
##D m.same<-gam(medFPQ~s(Y,X,k=100),data=brain2,
##D             family=Gamma(link=log))
##D m.diff<-gam(medFPQ~s(Y,X,k=100)+s(Y,X,by=sample1,k=100),
##D             data=brain2,family=Gamma(link=log))
##D AIC(m.same,m.diff)
##D anova(m.diff)
##D 
##D ## 7.2.6 Prediction
##D predict(m2)[1:5]
##D pv <- predict(m2,se=TRUE)
##D pv$fit[1:5]
##D pv$se[1:5]
##D 
##D predict(m2,type="response")[1:5]
##D pv <- predict(m2,type="response",se=TRUE)
##D pv$se[1:5]
##D 
##D pd <- data.frame(X=c(80.1,68.3),Y=c(41.8,41.8))
##D predict(m2,newdata=pd)
##D predict(m2,newdata=pd,type="response",se=TRUE)
##D 
##D predict(m3,newdata=pd,type="terms",se=TRUE)
##D 
##D Xp <- predict(m2,newdata=pd,type="lpmatrix")
##D fv <- Xp%*%coef(m2)
##D fv
##D d <- t(c(1,-1))
##D d%*%fv
##D d%*%Xp%*%m2$Vp%*%t(Xp)%*%t(d)
##D 
##D ## 7.2.7 Variance of non-linear function
##D 
##D ind <- brain$region==1& ! is.na(brain$region)
##D Xp <- predict(m2,newdata=brain[ind,],type="lpmatrix")
##D set.seed(8) ## for repeatability
##D br <- rmvn(n=1000,coef(m2),vcov(m2)) # simulate from posterior
##D mean.FPQ<-rep(0,1000)
##D for (i in 1:1000)
##D { lp <- Xp%*%br[i,]  # replicate linear predictor
##D   mean.FPQ[i] <- mean(exp(lp)) # replicate region 1 mean FPQ
##D }
##D mean.FPQ <- colMeans(exp(Xp%*%t(br)))
##D 
##D ## 7.3 Retinopathy
##D require(gamair); require(mgcv); data(wesdr)
##D k <- 7
##D b <- gam(ret ~ s(dur,k=k) + s(gly,k=k) + s(bmi,k=k) + 
##D          ti(dur,gly,k=k) + ti(dur,bmi,k=k) + ti(gly,bmi,k=k),
##D          select=TRUE, data=wesdr, family=binomial(), method="ML")
##D b
##D 
##D ## 7.4 Air pollution
##D data(chicago)
##D ap0 <- gam(death~s(time,bs="cr",k=200)+pm10median+so2median+
##D            o3median+tmpd,data=chicago,family=poisson)
##D gam.check(ap0)
##D 
##D par(mfrow=c(2,1))
##D plot(ap0,n=1000)  # n increased to make plot smooth
##D plot(ap0,residuals=TRUE,n=1000)
##D 
##D chicago$death[3111:3125]
##D 
##D ap1<-gam(death~s(time,bs="cr",k=200)+s(pm10median,bs="cr")+
##D      s(so2median,bs="cr")+s(o3median,bs="cr")+s(tmpd,bs="cr"),
##D      data=chicago,family=poisson)
##D 
##D ## 7.4.1 single index
##D 
##D lagard <- function(x,n.lag=6) {
##D   n <- length(x); X <- matrix(NA,n,n.lag)
##D   for (i in 1:n.lag) X[i:n,i] <- x[i:n-i+1] 
##D   X
##D }
##D dat <- list(lag=matrix(0:5,nrow(chicago),6,byrow=TRUE),
##D             death=chicago$death,time=chicago$time)
##D dat$pm10 <- lagard(chicago$pm10median)
##D dat$tmp <- lagard(chicago$tmpd)
##D dat$o3 <- lagard(chicago$o3median)
##D 
##D si <- function(theta,dat,opt=TRUE) {
##D ## Return ML if opt==TRUE or fitted gam otherwise.
##D   alpha <- c(1,theta) ## alpha defined via unconstrained theta
##D   kk <- sqrt(sum(alpha^2)); alpha <- alpha/kk  ## ||alpha||=1
##D   o3 <- dat$o3%*%alpha; tmp <- dat$tmp%*%alpha
##D   pm10 <- dat$pm10%*%alpha ## re-weight lagged covariates
##D   b<- bam(dat$death~s(dat$time,k=200,bs="cr")+s(pm10,bs="cr")+
##D           te(o3,tmp,k=8),family=poisson) ## fit model
##D   cat(".") ## give user something to watch
##D   if (opt) return(b$gcv.ubre) else {
##D     b$alpha <- alpha  ## add alpha to model object
##D     b$J <- outer(alpha,-theta/kk^2) ## get dalpha_i/dtheta_j
##D     for (j in 1:length(theta)) b$J[j+1,j] <- b$J[j+1,j] + 1/kk
##D     return(b)
##D   }
##D } ## si
##D 
##D ## WARNING: the next line takes around half an hour to run
##D 
##D f1 <- optim(rep(1,5),si,method="BFGS",hessian=TRUE,dat=dat)
##D 
##D apsi <- si(f1$par,dat,opt=FALSE)
##D apsi$alpha
##D 
##D ## 7.4.2 distributed lag...
##D 
##D apl <- bam(death~s(time,bs="cr",k=200)+te(pm10,lag,k=c(10,5))+
##D        te(o3,tmp,lag,k=c(8,8,5)),family=poisson,data=dat)
##D 
##D ## 7.5 Egg survey - less than a minute
##D ## 7.5.1 Model development
##D data(mack)
##D mack$log.net.area <- log(mack$net.area)
##D 
##D gmtw <- gam(egg.count ~ s(lon,lat,k=100) + s(I(b.depth^.5))+ 
##D        s(c.dist) + s(salinity) + s(temp.surf) + s(temp.20m)+
##D        offset(log.net.area),data=mack,family=tw,method="REML",
##D        select=TRUE)
##D gm2 <- gam(egg.count ~ s(lon,lat,k=100) + s(I(b.depth^.5)) + 
##D          s(c.dist) + s(temp.20m) + offset(log.net.area),
##D          data=mack,family=tw,method="REML")
##D gm2
##D 
##D ## 7.5.2 model predictions
##D data(mackp); data(coast)
##D mackp$log.net.area <- rep(0,nrow(mackp))
##D lon <- seq(-15,-1,1/4); lat <- seq(44,58,1/4)
##D zz<-array(NA,57*57); zz[mackp$area.index]<-predict(gm2,mackp)  
##D image(lon,lat,matrix(zz,57,57),col=gray(0:32/32),
##D       cex.lab=1.5,cex.axis=1.4)
##D contour(lon,lat,matrix(zz,57,57),add=TRUE)
##D lines(coast$lon,coast$lat,col=1)
##D 
##D set.seed(4) ## make reproducable
##D br1 <- rmvn(n=1000,coef(gm2),vcov(gm2))
##D Xp <- predict(gm2,newdata=mackp,type="lpmatrix")
##D mean.eggs1 <- colMeans(exp(Xp%*%t(br1)))
##D hist(mean.eggs1)
##D 
##D ## 7.5.3 alternative
##D 
##D gmgr <- gam(egg.count ~s(lon,lat,k=100)+s(lon,lat,by=temp.20m)
##D         +s(lon,lat,by=I(b.depth^.5)) +offset(log.net.area),
##D         data=mack,family=tw,method="REML")
##D 
##D ## 7.6 Larks - about a minute
##D library(gamair); data(bird)
##D bird$n <- bird$y/1000;bird$e <- bird$x/1000
##D m1 <- gam(crestlark~s(e,n,k=100),data=bird,family=binomial,
##D           method="REML")
##D m1
##D 
##D m2 <- gam(crestlark ~ s(e,n,bs="ds",m=c(1,.5),k=100),data=bird,family=binomial,
##D           method="REML")
##D 	  
##D REML <- r <- 1:10*10 
##D for (i in 1:length(r)) { 
##D   mt <- gam(crestlark ~ s(e,n,bs="gp",m=c(3,r[i]),k=100),
##D         data=bird,family=binomial,method="REML")
##D   REML[i] <- mt$gcv.ubre
##D   if (i==1||REML[i]==REML0) { m3 <- mt; REML0 <- REML[i]}
##D }
##D AIC(m1,m2,m3)
##D 
##D bird$tet.n <- bird$N <- rep(1,nrow(bird))
##D bird$N[is.na(as.vector(bird$crestlark))] <- NA
##D ba <- aggregate(data.matrix(bird), by=list(bird$QUADRICULA),
##D                 FUN=sum, na.rm=TRUE)
##D ba$e <- ba$e/ba$tet.n; ba$n <- ba$n/ba$tet.n
##D 
##D m10 <- gam(cbind(crestlark,N-crestlark) ~ s(e,n,k=100),
##D            data=ba, family=binomial, method="REML")
##D library(geoR)
##D coords<-matrix(0,nrow(ba),2);coords[,1]<-ba$e;coords[,2]<-ba$n
##D gb<-list(data=residuals(m10,type="d"),coords=coords)
##D plot(variog(gb,max.dist=100))
##D plot(fitted(m10),residuals(m10))
##D 
##D ## 7.7.1 Sole egg GAMM
##D ## Chapter 3 preliminaries...
##D data(sole)
##D sole$off <- log(sole$a.1-sole$a.0)# model offset term
##D sole$a<-(sole$a.1+sole$a.0)/2     # mean stage age
##D solr<-sole                        # make copy for rescaling
##D solr$t<-solr$t-mean(sole$t)
##D solr$t<-solr$t/var(sole$t)^0.5
##D solr$la<-solr$la-mean(sole$la)
##D solr$lo<-solr$lo-mean(sole$lo)
##D 
##D ## GAMM fit...
##D solr$station <- factor(with(solr,paste(-la,-lo,-t,sep="")))     
##D som <- gamm(eggs~te(lo,la,t,bs=c("tp","tp"),k=c(25,5),d=c(2,1))
##D             +s(t,k=5,by=a)+offset(off), family=quasipoisson,
##D             data=solr,random=list(station=~1))
##D som$gam
##D som1 <- bam(eggs~te(lo,la,t,bs=c("tp","tp"),k=c(25,5),d=c(2,1))
##D             + s(t,k=5,by=a)+offset(off)+s(station,bs="re"),
##D 	        family=quasipoisson,data=solr)
##D gam.vcomp(som1)
##D som$lme
##D ## boundary and knots for soap...
##D bnd <- list(list(lo=c(-6.74,-5.72,-5.7 ,-5.52,-5.37,-5.21,-5.09,-5.02,
##D           -4.92,-4.76,-4.64,-4.56,-4.53,-4.3,-4.16,-3.8 ,-3.8,-5.04,-6.76,
##D 	  -6.74),
##D           la=c(50.01,50.02,50.13,50.21,50.24,50.32,50.41,50.54,50.59,50.64,
##D 	  50.74,50.86,51.01,51  ,51.2,51.22,51.61,51.7,51.7,50.01)))
##D 
##D knt <- list(lo=c(-4.643,-5.172,-5.638,-6.159,-6.665,-6.158,-5.656,-5.149,
##D   -4.652,-4.154,-3.901,-4.146,-4.381,-4.9,-5.149,-5.37,-5.866,-6.36,-6.635,
##D   -6.12,-5.626,-5.117,-4.622,-4.695,-4.875,-5.102,-5.609,-5.652,-5.141,
##D   -5.354,-5.843,-6.35,-6.628,-6.127,-5.63,-5.154,-5.356,-5.652,-5.853,
##D   -6.123),
##D    la=c(51.626,51.61,51.639,51.638,51.376,51.377,51.373,51.374,51.374,
##D    51.376,51.379,51.226,51.129,51.194,51.083,51.147,51.129,51.151,50.901,
##D    50.891,50.959,50.958,50.942,50.728,50.676,50.818,50.825,50.684,50.693,
##D    50.568,50.564,50.626,50.397,50.451,50.443,50.457,50.325,50.193,50.322,
##D    50.177))
##D    
##D sole$station <- solr$station ## station to sole data
##D 
##D som2 <- bam(eggs ~ te(lo,la,t,bs=c("sw","cr"),k=c(40,5),
##D             d=c(2,1),xt=list(list(bnd=bnd),NULL)) +
##D             s(t,k=5,by=a) + offset(off) + s(station,bs="re"),
##D             knots=knt, family=quasipoisson, data=sole)
##D 
##D ## 7.7.2 Cairo temperature
##D data(cairo)
##D ctamm <- gamm(temp~s(day.of.year,bs="cc",k=20)+s(time,bs="cr"),
##D          data=cairo,correlation=corAR1(form=~1|year))
##D summary(ctamm$gam)
##D intervals(ctamm$lme,which="var-cov")
##D ctamm$gam$sig2/ctamm$gam$sp
##D plot(ctamm$gam,scale=0,pages=1)
##D 
##D REML <- rho <- 0.6+0:20/100
##D for (i in 1:length(rho)) {
##D   ctbam <- bam(temp~s(day.of.year,bs="cc",k=20)+s(time,bs="cr"),
##D                data=cairo,rho=rho[i])
##D   REML[i] <- ctbam$gcv.ubre
##D }
##D rho[REML==min(REML)]
##D 
##D ## 7.7.3 Fully Bayesian
##D ## Not currently included (requires editing of JAGS file)
##D 
##D ## 7.7.4 Random wiggly curves
##D data(sitka)
##D sitka$id.num <- as.factor(sitka$id.num)
##D b <- gamm(log.size~s(days) + ozone + ozone:days +
##D           s(days,id.num,bs="fs",k=5),data=sitka)
##D plot(b$gam,pages=1)
##D 
##D 
##D ## 7.8 survival
##D require(survival)
##D data(pbc) ## loads pbcseq also
##D pbc$status1 <- as.numeric(pbc$status==2)
##D pbc$stage <- factor(pbc$stage)
##D b0 <- gam(time ~ trt+sex+stage+s(sqrt(protime))+s(platelet)+ 
##D           s(age)+s(bili)+s(albumin)+s(sqrt(ast))+s(alk.phos),
##D           weights=status1,family=cox.ph,data=pbc)
##D 
##D b <- gam(time ~ trt+sex+s(sqrt(protime))+s(platelet)+ 
##D           s(age)+s(bili)+s(albumin),
##D           weights=status1,family=cox.ph,data=pbc)
##D 
##D anova(b)
##D par(mfrow=c(2,3))
##D plot(b); plot(b$linear.predictors,residuals(b))
##D 
##D par(mfrow=c(1,1))
##D ## create prediction data frame...
##D np <- 300
##D newd <- data.frame(matrix(0,np,0))
##D for (n in names(pbc)) newd[[n]] <- rep(pbc[[n]][25],np)
##D newd$time <- seq(0,4500,length=np)
##D ## predict and plot the survival function... 
##D fv <- predict(b,newdata=newd,type="response",se=TRUE)
##D plot(newd$time,fv$fit,type="l",ylim=c(0.,1),xlab="time",
##D      ylab="survival",lwd=2)
##D ## add crude one s.e. intervals...
##D lines(newd$time,fv$fit+fv$se.fit,col="grey")
##D lines(newd$time,fv$fit-fv$se.fit,col="grey")
##D ## and intervals based on cumulative hazard s.e...
##D se <- fv$se.fit/fv$fit
##D lines(newd$time,exp(log(fv$fit)+se))
##D lines(newd$time,exp(log(fv$fit)-se))
##D 
##D ## 7.8.1 time dependent
##D ## copy functions from ?cox.pht in mgcv...
##D 
##D app <- function(x,t,to) {
##D ## wrapper to approx for calling from apply...
##D    y <- if (sum(!is.na(x))<1) rep(NA,length(to)) else
##D         approx(t,x,to,method="constant",rule=2)$y
##D    if (is.factor(x)) factor(levels(x)[y],levels=levels(x)) else y
##D } ## app
##D 
##D tdpois <- function(dat,event="z",et="futime",t="day",
##D                              status="status1",id="id") {
##D ## dat is data frame. id is patient id; et is event time; t is
##D ## observation time; status is 1 for death 0 otherwise;
##D ## event is name for Poisson response.
##D    if (event %in% names(dat)) warning("event name in use")
##D    require(utils) ## for progress bar
##D    te <- sort(unique(dat[[et]][dat[[status]]==1])) ## event times
##D    sid <- unique(dat[[id]])
##D    prg <- txtProgressBar(min = 0, max = length(sid), initial = 0,
##D               char = "=",width = NA, title="Progress", style = 3)
##D    ## create dataframe for poisson model data
##D    dat[[event]] <- 0; start <- 1
##D    dap <- dat[rep(1:length(sid),length(te)),]
##D    for (i in 1:length(sid)) { ## work through patients
##D      di <- dat[dat[[id]]==sid[i],] ## ith patient's data
##D      tr <- te[te <= di[[et]][1]] ## times required for this patient
##D      ## Now do the interpolation of covariates to event times...
##D      um <- data.frame(lapply(X=di,FUN=app,t=di[[t]],to=tr))
##D      ## Mark the actual event...
##D      if (um[[et]][1]==max(tr)&&um[[status]]==1) um[[event]][nrow(um)] <- 1 
##D      um[[et]] <- tr ## reset time to relevant event times
##D      dap[start:(start-1+nrow(um)),] <- um ## copy to dap
##D      start <- start + nrow(um)
##D      setTxtProgressBar(prg, i)
##D    }
##D    close(prg)
##D    dap[1:(start-1),]
##D } ## tdpois
##D 
##D ## model fitting...
##D 
##D data(pbc)
##D pbcseq$status1 <- as.numeric(pbcseq$status==2) ## deaths
##D pb <- tdpois(pbcseq) ## conversion
##D pb$tf <- factor(pb$futime) ## add factor for event time
##D 
##D b <- bam(z ~ tf - 1  +  trt + s(sqrt(protime)) + s(platelet) + 
##D          s(age) + s(bili) + s(albumin) + s(sqrt(ast)),
##D          family=poisson,data=pb,discrete=TRUE,nthreads=2)
##D 
##D chaz <- tapply(fitted(b),pb$id,sum) ## cum. hazard by subject
##D d <- tapply(pb$z,pb$id,sum) ## censoring indicator
##D mrsd <- d - chaz ## Martingale residuals
##D drsd <- sign(mrsd)*sqrt(-2*(mrsd + d*log(chaz))) ## deviance
##D 
##D te <- sort(unique(pb$futime)) ## event times
##D di <- pbcseq[pbcseq$id==25,] ## data for subject 25
##D ## interpolate to te using app from ?cox.pht...
##D pd <- data.frame(lapply(X=di,FUN=app,t=di$day,to=te)) 
##D pd$tf <- factor(te)
##D X <- predict(b,newdata=pd,type="lpmatrix")
##D eta <- drop(X%*%coef(b)); H <- cumsum(exp(eta))
##D J <- apply(exp(eta)*X,2,cumsum)
##D se <- diag(J%*%vcov(b)%*%t(J))^.5
##D par(mfrow=c(1,2))
##D plot(stepfun(te,c(1,exp(-H))),do.points=FALSE,ylim=c(0.7,1),
##D      ylab="S(t)",xlab="t (days)",main="",lwd=2)
##D lines(stepfun(te,c(1,exp(-H+se))),do.points=FALSE)
##D lines(stepfun(te,c(1,exp(-H-se))),do.points=FALSE)
##D rug(pbcseq$day[pbcseq$id==25]) ## measurement times
##D 
##D er <- pbcseq[pbcseq$id==25,]
##D plot(er$day,er$ast);lines(te,pd$ast)
##D 
##D ## 7.9 Location scale
##D 
##D library(MASS);library(mgcv)
##D b <- gam(list(accel~s(times,bs="ad"),~s(times,bs="ad")),
##D          family=gaulss,data=mcycle)
##D 
##D ## 7.9.1 Extreme rainfall
##D library(mgcv);library(gamair);data(swer)
##D b0 <- gam(list(exra ~ s(nao)+ s(elevation)+ climate.region+
##D                       te(N,E,year,d=c(2,1),k=c(20,5)),
##D       ~ s(year)+ s(nao)+ s(elevation)+ climate.region+ s(N,E),
##D 	      ~ s(elevation)+ climate.region),family=gevlss,data=swer)
##D 
##D b <- gam(list(exra~ s(nao)+s(elevation)+climate.region+s(N,E),
##D          ~ s(year)+ s(elevation)+ climate.region+ s(N,E),
##D 	        ~ climate.region),family=gevlss,data=swer)
##D plot(b,scale=0,scheme=c(1,1,3,1,1,3),contour.col="white",pages=1)
##D 
##D mu <- fitted(b)[,1];rho <- fitted(b)[,2]; xi <- fitted(b)[,3]
##D fv <- mu + exp(rho)*(gamma(1-xi)-1)/xi
##D 
##D Fi.gev <- function(z,mu,sigma,xi) { ## GEV inverse cdf.
##D   xi[abs(xi)<1e-8] <- 1e-8 ## approximate xi=0, by small xi
##D   x <- mu + ((-log(z))^-xi-1)*sigma/xi
##D }
##D mb <- coef(b);Vb <- vcov(b) ## posterior mean and cov
##D b1 <- b ## copy fitted model object to modify
##D n.rep <- 1000; br <- rmvn(n.rep,mb,Vb) ## posterior sim
##D n <- length(fitted(b))
##D sim.dat <- cbind(data.frame(rep(0,n*n.rep)),swer$code)
##D for (i in 1:n.rep) {
##D   b1$coefficients <- br[i,] ## copy sim coefs to gam object
##D   X <- predict(b1,type="response");ii <- 1:n + (i-1)*n
##D   sim.dat[ii,1] <- Fi.gev(runif(n),X[,1],exp(X[,2]),X[,3])
##D }
##D 
##D stm <- tapply(sim.dat[,1],sim.dat[,2],mean)
##D st98 <- tapply(sim.dat[,1],sim.dat[,2],quantile,probs=0.98)
##D 
##D ## 7.10 Multivariate
##D library(mgcv); library(gamair); data(mpg)
##D b <- gam(list(city.mpg ~ fuel +style +drive +s(weight) +s(hp)
##D                          + s(make,bs="re"),
##D                 hw.mpg ~ fuel +style +drive +s(weight) +s(hp)
##D                          + s(make,bs="re")),
##D                family = mvn(d=2) , data = mpg)
##D 
##D b1 <- gam(list(city.mpg ~ fuel +style +drive +s(hp) +s(weight)
##D                           + s(make,bs="re"),
##D                  hw.mpg ~ fuel +style +drive +s(make,bs="re"),
##D                     1+2 ~ s(weight) +s(hp) -1),
##D                family = mvn(d=2) , data = mpg)
##D 
##D ## 7.11 FDA
##D ## 7.11.1 scalar-on-function
##D data(gas)
##D b <- gam(octane~s(nm,by=NIR,k=50),data=gas)
##D par(mfrow=c(1,2))
##D plot(b,scheme=1,col=1)
##D plot(fitted(b),gas$octane)
##D 
##D ## Prostate...
##D data(prostate)
##D b <- gam(type ~ s(MZ,by=intensity,k=100),family=ocat(R=3),
##D          data=prostate,method="ML")
##D par(mfrow=c(1,3))
##D plot(b,rug=FALSE,scheme=1,xlab="Daltons",ylab="f(D)",
##D      cex.lab=1.6,cex.axis=1.4)
##D pb <- predict(b,type="response") ## matrix of class probs
##D plot(factor(prostate$type),pb[,3])
##D qq.gam(b,rep=100,lev=.95)
##D 
##D prostate$type1 <- prostate$type - 1 ## recode for multinom
##D b1 <- gam(list(type1 ~ s(MZ,by=intensity,k=100),
##D                ~ s(MZ,by=intensity,k=100)),
##D           family=multinom(K=2),data=prostate)
##D plot(b1,pages=1,scheme=1,rug=FALSE)
##D 
##D ## 7.11.2 Canadian weather
##D require(gamair);require(lattice);data(canWeather)
##D xyplot(T~time|region,data=CanWeather,type="l",groups=place)
##D 
##D aic <- reml <- rho <- seq(0.9,0.99,by=.01)
##D for (i in 1:length(rho)) {
##D   b <- bam(T ~ region + s(time,k=20,bs="cr",by=region) +
##D            s(time,k=40,bs="cr",by=latitude),
##D            data=CanWeather,AR.start=time==1,rho=rho[i])
##D   aic[i] <- AIC(b); reml[i] <- b$gcv.ubre
##D }
## End(Not run)





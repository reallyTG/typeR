library(StagedChoiceSplineMix)


### Name: StagedChoiceSplineMix
### Title: Performs iterations between an EM algorithm for a mixture of
###   two-stage logistic regressions with fixed candidate knots and knot
###   movements
### Aliases: StagedChoiceSplineMix

### ** Examples

#######################################
###### 1. Generate data (simdata) #####
set.seed(77)
k<-3

betab<-matrix(c(1.5,2.0,0.3,-0.2,-0.1,0.6,-2.5,0.5,1,3,-1,1,2,-0.5,-1.5),5,k,byrow=TRUE)
betaw<-matrix(c(-2.0,-1,0.3,-0.3,-0.2,0.2,-3,-2,0,3,2,-1.5,3,2,-1),5,k,byrow=TRUE)
sp1.knots<-matrix(c(8,14,4,11,5,15,5,12,5,13,7,14),3,4,byrow=TRUE)
lambda<-c(0.3,0.3,0.4)

# Large data set
#n_id<-700
#nobsb<-200

# Small data set
n_id<-100
nobsb<-100

nb<-n_id*nobsb

idb <- rep(1:n_id, each=nobsb)

xb.1<-rbinom(nb,size=1,prob=0.7)
xb.com<-cbind(1,xb.1)
xb.sp1<-runif((nb),-2,2)
xb<-cbind(xb.com,xb.sp1)

sp1.mat.b<- matrix(double(20*nb),ncol=20)
sp1.mat.b[,1]<-xb.sp1
sp1.quan<-quantile(xb.sp1,c(0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,
0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95))

for (i in 1:19){
   sp1.mat.b[,(i+1)]<-xb.sp1-sp1.quan[i]
}
sp1.mat.b[sp1.mat.b<0]<-0
sp1.mat.b[,1]<-xb.sp1

xb.class<-list()
for (i in 1:k){
  xb.class[[i]]<-cbind(xb.com,sp1.mat.b[,1],sp1.mat.b[,(sp1.knots[i,1:2])+1])
}

xbetab<-matrix(double(nb*k),ncol=k)
for (i in 1:k){
  xbetab[,i]<-data.matrix(xb.class[[i]])%*%betab[,i]
}

num.idb<-as.vector(ddply(data.frame(idb),"idb",count)[,-1])

w<-sample(c(1:k), n_id, replace = TRUE, prob = lambda)
wb<-rep(w,num.idb)
yb.temp<-matrix(double(nb*k),ncol=k)

for (i in 1:k){
  yb.temp[,i]<-rbinom((nb), size = 1, prob = (1/(1+exp(-xbetab[, i]))))
}
yb<-sapply(1:nb, function(i) yb.temp[i,wb[i]])

idw<-idb[yb==1]
nw<-length(idw)
sp1.mat.w<-sp1.mat.b[yb==1,]
xw.com<-xb.com[yb==1,]
xw<-xb[yb==1,]

xw.class<-list()
for (i in 1:k){
  xw.class[[i]]<-cbind(xw.com,sp1.mat.w[,1],sp1.mat.w[,(sp1.knots[i,3:4])+1])
}

xbetaw<-matrix(double(nw*k),ncol=k)
for (i in 1:k){
  xbetaw[,i]<-data.matrix(xw.class[[i]])%*%betaw[,i]
}

num.idw<-as.vector(ddply(data.frame(idw),"idw",count)[,-1])
ww<-wb[yb==1]

yw.temp<-matrix(double(nw*k),ncol=k)
for (i in 1:k){
  yw.temp[,i]<-rbinom((nw), size = 1, prob = (1/(1+exp(-xbetaw[, i]))))
}
yw<-sapply(1:nw, function(i) yw.temp[i,ww[i]])

yb.aug<-cbind(1:length(yb),yb)
yw.aug<-cbind(which(yb==1),yw)

colnames(yb.aug)[1]<-"num"
colnames(yw.aug)[1]<-"num"

ybyw<-merge(yb.aug,yw.aug, all = TRUE)[,-1]

simdata<-cbind(idb,ybyw,xb.1,sp1.mat.b[,1])
simdata[is.na(simdata)]<-""
simdata[,3]<-as.integer(simdata[,3])
colnames(simdata)[1]<-"userid"
colnames(simdata)[2]<-"browsed"
colnames(simdata)[3]<-"wrote"
colnames(simdata)[4]<-"x1"
colnames(simdata)[5]<-"sp1"

########################################
##### 2. Run StagedChoiceSplineMix #####
## number of latent classes
set.seed(66)
k<-3

## starting points: true parameters used in the data generation (optional)
betab<-matrix(c(1.5,2.0,0.3,-0.2,-0.1,0.6,-2.5,0.5,1,3,-1,1,2,-0.5,-1.5),5,k,byrow=TRUE)
betaw<-matrix(c(-2.0,-1,0.3,-0.3,-0.2,0.2,-3,-2,0,3,2,-1.5,3,2,-1),5,k,byrow=TRUE)
lambda<-c(0.3,0.3,0.4)

## number of random multiple starting points to try given a knot configuration
nst<-1

## vector of the columns of spline variables in the data set (required)
sp.cols<-5

# vector of the numbers of candidate knots for splined variables (optional)
num.knots<-19

## true knot configuration used in the data generation
sp1.knots<-matrix(c(8,14,4,11,5,15,5,12,5,13,7,14),3,4,byrow=TRUE)

## list of knot configuration of spline variables (optional)
sp.knots<-list(sp1.knots)

## Run "StagedChoiceSplineMix"
out<-StagedChoiceSplineMix(data=simdata, M=1, sp.cols=sp.cols, num.knots, sp.knots,
betab, betaw, lambda, k=k, nst=nst, epsilon=1e-06, maxit=500, maxrestarts=100, maxer=20)

## output
out$loglike  # vector of  M log-likelihoods
out$best$loglik # log-likelihood of the best output
out$best$betab # betab estimates of the best output
out$best$betaw # betaw estimates of the best output
out$best$lambda # lambda estimates of the best output
out$best$sp.knots # knot configuration of the best output





### R code from vignette source 'qle_with_R.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: qle_with_R.Rnw:1083-1085
###################################################
options(useFancyQuotes="UTF-8")
options(digits=4, prompt="R> ")


###################################################
### code chunk number 2: qle_with_R.Rnw:1168-1170
###################################################
library(qle)
data(mm1q)


###################################################
### code chunk number 3: qle_with_R.Rnw:1173-1177 (eval = FALSE)
###################################################
## options(mc.cores=8L)
## options(qle.multicore="mclapply")
## RNGkind("L'Ecuyer-CMRG")
## set.seed(1326)


###################################################
### code chunk number 4: qle_with_R.Rnw:1184-1188
###################################################
cond <- list("n"=100)
simfn <- function(tet,cond){
	mean(rgeom(cond$n,prob=1-tet[1]))
}


###################################################
### code chunk number 5: qle_with_R.Rnw:1192-1194
###################################################
lb <- c("rho"=0.05)
ub <- c("rho"=0.95)


###################################################
### code chunk number 6: qle_with_R.Rnw:1200-1204 (eval = FALSE)
###################################################
## nsim <- 10
## X <- multiDimLHS(N=9,lb=lb,ub=ub,
##       method="maximinLHS",type="matrix")
## sim <- simQLdata(sim=simfn,cond=cond,nsim=nsim,X=X)


###################################################
### code chunk number 7: qle_with_R.Rnw:1206-1209
###################################################
sim <- mm1q$sim
X <- attr(sim,"X")
nsim <- attr(sim,"nsim")


###################################################
### code chunk number 8: qle_with_R.Rnw:1215-1217 (eval = FALSE)
###################################################
## qsd <- getQLmodel(sim, lb, ub, obs=c("N"=1),
## 		var.type="wlogMean",verbose=TRUE)


###################################################
### code chunk number 9: qle_with_R.Rnw:1221-1222 (eval = FALSE)
###################################################
## S0 <- qscoring(qsd,x0=c("rho"=0.8))


###################################################
### code chunk number 10: qle_with_R.Rnw:1224-1227
###################################################
OPT <- mm1q$OPT
qsd <- mm1q$qsd
S0 <- mm1q$S0


###################################################
### code chunk number 11: qle_with_R.Rnw:1229-1230
###################################################
print(S0)


###################################################
### code chunk number 12: qle_with_R.Rnw:1244-1249 (eval = FALSE)
###################################################
## OPT <- qle(qsd,simfn,cond=cond,	     	
##   global.opts = list("maxeval"=5, "NmaxLam"=5),
##   local.opts = list("nextSample"="score","weights"=0.5,
##                     "ftol_abs"=1e-4, "lam_max"=1e-5),
##   method = c("qscoring","bobyqa","direct"), iseed=1326) 


###################################################
### code chunk number 13: qle_with_R.Rnw:1254-1273
###################################################
library(graphics)
# statistics
op <- par(xaxs='i', yaxs='i')
rho <- as.matrix(seq(0.1,0.9,by=0.001))
y <- as.numeric(unlist(simQLdata(sim=simfn,cond=cond,nsim=nsim,X=rho,mode="mean")))
T <- qsd$qldata[grep("mean.",names(qsd$qldata))]
Y <- predictKM(qsd$covT,rho,X,T,krig.type="var")
# steady state values
y0 <- rho/(1-rho)
plot(NULL, type="n", xlab=expression(rho),
		ylab="y",xlim=c(0,1), ylim=c(0,10))
lines(as.numeric(rho),y,col="black",lt=2,lwd=0.3)
lines(as.numeric(rho),Y,col="blue",lwd=0.3)
lines(as.numeric(rho),y0,col="red",lwd=0.3)
legend("topleft", c("Number of customers in the system",
	"Expected number at steady state","Kriging approximation"),
		lty=c(2,1,1),col=c("black","red","blue"),
		xpd=TRUE,pt.cex=1,cex=1)
par(op)


###################################################
### code chunk number 14: qle_with_R.Rnw:1275-1297
###################################################
op <- par(xaxs='i', yaxs='i')
p <- seq(lb,ub,by=0.0001)
QD <- quasiDeviance(X,qsd,value.only=TRUE)
qd <- quasiDeviance(as.matrix(p),qsd)
y <- sapply(qd,"[[","value")
score <- sapply(qd,"[[","score")
## plot quasi-deviance and quasi-score function
plot(NULL, type="n", xlab=expression(rho),
		ylab="",xlim=c(0,1), ylim=c(-10,50))
abline(h=0,col="gray")
points(X,QD,pch=3,cex=1)
lines(p,score, type='l',col="blue",lwd=1.5) 
lines(p,y,col="black",lwd=0.8)
legend("topright", c("quasi-deviance","quasi-score","sample points", "approximate root","additional samples"),
		lty=c(1,1),lwd=c(1.5,1.5,NA,NA,NA),pch=c(NA,NA,3,5,8),
		col=c("black","blue","black","magenta","green"),pt.cex=1,cex=1)
points(S0$par,S0$val,col="magenta",pch=5,cex=1)
nmax <- OPT$ctls["maxeval","val"]
X <- as.matrix(qsd$qldata[,1])
Xnew <- OPT$qsd$qldata[(nrow(X)+1):(nrow(X)+nmax),1]
points(cbind(Xnew,0),pch=8,cex=2,col="green")
par(op)


###################################################
### code chunk number 15: qle_with_R.Rnw:1305-1306
###################################################
OPT


###################################################
### code chunk number 16: qle_with_R.Rnw:1311-1330
###################################################
op <-par(xaxs='i', yaxs='i')
qd <- quasiDeviance(as.matrix(p),OPT$qsd)
y <- sapply(qd,"[[","value")
score <- sapply(qd,"[[","score")
## plot quasi-deviance and quasi-score function
plot(NULL, type="n", xlab=expression(rho),
		ylab="",xlim=c(0,1), ylim=c(-10,50))
abline(h=0,col="gray")
lines(p,score, type='l',col="blue",lwd=1.5) 
lines(p,y,col="black",lwd=0.8)
legend("topright", c("quasi-deviance","quasi-score","sample points", "QL estimate"),
		lty=c(1,1),lwd=c(1,1,NA,NA,NA),pch=c(NA,NA,3,5,8),
		col=c("black","blue","black","magenta","green"),pt.cex=1,cex=1)

X <- as.matrix(OPT$qsd$qldata[,1])
QD <- quasiDeviance(X,OPT$qsd,value.only=TRUE)
points(X,QD,pch=3,cex=1)
points(OPT$par,OPT$val,col="magenta",pch=5)
par(op)


###################################################
### code chunk number 17: qle_with_R.Rnw:1340-1341
###################################################
checkMultRoot(OPT,verbose = TRUE)


###################################################
### code chunk number 18: qle_with_R.Rnw:1351-1354
###################################################
X <- as.matrix(OPT$qsd$qldata[,1])
Tstat <- OPT$qsd$qldata[grep("mean.",names(qsd$qldata))]   
predictKM(OPT$qsd$covT,c("rho"=0.5),X,Tstat)


###################################################
### code chunk number 19: qle_with_R.Rnw:1393-1395 (eval = FALSE)
###################################################
## tet0 <- c("rho"=0.5)
## obs0 <- simQLdata(sim=simfn,cond=cond,nsim=100,X=tet0)


###################################################
### code chunk number 20: qle_with_R.Rnw:1397-1399
###################################################
tet0 <- mm1q$tet0
obs0 <- mm1q$obs0


###################################################
### code chunk number 21: qle_with_R.Rnw:1404-1411
###################################################
mle <- do.call(rbind,
		lapply(obs0[[1]],function(y,n){
               tet <- 1-1/(1+y[[1]])
               c("mle.rho"=tet,"mle.var"=(tet*(1-tet)^2)/n)
            }, n=cond$n))
x <- mle[,1]-tet0
mle.var <- c(sum(x^2)/length(x),mean(mle[,2]))


###################################################
### code chunk number 22: qle_with_R.Rnw:1415-1427 (eval = FALSE)
###################################################
## OPTS <- parLapply(cl,obs0[[1]],
##           function(obs,...) {
##            qle(...,obs=obs)
##           },
##          qsd=qsd,
##          sim=simfn, 
##          cond=cond,
##          global.opts=list("maxeval"=10,"NmaxLam"=10),
##          local.opts=list("nextSample"="score","weights"=0.5,
##                          "ftol_abs"=1e-4,"lam_max"=1e-5,
##                          "useWeights"=TRUE),
##          method=c("qscoring","bobyqa","direct"))


###################################################
### code chunk number 23: qle_with_R.Rnw:1429-1430
###################################################
OPTS <- mm1q$OPTS


###################################################
### code chunk number 24: qle_with_R.Rnw:1432-1441
###################################################
# get results
QLE <- do.call(rbind,
        lapply(OPTS,
          function(x) {
           c("qle"=x$par,"qle.var"=1/as.numeric(x$final$I))
		  }))
y <- QLE[,1]-tet0
# MSE and average estimated variance of the parameters
qle.var <- c(sum(y^2)/length(y),mean(QLE[,2]))


###################################################
### code chunk number 25: qle_with_R.Rnw:1443-1444
###################################################
Stest0 <- mm1q$Stest0


###################################################
### code chunk number 26: qle_with_R.Rnw:1473-1474 (eval = FALSE)
###################################################
## Stest0 <- qleTest(OPT,sim=simfn,cond=cond,obs=obs0,cl=cl)


###################################################
### code chunk number 27: qle_with_R.Rnw:1476-1477
###################################################
print(Stest0)


###################################################
### code chunk number 28: qle_with_R.Rnw:1506-1510
###################################################
data(normal)
OPT <- qsd$OPT
QS <- qsd$QS
simfunc <- qsd$simfn


###################################################
### code chunk number 29: qle_with_R.Rnw:1512-1520 (eval = FALSE)
###################################################
## # use a local cluster
## cl <- makeCluster(8L)
## clusterSetRNGStream(cl,1234)
## # simulation function
## simfunc <- function(pars) {	
## 	x <- rnorm(10,mean=pars["mu"],sd=pars["sigma"])    
## 	c("T1"=median(x),"T2"=mad(x))	
## }


###################################################
### code chunk number 30: qle_with_R.Rnw:1525-1527 (eval = FALSE)
###################################################
## lb <- c("mu"=0.5,"sigma"=0.1)
## ub <- c("mu"=8.0,"sigma"=5.0)


###################################################
### code chunk number 31: qle_with_R.Rnw:1533-1537 (eval = FALSE)
###################################################
## sim <- simQLdata(sim=simfunc,
##    nsim=10,N=8,lb=lb,ub=ub,method="maximinLHS")
## # reset number of simulations (10 x 10)  
## attr(sim,"nsim") <- 100


###################################################
### code chunk number 32: qle_with_R.Rnw:1543-1544 (eval = FALSE)
###################################################
## obs <- structure(c("T1"=2,"T2"=1),class="simQL")


###################################################
### code chunk number 33: qle_with_R.Rnw:1547-1548 (eval = FALSE)
###################################################
## qsd <- getQLmodel(sim,lb,ub,obs,var.type="wcholMean")


###################################################
### code chunk number 34: qle_with_R.Rnw:1552-1553 (eval = FALSE)
###################################################
## QS <- qscoring(qsd, x0=c("mu"=5,"sigma"=3.0))


###################################################
### code chunk number 35: qle_with_R.Rnw:1555-1556
###################################################
print(QS)


###################################################
### code chunk number 36: qle_with_R.Rnw:1565-1571 (eval = FALSE)
###################################################
## OPT <- qle(qsd,
##         simfunc,		
##         nsim=20,
##         global.opts=list("maxeval"=50),
##         local.opts=list("lam_max"=1e-3,"weights"=0.5,
##         "useWeights"=FALSE,"test"=TRUE),cl=cl)


###################################################
### code chunk number 37: qle_with_R.Rnw:1573-1574
###################################################
OPT


###################################################
### code chunk number 38: qle_with_R.Rnw:1578-1620
###################################################
op <- par(mfrow=c(1, 2), mar=c(5.1, 4.1, 1.1, 1.1),
		oma=c(5,4,1,1),xaxs='i', yaxs='i',
		cex=2.2, cex.axis=2.2, cex.lab=2.2)
# get points for plotting
theta0 <- c("T1"=2,"T2"=1)
x <- seq(qsd$lower[1],qsd$upper[1],by=0.05)
y <- seq(qsd$lower[2],qsd$upper[2],by=0.05)
p <- as.matrix(expand.grid(x,y))
X <- as.matrix(qsd$qldata[,1:2])
Tstat <- qsd$qldata[grep("mean.",names(qsd$qldata))]
Xp <- quasiDeviance(X,qsd,value.only=TRUE)
D <- quasiDeviance(p,qsd,value.only=TRUE)
z <- matrix(D,ncol=length(y))
Xnext <- as.matrix(OPT$qsd$qldata[,1:2])
Dnext <- quasiDeviance(p,OPT$qsd,value.only=TRUE)
znext <- matrix(Dnext,ncol=length(y))
nmax <- OPT$ctls["maxeval","val"]
Xnew <- OPT$qsd$qldata[(nrow(X)+1):(nrow(X)+nmax),c(1,2)]
# left
plot(x=0,y=0,type="n", xlim=range(x),ylim=range(y),
	 xlab=expression(mu),ylab=expression(sigma))
contour(x,y,z,col="black",lty="solid",nlevels=50,add=TRUE)
#
points(X,pch=23,cex=2,bg="black")
points(Xnew,pch=8,cex=2,col="green")
# right
plot(x=0,y=0,type="n", xlim=range(x),ylim=range(y),
	 xlab=expression(mu),ylab=expression(sigma))
contour(x,y,znext,col="black",lty="solid",nlevels=50,add=TRUE)
points(Xnext,pch=23,cex=2,bg="black")
points(rbind(OPT$par),pch=18,cex=2.5,col="magenta")
points(rbind(unlist(theta0)),pch=17,cex=2.5,col="red")
# legend 
par(fig = c(0, 1, 0, 1), oma = c(0, 0, 0, 0), mar = c(0, 0, 0, 0), new = TRUE)
plot(0, 0, type = "n", bty = "n", xaxt = "n", yaxt = "n")
cols <- c("black","green","magenta","red")
legend("bottomleft",text.width=c(0.45,0.45,0.45,0.45),
		legend=c("initial design points", "new sample points",
				"estimated parameter","true parameter"),
		pch=c(23,8,18,17),col=cols,pt.bg=cols,bty='n',
		horiz=TRUE,xpd=TRUE,pt.cex=2.5,cex=2.5)
par(op)


###################################################
### code chunk number 39: qle_with_R.Rnw:1629-1630
###################################################
checkMultRoot(OPT,verbose=TRUE)


###################################################
### code chunk number 40: qle_with_R.Rnw:1638-1641
###################################################
obs0 <- simQLdata(simfunc,X=OPT$par,nsim=1000,mode="matrix")[[1]]
var(obs0)
attr(OPT$final,"Sigma")


###################################################
### code chunk number 41: qle_with_R.Rnw:1643-1644 (eval = FALSE)
###################################################
## stopCluster(cl)


###################################################
### code chunk number 42: qle_with_R.Rnw:1674-1680
###################################################
data(matclust)
OPT <- matclust$OPT
qsd <- matclust$qsd
cvm <- matclust$cvm
Stest <- matclust$Stest
library(spatstat)


###################################################
### code chunk number 43: qle_with_R.Rnw:1684-1686
###################################################
data(redwood)
fitMat <- kppm(redwood, ~1, "MatClust")


###################################################
### code chunk number 44: qle_with_R.Rnw:1689-1690
###################################################
fitMat$modelpar


###################################################
### code chunk number 45: qle_with_R.Rnw:1692-1694 (eval = FALSE)
###################################################
## RNGkind("L'Ecuyer-CMRG")
## set.seed(297)


###################################################
### code chunk number 46: qle_with_R.Rnw:1698-1707
###################################################
simStat <- function(X,cond){
 x <- Kest(X,r=cond$rr,correction="best")
 x <- x[[attr(x,"valu")]]
 x <- x[x>0]
 if(anyNA(x) || any(!is.finite(x))) {
   warning(.makeMessage("`NA`, `NaN` or `Inf` detected.","\n"))
   x <- x[!is.nan(x) & is.finite(x)]}
 return(c(intensity(X),x))	
}


###################################################
### code chunk number 47: qle_with_R.Rnw:1711-1715
###################################################
simClust <- function(theta,cond){
 X <- rMatClust(theta["kappa"],theta["R"],theta["mu"],win=cond$win)	
 simStat(X,cond)
}


###################################################
### code chunk number 48: qle_with_R.Rnw:1720-1724
###################################################
nsim <- 50
Nsample <- 12
cond <- list(win=owin(c(0, 2),c(0, 2)),
             rr=seq(0,0.3,by=0.05))


###################################################
### code chunk number 49: qle_with_R.Rnw:1727-1729
###################################################
lb <- c("kappa"=20,"R"=0.01,"mu"=1)
ub <- c("kappa"=30,"R"=0.25,"mu"=5)	 


###################################################
### code chunk number 50: qle_with_R.Rnw:1733-1737 (eval = FALSE)
###################################################
## cl <- makeCluster(8L)
## clusterSetRNGStream(cl)
## clusterCall(cl,fun=function(x) library("spatstat", character.only=TRUE))
## clusterExport(cl=cl,varlist=c("simStat"), envir=environment())


###################################################
### code chunk number 51: qle_with_R.Rnw:1741-1742 (eval = FALSE)
###################################################
## obs0 <- simStat(redwood,cond)


###################################################
### code chunk number 52: qle_with_R.Rnw:1745-1747 (eval = FALSE)
###################################################
## sim <- simQLdata(sim=simClust,cond=cond,nsim=nsim,
##           method="randomLHS",lb=lb,ub=ub,N=Nsample,cl=cl)


###################################################
### code chunk number 53: qle_with_R.Rnw:1750-1752 (eval = FALSE)
###################################################
## qsd <- getQLmodel(sim,lb,ub,obs0,criterion="qle",
##          var.type="kriging",verbose=TRUE)


###################################################
### code chunk number 54: qle_with_R.Rnw:1762-1763 (eval = FALSE)
###################################################
## cvm <- prefitCV(qsd, reduce=FALSE, verbose=TRUE)


###################################################
### code chunk number 55: qle_with_R.Rnw:1769-1770 (eval = FALSE)
###################################################
## crossValTx(qsd, cvm, type = "acve")


###################################################
### code chunk number 56: qle_with_R.Rnw:1772-1773
###################################################
matclust$ACVE


###################################################
### code chunk number 57: qle_with_R.Rnw:1778-1779 (eval = FALSE)
###################################################
## crossValTx(qsd, cvm, type = "mse")


###################################################
### code chunk number 58: qle_with_R.Rnw:1781-1782
###################################################
matclust$MSE


###################################################
### code chunk number 59: qle_with_R.Rnw:1793-1794 (eval = FALSE)
###################################################
## crossValTx(qsd, cvm, type = "ascve")


###################################################
### code chunk number 60: qle_with_R.Rnw:1796-1797
###################################################
matclust$ASCVE


###################################################
### code chunk number 61: qle_with_R.Rnw:1807-1808
###################################################
attr(cvm,"type") <- "max"


###################################################
### code chunk number 62: qle_with_R.Rnw:1812-1815
###################################################
x0 <- c("kappa"=24,"R"=0.08,"mu"=2.5)
searchMinimizer(x0,qsd,info=TRUE,
		method="direct",cvm=cvm,verbose=TRUE)


###################################################
### code chunk number 63: qle_with_R.Rnw:1818-1821
###################################################
qscoring(qsd,x0,
  opts=list("ftol_rel"=1e-6,"slope_tol"=1e-4),
  cvm=cvm)


###################################################
### code chunk number 64: qle_with_R.Rnw:1837-1844 (eval = FALSE)
###################################################
## qs.opts <-
##  list("xscale"=c(10,0.1,1),
##   "xtol_rel"=1e-10,
##   "ftol_stop"=1e-8,
##   "ftol_rel"=1e-6,
##   "ftol_abs"=1e-4,
##   "score_tol"=1e-4)


###################################################
### code chunk number 65: qle_with_R.Rnw:1847-1863 (eval = FALSE)
###################################################
## OPT <- qle(qsd, simClust, cond=cond,  
##  qscore.opts = qs.opts,
##  global.opts = list("maxiter"=10,"maxeval" = 20,
##                 "weights"=c(50,10,5,1,0.1),
##                 "NmaxQI"=5,"nstart"=100,
##                 "xscale"=c(10,0.1,1)),
##  local.opts = list("lam_max"=1e-2,
##                 "nobs"=200, # number of (bootstrap) observations for testing
##                 "nextSample"="score", # sampling criterion
##                 "ftol_abs"=1e-2, # lower bound on criterion value, triggers testing
##                 "weights"=c(0.55), # constant weight factor
##                 "eta"=c(0.025,0.075), # ignored, automatic adjustment of weights
##                 "test"=TRUE), # testing approximate root is enabled
## 		method = c("qscoring","bobyqa","direct"), # restart methods		
## 		errType="max", # use max of kriging and CV error
##         iseed=297, cl=cl) # store seed and use given cluster object


###################################################
### code chunk number 66: qle_with_R.Rnw:1866-1867
###################################################
print(OPT)


###################################################
### code chunk number 67: qle_with_R.Rnw:1870-1871
###################################################
attr(OPT,"optInfo")


###################################################
### code chunk number 68: qle_with_R.Rnw:1876-1877
###################################################
OPT$final


###################################################
### code chunk number 69: qle_with_R.Rnw:1881-1883
###################################################
S0 <- searchMinimizer(OPT$par,OPT$qsd,
       method="bobyqa",cvm=OPT$cvm,verbose=TRUE)


###################################################
### code chunk number 70: qle_with_R.Rnw:1888-1891
###################################################
QS <- qscoring(OPT$qsd,OPT$par,
       opts=list("slope_tol"=1e-4,"score_tol"=1e-3),
       cvm=OPT$cvm)


###################################################
### code chunk number 71: qle_with_R.Rnw:1895-1897
###################################################
par <- rbind("QS"=QS$par,"S0"=S0$par)
checkMultRoot(OPT,par=par)


###################################################
### code chunk number 72: qle_with_R.Rnw:1900-1901
###################################################
QS$par


###################################################
### code chunk number 73: qle_with_R.Rnw:1906-1917 (eval = FALSE)
###################################################
## par0 <- OPT$par 
## obs0 <- OPT$qsd$obs
## # testing `par0` with observed statistics `obs0`
## # which can be replaced by the user and are obsolete below
## Stest <- qleTest(OPT, # estimation results
##           par0=par0, # parameter to test
##           obs0=obs0, # alternative observed statistics
##           sim=simClust,cond=cond,nsim=100,
##           method=c("qscoring","bobyqa","direct"), # restart methods
##           opts=qs.opts,control=list("ftol_abs"=1e-8), # minimization options 
##           multi.start=1L,cl=cl,verbose=TRUE) # multi-start and parallel options


###################################################
### code chunk number 74: qle_with_R.Rnw:1919-1920
###################################################
print(Stest)


###################################################
### code chunk number 75: qle_with_R.Rnw:1923-1924 (eval = FALSE)
###################################################
## stopCluster(cl)


###################################################
### code chunk number 76: qle_with_R.Rnw:1933-1934
###################################################
diag(attr(Stest,"qi"))^0.5


###################################################
### code chunk number 77: qle_with_R.Rnw:1937-1938
###################################################
sqrt(diag(attr(Stest,"msem")))


###################################################
### code chunk number 78: qle_with_R.Rnw:1942-1943
###################################################
attr(Stest,"msem")



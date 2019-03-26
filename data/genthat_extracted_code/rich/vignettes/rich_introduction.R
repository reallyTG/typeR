## ---- echo=FALSE---------------------------------------------------------
knitr::knit_hooks$set(mysize = function(before, options, envir) {
  if (before) 
    return(options$size)
})

## ---- echo=FALSE---------------------------------------------------------
knitr::knit_hooks$set(mysize = function(before, options, envir) {
  if (before) 
    return(options$size)
})

## ---- echo=FALSE, message=FALSE, warning=FALSE---------------------------
library(rich)

## ---- eval=FALSE---------------------------------------------------------
## install.packages("rich", dep=TRUE)

## ---- eval=FALSE---------------------------------------------------------
## install.packages("rich", repos="http://R-Forge.R-project.org", dep=TRUE)

## ---- fig.align="center"-------------------------------------------------
library(rich)
data(ef)

# Bootstrap estimation based on 99 randomizations
o1 <- rich(matrix=ef, nrandom=99)
o1 

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center", message=FALSE----
# plot bootstrapped cumulated and mean richness values
library(gplots)
col <- c("lightblue", "lavender")
d <- c(o1$bootCR$cr.boot, o1$bootMR$mr.boot)

ci.l <- c(o1$bootCR$cr.boot + o1$bootCR$cr.se, 
	o1$bootMR$mr.boot + o1$bootMR$mr.se) 
ci.u <-  c(o1$bootCR$cr.boot, o1$bootMR$mr.boot) 
ci.l ; ci.u
barplot2(d, col = col, ylim=c(0,o1$bootCR$cr.obs), 
	plot.ci = TRUE, ci.l = ci.l, ci.u = ci.u, ylab="richness",
	names.arg=c("cumulated\nrichness", "mean\nrichness"))

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center"--------------
# plot corrected estimates 
col <- c("mistyrose", "cornsilk")
d <- c(o1$bootCR$cr.boot, o1$bootCR$cr.bcorr-o1$bootCR$cr.boot)
d2 <- c(o1$bootMR$mr.bcorr, o1$bootMR$mr.boot-o1$bootMR$mr.bcorr)
dd <- cbind(d,d2) 
barplot2(dd, col=col, names.arg=c("cumulated\nrichness", "mean\nrichness"))
legend("topright", legend=c("bootstrap estimate", "correction"), 
	col="black", pch=c(22,22), bty="n", pt.bg=col)

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center"--------------
data(efeb)
out <- c2cv(com1=efeb$ef,com2=efeb$eb,nrandom=100,verbose=FALSE)

out$res

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center"--------------
# The example of mandible length of male and female 
# golden jackals from Manly (1997), p.4.
males<-c(120, 107, 110, 116, 114, 111, 113, 117, 114, 112)
females<-c(110, 111, 107, 108, 110, 105, 107, 106, 111, 111)
out <- c2m(pop1=males, pop2=females, nrandom=99)
out$res

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center"--------------
hist(out$rand)

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center"--------------
hist(out$rand)
abline(v=out$res[3,1], col="red")
abline(v=out$res[5,1], col="blue")
abline(v=out$res[6,1], col="blue")

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center"--------------
pop1<-rnorm(10)
pop2<-rnorm(10)
out <- c2m(pop1=pop1, pop2=pop2, nrandom=99)
out$res
hist(out$rand)
abline(v=out$res[3,1], col="red")
abline(v=out$res[5,1], col="blue")
abline(v=out$res[6,1], col="blue")

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center", message=FALSE, warning=FALSE----
data(Tomicus)
out <- c2m(pop1=Tomicus$destruens,pop2=Tomicus$piniperda, 
pop3=Tomicus$both, nrandom=99)
out$res

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center"--------------
hist(out$rand)
abline(v=out$res[3,1], col="red")
abline(v=out$res[5,1], col="blue")
abline(v=out$res[6,1], col="blue")

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center", message=FALSE, warning=FALSE----
data(ef)
o1 <- rich(matrix=ef, nrandom=99, verbose=TRUE)
data(ea)
o2 <- rich(matrix=ea, nrandom=99, verbose=TRUE)
out <- c2m(pop1=o1$sumrow, pop2=o2$sumrow, nrandom=999, verbose=TRUE)
hist(out$rand)
abline(v=out$res[3,1], col="red")
abline(v=out$res[5,1], col="blue")
abline(v=out$res[6,1], col="blue")

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center", message=FALSE, warning=FALSE----
data(ef)
t <- rarc(ef,samplesize=c(5,10,15,20,25), nrandom=30, p1=0.975, p2=0.025)
head(t)

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center", message=FALSE, warning=FALSE----
plot(t$out[,6],t$out[,1], type="b", ylim=range(c(t$out[,2],t$out[,3])),
	xlab="number of sampling units", ylab="richness")
points(t$out[,6] , t$out[,2], type="l", col="red")
points(t$out[,6] , t$out[,3], type="l", col="blue")

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center", message=FALSE, warning=FALSE----
data(ef)
r <- rich(ef)
r$cr
dim(ef)[1]

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center", message=FALSE, warning=FALSE----
data(ef)
t <- rarc(ef,samplesize=c(10, 20, 30), nrandom=30, p1=0.975, p2=0.025)
t

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center", message=FALSE, warning=FALSE----
plot(t$out[,6],t$out[,1], type="b", ylim=range(c(t$out[,2],t$out[,3])),
	xlab="number of sampling units", ylab="richness")
points(t$out[,6] , t$out[,2], type="l", col="red")
points(t$out[,6] , t$out[,3], type="l", col="blue")
    abline(h=r$cr, lty="dashed")

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center", message=FALSE, warning=FALSE----
# Computing the standard deviation instead of the quantiles.
# We set the save argument to TRUE
t <- rarc(ef,samplesize=c(5,10,15,20,25), nrandom=10, p1=0.975, 
	p2=0.025, save=TRUE)

# The values of interest are in the list t$bootstrapped.val
# t$bootstrapped.val[[1]] contains the values for sample size #1
# t$bootstrapped.val[[2]] contains the values for sample size #2...
# t$bootstrapped.val[[3]][,1] corresponds to the richness 
# t$bootstrapped.val[[3]][,2] corresponds to the number of individuals 

# Computing the standard for the third sampling size
standard.error <- sd(t$bootstrapped.val[[3]][,1]) / 
	sqrt(length(t$bootstrapped.val[[3]][,1]))

# compute the standard error for all sample sizes:
samplesize <- c(5,10,15,20,25)
stdev <- rep(NA, times=length(samplesize))
for (i in 1:(length(samplesize))) {
    stdev[i] <- sd(t$bootstrapped.val[[i]][,1])/
    	sqrt(length(t$bootstrapped.val[[i]][,1]))   
    }

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center", message=FALSE, warning=FALSE----
r <- range(t$out$mean.richness-stdev, t$out$mean.richness+2*stdev)
r
plot(t$out$mean.nb.individuals, t$out$mean.richness, pch=19, ylim=r,
xlab="nb individuals", ylab="Mean richness (bootstrap) +/- SD")
arrows(t$out$mean.nb.individuals, t$out$mean.richness-stdev, 
	t$out$mean.nb.individuals, t$out$mean.richness+stdev, 
	length=0.05, angle=90, code=3)

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center", message=FALSE, warning=FALSE----
 data(ef)
    r <- raref(ef, dens=1100, nrandom=50)
    head(r$rar)
    r$Sinterp

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center", message=FALSE, warning=FALSE----
    plot(r$rar$ind, r$rar$nbsp, type="b")
    abline(v=r$Sinterp[1], lty="dashed") ; abline(h=r$Sinterp[2], lty="dashed")
    points(r$Sinterp[1], r$Sinterp[2], pch=3, col="red")

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center", message=FALSE, warning=FALSE----
    data(ef)
    r2 <- raref2(matrix=ef, dens=1100, tolerance=0.01, nrandom=50)
    r2$mean.boot

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center", message=FALSE, warning=FALSE----
    plot(r$rar$ind, r$rar$nbsp, type="p", cex=0.5)
    points(r$Sinterp[1], r$Sinterp[2], pch=8, col="blue")
    points(1100, r2$mean.boot, pch=3, col="red")
    legend(x="bottomright", legend=c("raref", "raref2"), bty="n",
    	pch=c(8,3), col=c("blue", "red"))

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center", message=FALSE, warning=FALSE----
    sp1<-c(1,2,3,4,5)
    sp2<-c(0,0,0,0,0)
    sp3<-c(1,1,0,0,0)
    sp4<-c(0,0,0,0,0)
    site1<-cbind(sp1, sp2, sp3, sp4)
    colnames(site1)<-c("sp1", "sp2", "sp3", "sp4")
    site1
    sp1<-c(1,2,3)
    sp2<-c(1,0,0)
    sp3<-c(0,0,0)
    sp4<-c(0,0,0)
    site2<-cbind(sp1, sp2, sp3, sp4)
    colnames(site2)<-c("sp1", "sp2", "sp3", "sp4")
    site2
    sp1<-c(1,2,3,4)
    sp2<-c(1,0,0,0)
    sp3<-c(1,0,0,0)
    sp4<-c(1,0,0,0)
    site3<-cbind(sp1, sp2, sp3, sp4)
    colnames(site3)<-c("sp1", "sp2", "sp3", "sp4")
    site3
    
    # we create a list containg the sites to be compared:
    data<-list(site1,site2, site3)
    names(data)<-c("site1","site2","site3")

    shared(data)

## ---- fig.width = 5.5, fig.height = 4.5, fig.align="center", message=FALSE, warning=FALSE----
	data(efeb)
	shared(efeb)


## ----echo=TRUE-----------------------------------------------------------
# loading library
library(BHTSpack)

# Generating a data set of 100 8x10 plates, each plate containing 80 compounds.
# A total of 8000 compounds. 10% of the compounds are hits.
Z = data.create(N=80, nr=8, nc=10, M=100, p=0.4, s=1234)

# Generating the data set as before, but this time adding plate noise to all compounds
Z = data.create(N=80, nr=8, nc=10, M=100, p=0.4, s=1234, covrow=read.csv("covrow.csv"), covcol=read.csv("covcol.csv"))

# Running the model with 200 iterations
system.time(b.est <- bhts(Z[["Z"]], iters=200, H=10, K=10, a.alpha=10, b.alpha=5, a.tau=10, b.tau=5, s=1234, store=TRUE))

# Compute threshold (r) for significant hit probabilities at FDR=0.05
res = r.fdr(b.est, fdr=0.05)
names(res)
res[["r"]]

# Significant compound hit list
head(res[["res"]])

# Trace plots of hit compound activity
ptrace(b.est, "mu1", ndisc=100, nr=3, nc=4)

# ACF plots of hit compound activity
ptrace(b.est, "mu1", ndisc=100, nr=3, nc=4, type="acf")

sessionInfo()

## ----echo=TRUE-----------------------------------------------------------
# loading library
library(BHTSpack)

# Generating a data set of 100 8x10 plates, each plate containing 80 compounds.
# A total of 8000 compounds. 40% of the compounds are hits.
Z = data.create(N=80, nr=8, nc=10, M=100, p=0.4, s=1234, covrow=read.csv("covrow.csv"), covcol=read.csv("covcol.csv"))

# Running the model with 200 iterations
b.est = bhts(Z[["Z"]], iters=200, H=10, K=10, a.alpha=10, b.alpha=5, a.tau=10, b.tau=5, s=1234, store=TRUE)

# create an html file
#bhts2HTML(res, dir="/dir/", fname="tophits")

## ----echo=TRUE-----------------------------------------------------------
library(BHTSpack)
Z = data.create(N=80, nr=8, nc=10, M=1000, p=0.4, s=1234, covrow=read.csv("covrow.csv"), covcol=read.csv("covcol.csv"))
I = unlist(Z[["I"]])
B = unlist(Z[["B"]])
Z = unlist(Z[["Z"]])

plot(density(Z[I==1 & B==0]), xlim=range(Z), ylim=c(0,6), col="black", lty=2, ylab="Density", main="", xlab="Raw Value")
lines(density(Z[I==1 & B==0]), col="blue", lty=2)
lines(density(Z[I==2 & B==0]), col="green", lty=2)
lines(density(Z[I==3 & B==0]), col="yellow", lty=2)
lines(density(Z[I==4 & B==0]), col="red", lty=2)
lines(density(Z[B==0]), col="black", lty=2, lwd=2)

lines(density(Z[I==1 & B==1]), col="blue", lty=3)
lines(density(Z[I==2 & B==1]), col="green", lty=3)
lines(density(Z[I==3 & B==1]), col="yellow", lty=3)
lines(density(Z[I==4 & B==1]), col="red", lty=3)
lines(density(Z[B==1]), col="black", lty=3, lwd=2)

legend("topright", legend=c("Component 1", "Component 2", "Component 3", "Component 4", "All Components", "Non-Hits", "Hits"), 
col=c("blue", "green", "yellow", "red", "black", "black", "black"), lty=c(1, 1, 1, 1, 1, 2, 3), lwd=c(1, 1, 1, 1, 1, 2, 2))

## ----echo=TRUE-----------------------------------------------------------
#library(BHTSpack)
#library(pROC)
#library(sights)

#score = function(t, sdat, B){
#  res = unlist(lapply(sdat, as.vector))
#  ind = rep(0, length(res))
#  ind[res>t] = 1

#  a = auc(B, ind)
#  return(a)
#}

### Left Column
#Z = data.create(N=80, nr=8, nc=10, M=1000, p=0.1, s=1234, covrow=read.csv("covrow.csv"), covcol=read.csv("covcol.csv"))
#system.time(b.est <- bhts(Z[["Z"]], iters=7000, H=10, K=10, a.alpha=10, b.alpha=5, a.tau=10, b.tau=5, s=1234, store=TRUE))
#hatpai = unlist(b.est[["hatpai"]])
#res = data.frame(IDmatch=names(hatpai), hatpai)
#Btab = data.frame(IDmatch=names(unlist(Z[["B"]])), hitind=unlist(Z[["B"]]))
#res = merge(res, Btab, by="IDmatch")

#Z = data.create(N=80, nr=8, nc=10, M=1000, p=0.1, s=1234, covrow=read.csv("covrow.csv"), covcol=read.csv("covcol.csv"), mat=TRUE)

## Top plot
#bs = unlist(lapply(Z[["Z"]], function(x){medpolish(x)[["residuals"]]/mad(x)}))
#summary(bs)

#rs = unlist(lapply(Z[["Z"]], function(x){matrix(normR(as.vector(t(x)), 8, 10), 8, 10, byrow=TRUE)}))
#summary(rs)

#r = seq(-4, 21, 0.5)
#AUC = unlist(lapply(r, function(x){score(x, bs, unlist(Z[["B"]]))}))
#summary(AUC)
#btmax = r[which.max(AUC)]
#plot(r, AUC, type="l", xlab="Threshold", ylab="AUC", lwd=2, xaxt="n", col="red", ylim=c(0.5, 0.75))
#abline(v=btmax, col="red", lty=2)
#axis(1, at=c(-5, 5, 10, 15))
#axis(1, at=btmax)

#r = seq(-4, 21, 0.5)
#AUC = unlist(lapply(r, function(x){score(x, rs, unlist(Z[["B"]]))}))
#summary(AUC)
#rtmax = r[which.max(AUC)]
#lines(r, AUC, type="l", xlab="Threshold", ylab="AUC", lwd=2, xaxt="n", col="green")
#axis(1, at=c(-5, 5, 10, 15))
#axis(1, at=rtmax)
#legend("topright", legend=c("R-score", "B-score"), col=c("green", "red"), lty=c(1,1))

## Bottom plot
#rhitind = rep(0, length(rs))
#rhitind[rs>rtmax] = 1

#bhitind = rep(0, length(bs))
#bhitind[bs>btmax] = 1

#plot.roc(res[["hitind"]], res[["hatpai"]], col="blue")
#lines.roc(unlist(Z[["B"]]), bhitind, col="red")
#lines.roc(unlist(Z[["B"]]), rhitind, col="green")
#legend("bottomright", legend=c(paste("BHTS", " (AUC=", round(auc(res[["hitind"]], res[["hatpai"]]), 3), ")", sep=""), paste("R-score", 
#" (AUC=", round(auc(unlist(Z[["B"]]), rhitind), 3), ")", sep=""), paste("B-score", " (AUC=", round(auc(unlist(Z[["B"]]), bhitind), 3), 
#")", sep="")), col=c("blue", "green", "red"), lty=c(1,1,1))

### Middle Column
#Z = data.create(N=80, nr=8, nc=10, M=1000, p=0.05, s=1234, covrow=read.csv("covrow.csv"), covcol=read.csv("covcol.csv"))
#system.time(b.est <- bhts(Z[["Z"]], iters=7000, H=10, K=10, a.alpha=10, b.alpha=5, a.tau=10, b.tau=5, s=1234, store=TRUE))
#hatpai = unlist(b.est[["hatpai"]])
#res = data.frame(IDmatch=names(hatpai), hatpai)
#Btab = data.frame(IDmatch=names(unlist(Z[["B"]])), hitind=unlist(Z[["B"]]))
#res = merge(res, Btab, by="IDmatch")

#Z = data.create(N=80, nr=8, nc=10, M=1000, p=0.05, s=1234, covrow=read.csv("covrow.csv"), covcol=read.csv("covcol.csv"), mat=TRUE)

## Top plot
#bs = unlist(lapply(Z[["Z"]], function(x){medpolish(x)[["residuals"]]/mad(x)}))
#summary(bs)

#rs = unlist(lapply(Z[["Z"]], function(x){matrix(normR(as.vector(t(x)), 8, 10), 8, 10, byrow=TRUE)}))
#summary(rs)

#r = seq(-4, 21, 0.5)
#AUC = unlist(lapply(r, function(x){score(x, bs, unlist(Z[["B"]]))}))
#summary(AUC)
#btmax = r[which.max(AUC)]
#plot(r, AUC, type="l", xlab="Threshold", ylab="AUC", lwd=2, xaxt="n", col="red", ylim=c(0.5, 0.75))
#abline(v=btmax, col="red", lty=2)
#axis(1, at=c(-5, 5, 10, 15))
#axis(1, at=btmax)

#r = seq(-5, 26, 0.5)
#AUC = unlist(lapply(r, function(x){score(x, rs, unlist(Z[["B"]]))}))
#summary(AUC)
#rtmax = r[which.max(AUC)]
#lines(r, AUC, type="l", xlab="Threshold", ylab="AUC", lwd=2, xaxt="n", col="green")
#axis(1, at=c(-5, 5, 10, 15))
#axis(1, at=rtmax)
#legend("topright", legend=c("R-score", "B-score"), col=c("green", "red"), lty=c(1,1))

## Bottom plot
#rhitind = rep(0, length(rs))
#rhitind[rs>rtmax] = 1

#bhitind = rep(0, length(bs))
#bhitind[bs>btmax] = 1

#plot.roc(res[["hitind"]], res[["hatpai"]], col="blue")
#lines.roc(unlist(Z[["B"]]), bhitind, col="red")
#lines.roc(unlist(Z[["B"]]), rhitind, col="green")
#legend("bottomright", legend=c(paste("BHTS", " (AUC=", round(auc(res[["hitind"]], res[["hatpai"]]), 3), ")", sep=""), paste("R-score", 
#" (AUC=", round(auc(unlist(Z[["B"]]), rhitind), 3), ")", sep=""), paste("B-score", " (AUC=", round(auc(unlist(Z[["B"]]), bhitind), 3), 
#")", sep="")), col=c("blue", "green", "red"), lty=c(1,1,1))

### Right Column
#Z = data.create(N=80, nr=8, nc=10, M=1000, p=0.01, s=1234, covrow=read.csv("covrow.csv"), covcol=read.csv("covcol.csv"))
#system.time(b.est <- bhts(Z[["Z"]], iters=7000, H=10, K=10, a.alpha=10, b.alpha=5, a.tau=10, b.tau=5, s=1234, store=TRUE))
#hatpai = unlist(b.est[["hatpai"]])
#res = data.frame(IDmatch=names(hatpai), hatpai)
#Btab = data.frame(IDmatch=names(unlist(Z[["B"]])), hitind=unlist(Z[["B"]]))
#res = merge(res, Btab, by="IDmatch")

#Z = data.create(N=80, nr=8, nc=10, M=1000, p=0.01, s=1234, covrow=read.csv("covrow.csv"), covcol=read.csv("covcol.csv"), mat=TRUE)

## Top plot
#bs = unlist(lapply(Z[["Z"]], function(x){medpolish(x)[["residuals"]]/mad(x)}))
#summary(bs)

#rs = unlist(lapply(Z[["Z"]], function(x){matrix(normR(as.vector(t(x)), 8, 10), 8, 10, byrow=TRUE)}))
#summary(rs)

#r = seq(-4, 23, 0.5)
#AUC = unlist(lapply(r, function(x){score(x, bs, unlist(Z[["B"]]))}))
#summary(AUC)
#btmax = r[which.max(AUC)]
#plot(r, AUC, type="l", xlab="Threshold", ylab="AUC", lwd=2, xaxt="n", col="red", ylim=c(0.5, 0.75))
#abline(v=btmax, col="red", lty=2)
#axis(1, at=c(-5, 5, 10, 15))
#axis(1, at=btmax)

#r = seq(-5, 28, 0.5)
#AUC = unlist(lapply(r, function(x){score(x, rs, unlist(Z[["B"]]))}))
#summary(AUC)
#rtmax = r[which.max(AUC)]
#lines(r, AUC, type="l", xlab="Threshold", ylab="AUC", lwd=2, xaxt="n", col="green")
#axis(1, at=c(-5, 5, 10, 15))
#axis(1, at=rtmax)
#legend("topright", legend=c("R-score", "B-score"), col=c("green", "red"), lty=c(1,1))

## Bottom plot
#rhitind = rep(0, length(rs))
#rhitind[rs>rtmax] = 1

#bhitind = rep(0, length(bs))
#bhitind[bs>btmax] = 1

#plot.roc(res[["hitind"]], res[["hatpai"]], col="blue")
#lines.roc(unlist(Z[["B"]]), bhitind, col="red")
#lines.roc(unlist(Z[["B"]]), rhitind, col="green")
#legend("bottomright", legend=c(paste("BHTS", " (AUC=", round(auc(res[["hitind"]], res[["hatpai"]]), 3), ")", sep=""), paste("R-score", 
#" (AUC=", round(auc(unlist(Z[["B"]]), rhitind), 3), ")", sep=""), paste("B-score", " (AUC=", round(auc(unlist(Z[["B"]]), bhitind), 3), 
#")", sep="")), col=c("blue", "green", "red"), lty=c(1,1,1))

## ----echo=TRUE-----------------------------------------------------------
library(BHTSpack)
#library(pROC)

aucfunc = function(dat, B){
  Btab = data.frame(hitind=unlist(B))
  Btab = data.frame(IDmatch=rownames(Btab), Btab)

  Res = merge(dat, Btab, by="IDmatch")

  return(auc(Res[["hitind"]], Res[["hatpai"]]))
}


## Left plot
Z = data.create(N=80, nr=8, nc=10, M=1000, p=0.1, s=1234, covrow=read.csv("covrow.csv"), covcol=read.csv("covcol.csv"))

mu = mean(unlist(Z[["Z"]]))
mu00 = seq(mu, 0, -mu/25)
mu10 = seq(mu, 2*mu, mu/25)

#res = lapply(1:25, function(x){print(x); res=bhts(Z[["Z"]], iters=7000, H=10, K=10, mu00[x], mu10[x], a.alpha=10, 
#b.alpha=5, a.tau=10, b.tau=5, s=1234); return(res);})

#hatpai = lapply(res, function(x){unlist(x[["hatpai"]])})
#hatpai = lapply(hatpai, function(x){data.frame(IDmatch=names(x), hatpai=x)})
#AUC = unlist(lapply(hatpai, aucfunc, Z[["B"]]))

#plot((mu10-mu00)[1:25], AUC, pch=16, xlab=expression(paste(mu[1][0]-mu[0][0])), cex=1.5, cex.lab=1.5, ylim=c(0.8, 0.9))
#abline(v=mu, col="red", lty=2, lwd=2)


## Middle plot
Z = data.create(N=80, nr=8, nc=10, M=1000, p=0.05, s=1234, covrow=read.csv("covrow.csv"), covcol=read.csv("covcol.csv"))

mu = mean(unlist(Z[["Z"]]))
mu00 = seq(mu, 0, -mu/25)
mu10 = seq(mu, 2*mu, mu/25)

#res = lapply(1:25, function(x){print(x); res=bhts(Z[["Z"]], iters=7000, H=10, K=10, mu00[x], mu10[x], a.alpha=10, 
#b.alpha=5, a.tau=10, b.tau=5, s=1234); return(res);})

#hatpai = lapply(res, function(x){unlist(x[["hatpai"]])})
#hatpai = lapply(hatpai, function(x){data.frame(IDmatch=names(x), hatpai=x)})
#AUC = unlist(lapply(hatpai, aucfunc, Z[["B"]]))

#plot((mu10-mu00)[1:25], AUC, pch=16, xlab=expression(paste(mu[1][0]-mu[0][0])), cex=1.5, cex.lab=1.5, ylim=c(0.8, 0.9))
#abline(v=mu, col="red", lty=2, lwd=2)


## Right plot
Z = data.create(N=80, nr=8, nc=10, M=1000, p=0.01, s=1234, covrow=read.csv("covrow.csv"), covcol=read.csv("covcol.csv"))

mu = mean(unlist(Z[["Z"]]))
mu00 = seq(mu, 0, -mu/25)
mu10 = seq(mu, 2*mu, mu/25)

#res = lapply(1:25, function(x){print(x); res=bhts(Z[["Z"]], iters=7000, H=10, K=10, mu00[x], mu10[x], a.alpha=10, 
#b.alpha=5, a.tau=10, b.tau=5, s=1234); return(res);})

#hatpai = lapply(res, function(x){unlist(x[["hatpai"]])})
#hatpai = lapply(hatpai, function(x){data.frame(IDmatch=names(x), hatpai=x)})
#AUC = unlist(lapply(hatpai, aucfunc, Z[["B"]]))

#plot((mu10-mu00)[1:25], AUC, pch=16, xlab=expression(paste(mu[1][0]-mu[0][0])), cex=1.5, cex.lab=1.5, ylim=c(0.8, 0.9))
#abline(v=mu, col="red", lty=2, lwd=2)

## Right plot
Z = data.create(N=80, nr=8, nc=10, M=1000, p=0.01, s=1234, covrow=read.csv("covrow.csv"), covcol=read.csv("covcol.csv"))

mu = mean(unlist(Z[["Z"]]))
mu00 = seq(mu, 0, -mu/25)
mu10 = seq(mu, 2*mu, mu/25)

#res = lapply(1:25, function(x){print(x); res=bhts(Z[["Z"]], iters=7000, H=10, K=10, mu00[x], mu10[x], a.alpha=10, 
#b.alpha=5, a.tau=10, b.tau=5, s=1234); return(res);})

#hatpai = lapply(res, function(x){unlist(x[["hatpai"]])})
#hatpai = lapply(hatpai, function(x){data.frame(IDmatch=names(x), hatpai=x)})
#AUC = unlist(lapply(hatpai, aucfunc, Z[["B"]]))

#plot((mu10-mu00)[1:25], AUC, pch=16, xlab=expression(paste(mu[1][0]-mu[0][0])), cex=1.5, cex.lab=1.5, ylim=c(0.8, 0.9))
#abline(v=mu, col="red", lty=2, lwd=2)

## ----echo=TRUE-----------------------------------------------------------
#library(BHTSpack)
#library(pROC)
#library(sights)

#score = function(t, sdat, B){
#  res = unlist(lapply(sdat, as.vector))
#  ind = rep(0, length(res))
#  ind[res>t] = 1

#  a = auc(B, ind)
#  return(a)
#}

#Z = data.create(N=80, nr=8, nc=10, M=5000, p=0.00021, s=1234, covrow=read.csv("covrow.csv"), covcol=read.csv("covcol.csv"))
#system.time(b.est <- bhts(Z[["Z"]], iters=7000, H=10, K=10, a.alpha=10, b.alpha=5, a.tau=10, b.tau=5, s=1234, store=TRUE))
#hatpai = unlist(b.est[["hatpai"]])
#res = data.frame(IDmatch=names(hatpai), hatpai)
#Btab = data.frame(IDmatch=names(unlist(Z[["B"]])), hitind=unlist(Z[["B"]]))
#res = merge(res, Btab, by="IDmatch")

#Z = data.create(N=80, nr=8, nc=10, M=5000, p=0.00021, s=1234, covrow=read.csv("covrow.csv"), covcol=read.csv("covcol.csv"), mat=TRUE)

## Top plot
#bs = unlist(lapply(Z[["Z"]], function(x){medpolish(x)[["residuals"]]/mad(x)}))
#summary(bs)

#rs = unlist(lapply(Z[["Z"]], function(x){matrix(normR(as.vector(t(x)), 8, 10), 8, 10, byrow=TRUE)}))
#summary(rs)

#r = seq(-4, 30, 0.5)
#AUC = unlist(lapply(r, function(x){score(x, bs, unlist(Z[["B"]]))}))
#summary(AUC)
#btmax = r[which.max(AUC)]

#r = seq(-5, 29, 0.5)
#AUC = unlist(lapply(r, function(x){score(x, rs, unlist(Z[["B"]]))}))
#summary(AUC)
#rtmax = r[which.max(AUC)]

#rhitind = rep(0, length(rs))
#rhitind[rs>rtmax] = 1

#bhitind = rep(0, length(bs))
#bhitind[bs>btmax] = 1

#plot.roc(res[["hitind"]], res[["hatpai"]], col="blue")
#lines.roc(unlist(Z[["B"]]), bhitind, col="red")
#lines.roc(unlist(Z[["B"]]), rhitind, col="green")
#legend("bottomright", legend=c(paste("BHTS", " (AUC=", round(auc(res[["hitind"]], res[["hatpai"]]), 3), ")", sep=""), paste("R-score", 
#" (AUC=", round(auc(unlist(Z[["B"]]), rhitind), 3), ")", sep=""), paste("B-score", " (AUC=", round(auc(unlist(Z[["B"]]), bhitind), 3), 
#")", sep="")), col=c("blue", "green", "red"), lty=c(1,1,1))

## ----echo=TRUE-----------------------------------------------------------
#library(BHTSpack)
#library(pROC)
#library(sights)
#library(gdata)

#score = function(t, s, B){
#  ind = rep(0, length(s))
#  ind[s>t] = 1

#  a = auc(B, ind)
#  return(a)
#}

## It is assumed that data files are in a folder "temp"
## read data
#dat = read.csv("temp/EColiFilamentation2006_screeningdata.csv", sep="\t")
#dim(dat)

## read hit indicators
#hits = read.csv("temp/CompoundSearchResults.csv", sep=",")
#dim(hits)
#hits = data.frame(hits, hits=rep(1,nrow(hits)))
#hits = data.frame(ChembankId=hits[["ChemBank.Id"]], hitind=rep(1,nrow(hits)))

## merge with hit indicator
#dat = merge(dat, hits, by="ChembankId", all.x=TRUE)
#dim(dat)
#dat[["hitind"]][is.na(dat[["hitind"]])] = 0

## merge with map
#map = read.xls("map.xlsx")
#dat = merge(dat, map, by="AssayName")

## Organism DRC39 at 24h
#dat = subset(dat, Organism=="DRC39" & ExpTime=="24h")

#plates = unique(as.character(dat[["Plate"]]))
#unique(as.character(dat[["WellType"]]))
#dat = subset(dat, WellType=="compound-treatment")

#dat = lapply(plates, function(x){d=subset(dat, Plate==x)})
#names(dat) = plates
#l = unlist(lapply(dat, nrow))
#table(l)

## include only 352-well plates
#dat = dat[l==352]

#unique(as.character(unlist(lapply(dat, function(x){x$AssayName}))))
#sum(is.na(unlist(lapply(dat, function(x){x$RawValueA}))))
#sum(unlist(lapply(dat, function(x){x$hitind})))
#sum(!is.na(unlist(lapply(dat, function(x){x$RawValueA}))))

## sorting wells row-wise
#dat = lapply(dat, function(x){ix=sort.int(as.character(x[["Well"]]), index.return=TRUE)[["ix"]]; return(x[ix,]);})

## extracting raw values, hit indicators and well names
#Z = lapply(dat, function(x){x[["RawValueA"]]})
#B = lapply(dat, function(x){x[["hitind"]]})
#W = lapply(dat, function(x){x[["Well"]]})

## constructing plates of raw values, row-wise
#Z = lapply(Z, function(x){matrix(x, 16, 22, byrow=TRUE)})

## naming rows and columns of plates
#Z = lapply(Z, function(x){rownames(x)=LETTERS[1:16]; colnames(x)=formatC(seq(1,22),flag=0,digits=1); return(x);})

## constructing plates of indicator variables (row-wise) and vectorizing (column-wise) each plate
#B = lapply(B, function(x){as.vector(matrix(x, 16, 22, byrow=TRUE))})

## constructing plates of well names (row-wise) and vectorizing (column-wise) each plate
#W = lapply(W, function(x){as.vector(matrix(x, 16, 22, byrow=TRUE))})

## Left plot
#plot(density(unlist(Z)[unlist(B)==0]), col="blue", ylab="Density", main="", xlim=range(unlist(Z)), xlab="Raw Value")
#lines(density(unlist(Z)[unlist(B)==1]), col="red")
#legend("topright", legend=c("Non-Hits", "Hits"), col=c("blue", "red"), lty=c(1,1))

## normalizing plates of raw values
#Z = lapply(Z, function(x){(x-mean(x))/sd(x)})

## naming indicator variables
#bn = names(B)
#B = lapply(1:length(B), function(x){names(B[[x]])=W[[x]]; return(B[[x]]);})
#names(B) = bn

## construct object for B-score and R-score methods
#Zmat = list(Z=Z, B=B)

## construct object for BHTS method
## vectorizing (column-wise) each plate of raw values and naming them with well names
#zn = names(Z)
#Z = lapply(1:length(Z), function(x){d=as.vector(Z[[x]]); names(d)=W[[x]]; return(d);})
#names(Z) = zn
#Z = list(Z=Z, B=B)

## Run BHTS
#system.time(b.est <- bhts(Z[["Z"]], iters=7000, H=10, K=10, a.alpha=10, b.alpha=5, a.tau=10, b.tau=5, s=1234, store=TRUE))
#hatpai = unlist(b.est[["hatpai"]])
#res = data.frame(IDmatch=names(hatpai), hatpai)
#Btab = data.frame(IDmatch=names(unlist(Z[["B"]])), hitind=unlist(Z[["B"]]))
#res = merge(res, Btab, by="IDmatch")

## Run B-score
#bs = unlist(lapply(Zmat[["Z"]], function(x){medpolish(x)[["residuals"]]/mad(x)}))
#summary(bs)

## Middle plot
#r = seq(-31, 9, 0.5)
#AUC = unlist(lapply(r, function(x){score(x, bs, unlist(Zmat[["B"]]))}))
#summary(AUC)
#btmax = r[which.max(AUC)]
#plot(r, AUC, type="l", xlab="Threshold", ylab="AUC", lwd=2, xaxt="n", col="red", ylim=c(0.44, 0.56))
#abline(v=btmax, col="red", lty=2)
#axis(1)
#axis(1, at=btmax)

## Run R-score
#rs = unlist(lapply(Zmat[["Z"]], function(x){matrix(normR(as.vector(t(x)), 16, 22), 16, 22, byrow=TRUE)}))
#summary(rs)

#r = seq(-45, 29, 0.5)
#AUC = unlist(lapply(r, function(x){score(x, rs, unlist(Zmat[["B"]]))}))
#summary(AUC)
#rtmax = r[which.max(AUC)]
#lines(r, AUC, type="l", xlab="Threshold", ylab="AUC", lwd=2, xaxt="n", col="green")
#abline(v=rtmax, col="green", lty=2)
#axis(1, at=rtmax)
#legend("topright", legend=c("R-score", "B-score"), col=c("green", "red"), lty=c(1,1))

## Right plot
#rhitind = rep(0, length(rs))
#rhitind[rs>rtmax] = 1

#bhitind = rep(0, length(bs))
#bhitind[bs>btmax] = 1

#plot.roc(res[["hitind"]], res[["hatpai"]], col="blue")
#lines.roc(unlist(Zmat[["B"]]), bhitind, col="red")
#lines.roc(unlist(Zmat[["B"]]), rhitind, col="green")
#legend("bottomright", legend=c(paste("BHTS", " (AUC=", round(auc(res[["hitind"]], res[["hatpai"]]), 3), ")", sep=""), paste("R-score", 
#" (AUC=", round(auc(unlist(Zmat[["B"]]), rhitind), 3), ")", sep=""), paste("B-score", " (AUC=", round(auc(unlist(Zmat[["B"]]), bhitind), 
#3), ")", sep="")), col=c("blue", "green", "red"), lty=c(1,1,1))


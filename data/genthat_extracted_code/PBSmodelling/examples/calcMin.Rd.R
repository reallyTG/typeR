library(PBSmodelling)


### Name: calcMin
### Title: Calculate the Minimum of a User-Defined Function
### Aliases: calcMin
### Keywords: nonlinear optimize

### ** Examples

local(envir=.PBSmodEnv,expr={
Ufun <- function(P) {
  Linf <- P[1]; K <- P[2]; t0 <- P[3]; obs <- afile$len;
  pred <- Linf * (1 - exp(-K*(afile$age-t0)));
  n <- length(obs); ssq <- sum((obs-pred)^2 );
  return(n*log(ssq)); };

oldpar = par(no.readonly = TRUE)
afile <- data.frame(age=1:16,len=c(7.36,14.3,21.8,27.6,31.5,35.3,39,
  41.1,43.8,45.1,47.4,48.9,50.1,51.7,51.7,54.1));
pvec <- data.frame(val=c(70,0.5,0),min=c(40,0.01,-2),max=c(100,2,2),
  active=c(TRUE,TRUE,TRUE),row.names=c("Linf","K","t0"),
  stringsAsFactors=FALSE);
alist <- calcMin(pvec=pvec,func=Ufun,method="nlm",steptol=1e-4,repN=10);
print(alist[-1]); P <- alist$Pend;
#resetGraph(); 
expandGraph();
xnew <- seq(afile$age[1],afile$age[nrow(afile)],len=100);
ynew <- P[1] * (1 - exp(-P[2]*(xnew-P[3])) );
plot(afile); lines(xnew,ynew,col="red",lwd=2); 
addLabel(.05,.88,paste(paste(c("Linf","K","t0"),round(P,c(2,4,4)),
  sep=" = "),collapse="\n"),adj=0,cex=0.9);
par(oldpar)
})




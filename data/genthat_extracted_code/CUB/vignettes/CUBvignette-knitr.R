## ----include=FALSE,eval=TRUE,echo=FALSE----------------------------------
library(knitr)
library(digest)
opts_chunk$set(
engine='R',dev='pdf',fig.width=7,fig.height=5,strip.white=TRUE,tidy=FALSE
)

## ----include=FALSE-------------------------------------------------------
library(knitr)
opts_chunk$set(
concordance=TRUE
)

## ----eval=TRUE,echo=FALSE,comment=NA-------------------------------------
options(warn=-1)
suppressMessages(library(CUB))
library(knitr)
options(warn=-1)

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  GEM(Formula, family, ...)

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  GEM(Formula(ordinal~Y|W|X), family="cub", ...)

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  GEM(Formula(ordinal~0|0|0), family="cub")

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  GEM(Formula(ordinal~Y|0|0), family="cub")

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  GEM(Formula(ordinal~0|W|0), family="cub")

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  GEM(Formula(ordinal~Y|W|0), family="cub")

## ----eval=FALSE,echo=TRUE------------------------------------------------
#  GEM(Formula(ordinal~0|0|0), family="cub", shelter=s)

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  GEM(Formula(ordinal~Y|W|X), family="cub", shelter=s)

## ----eval=FALSE,echo=TRUE------------------------------------------------
#  GEM(Formula(ordinal~0), family="cush", shelter = s)     # without covariates
#  GEM(Formula(ordinal~X), family="cush", shelter = s)     # with covariates

## ----eval=FALSE,echo=TRUE------------------------------------------------
#  GEM(Formula(ordinal~0|0|0), family="cube")    # without covariates
#  GEM(Formula(ordinal~0|W|0), family="cube")    # with covariates for feeling
#  GEM(Formula(ordinal~Y|W|Z), family="cube")    # with covariates for all parameters

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  GEM(Formula(ordinal~0),family="ihg")         # without covariates
#  GEM(Formula(ordinal~U),family="ihg")         # with covariates

## ----eval=FALSE,echo=TRUE------------------------------------------------
#  llCUB  <- loglikCUB(ordinal,m,param,Y=Y,W=W,X=X,shelter=s)
#  llCUBE <- loglikCUBE(ordinal,m,param,Y=Y,W=W,Z=Z)
#  llIHG  <- loglikIHG(ordinal,m,param,U=U)
#  llCUSH <- loglikCUSH(ordinal,m,param,X=X,shelter=s)

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  varCUB <- varmatCUB(ordinal, m, param, Y = Ycovar, W = Wcovar, X = Xcovar,
#                      shelter = shelter)

## ----echo=TRUE,eval=FALSE------------------------------------------------
#  varCUBE <- varmatCUBE(ordinal, m, param, Y = Ycovar, W = Wcovar, Z = Zcovar,
#    			expinform = FALSE)

## ----eval=FALSE,echo=TRUE------------------------------------------------
#  ###########################################################################
#  ### Selection of 9 CUBE models with csi = 0.3 over 9 ordinal categories  ***
#  ###########################################################################
#  m<-9; csi<-0.3
#  ########### varying pai and phi parameters
#  paival<-seq(0.9,0.1,by=-0.1)
#  phival<-rep(c(0.05,0.1,0.3),times=3)
#  model<-cbind(paival,phival); nmodels<-nrow(model)
#  ##########################################
#  par(mfrow = c(3,3))
#  par(mar = c(2,4,3,1)+0.1)
#  ### Probability distribution plots for jmod=1,2,...,9
#  for (jmod in 1:nmodels){
#    paij<-model[jmod, 1]
#  	phij<-model[jmod, 2]
#  	prob<-probcube(m, paij, csi, phij)
#  	exp<-expcube(m, paij, csi, phij)
#  	var<-round(varcube(m, paij, csi, phij), digits = 2)
#  	plot(1:m, prob, type = "h", lwd = 3, ylim = c(0,0.4), xlab = "",
#         ylab = "Pr(R=r)", las = 1)
#  	text(2.3, 0.38, bquote(pi == .(paij)), cex = 0.7)
#    text(5, 0.38, bquote(xi == .(csi)), cex = 0.7)
#    text(7.8, 0.38, bquote(phi == .(phij)), cex = 0.7)
#    text(7, 0.285, bquote(sigma^2 == .(var)), cex = 0.7)
#    text(3, 0.28, bquote(mu == .(exp)), cex = 0.7)
#  }
#  par(mar = c(5,4,4,2)+0.1)             ### reset standard margins
#  par(mfrow = c(1,1))                   ### reset plot screen

## ----eval=TRUE,echo=FALSE,comment=NA,fig.width=5, fig.height=5.5---------
m<-9; csi<-0.3
########### varying pai and phi parameters 
paival<-seq(0.9,0.1,by=-0.1)
phival<-rep(c(0.05,0.1,0.3),times=3)
model<-cbind(paival,phival); nmodels<-nrow(model)
##########################################
par(mfrow = c(3,3))                   ### split the plot screen
par(mar = c(2,4,3,1)+0.1);            ### set new margins
### Probability distribution plots for jmod=1,2,...,9
for (jmod in 1:nmodels){
  paij<-model[jmod,1];
  phij<-model[jmod,2];
	prob<-probcube(m,paij,csi,phij);
	exp<-expcube(m,paij,csi,phij);
	var<-round(varcube(m,paij,csi,phij),digits=2);
	plot(1:m,prob,type="h",lwd=3,ylim=c(0,0.4),xlab = "", 
       ylab = "Pr(R=r)", las=1);
  text(2.3, 0.38, bquote(pi == .(paij)), cex = 0.7);
  text(5, 0.38, bquote(xi == .(csi)), cex = 0.7);
  text(7.8, 0.38, bquote(phi == .(phij)), cex = 0.7);
  text(7, 0.285, bquote(sigma^2 == .(var)), cex = 0.7);
  text(3, 0.28, bquote(mu == .(exp)), cex = 0.7);
}
par(mar = c(5,4,4,2)+0.1);                ### reset standard margins
par(mfrow = c(1,1));  

## ----eval=FALSE,echo=TRUE------------------------------------------------
#  data(univer)
#  listord<-univer[,8:12] # only ratings, excluding covariates
#  labels<-names(univer)[8:12]
#  multicub(listord, labels = labels,
#      	caption ="CUB models on Univer data set", pch = 19,
#      	pos = c(1,rep(3, ncol(listord)-1)),ylim=c(0.75,1),xlim=c(0,0.4))

## ----eval=TRUE,echo=FALSE,comment=NA,fig.width=4.5, fig.height=5---------
data(univer)
listord<-univer[,8:12] # only ratings, excluding covariates
labels<-names(univer)[8:12]
multicub(listord, labels = labels, 
    	caption ="CUB models on Univer data set", symbols = 19,
    	pos = c(1,rep(3, ncol(listord)-1)),ylim=c(0.75,1),xlim=c(0,0.4))

## ----cub00,eval=TRUE,echo=TRUE,fig.width=5, fig.height=5.5,comment=NA----
## CUB model without covariates for "officeho"
cub_00<-GEM(Formula(officeho~0|0|0), family="cub",data=univer)
summary(cub_00,digits=5)

## ----eval=TRUE,echo=TRUE,cache=TRUE,comment=NA---------------------------
param<-coef(cub_00,digits=3)
param
uncertainty<-1-param[1]
uncertainty
feeling<-1-param[2]
feeling

## ----eval=FALSE,cache=TRUE, echo=TRUE,fig.width=5, fig.height=5.5,comment=NA----
#  ## CUB model without covariates
#  makeplot(cub_00)

## ----eval=TRUE,echo=TRUE,comment=NA--------------------------------------
data(univer)
freq<-tabulate(univer$officeho,nbins = 7)
ini<-inibest(m,freq) # preliminary estimates for c(pai,csi)
ini

## ----cub_csi,cache=TRUE,eval=TRUE,echo=TRUE,comment=NA-------------------
cub_csi<-GEM(Formula(officeho~0|freqserv|0), family="cub",data=univer)
summary(cub_csi,digits=3)

## ----cache=TRUE,eval=TRUE,echo=TRUE,comment=NA---------------------------
gama<-coef(cub_csi)[2:3]
gama
gama0<-gama[1]  ## intercept term
gama1<-gama[2]

## ----eval=TRUE,echo=TRUE-------------------------------------------------
csi_nru <- logis(0, gama)   ## csi parameter for non regular user (freqserv=0)
csi_nru
csi_ru  <- logis(1, gama)   ## csi parameter for regular user (freqserv=1)
csi_ru

## ----cache=TRUE,echo=TRUE,eval=TRUE,comment=NA---------------------------
pai<-coef(cub_csi)[1]
gama<-coef(cub_csi)[2:3]
data(univer)
pearson<-chi2cub(m=7, univer$officeho, W = univer$freqserv, pai, gama)
str(pearson)

## ----cache=TRUE,eval=TRUE,echo=FALSE,fig.width=5, fig.height=5.5,comment=NA----
makeplot(cub_00)

## ----cache=TRUE,eval=TRUE,echo=FALSE,fig.width=5, fig.height=5.5,comment=NA----
makeplot(cub_csi)

## ----cache=TRUE,eval=TRUE,echo=TRUE,comment=NA---------------------------
data(univer)
inicsicov<-inibestgama(m,univer$officeho,W=univer$freqserv)
inicsicov

## ----cub_pai_csi,cache=TRUE,eval=TRUE,echo=TRUE,comment=NA---------------
data(univer)
age<-univer$age
lage<-log(age)-mean(log(age))         # Deviation from mean of logged Age
cub_pai_csi<-GEM(Formula(officeho~lage+gender|lage+freqserv|0),family="cub",data=univer)
summary(cub_pai_csi,correlation=TRUE,digits=3)

## ----eval=TRUE,echo=TRUE-------------------------------------------------
coef(cub_pai_csi,digits=3)

## ----eval=FALSE,echo=TRUE,cache=TRUE,comment=NA--------------------------
#  data(univer)
#  age<-univer$age
#  average<-mean(log(age))
#  ageseq<-log(seq(17, 51, by = 0.1))-average
#  param<-coef(cub_pai_csi)
#  ####################
#  paicov0<-logis(cbind(ageseq, 0), param[1:3])
#  paicov1<-logis(cbind(ageseq, 1), param[1:3])
#  
#  csicov0<-logis(cbind(ageseq, 0), param[4:6])
#  csicov1<-logis(cbind(ageseq, 1), param[4:6])
#  ####################
#  plot(1-paicov0, 1-csicov0, type = "n", col = "blue", cex = 1,
#       xlim = c(0, 0.6), ylim = c(0.4, 0.9), font.main = 4, las = 1,
#       main = "CUB models with covariates",
#       xlab = expression(paste("Uncertainty     ", (1-pi))),
#       ylab = expression(paste("Feeling      ", (1-xi))), cex.main = 0.9,
#       cex.lab = 0.9)
#  lines(1-paicov1, 1-csicov1, lty = 1, lwd = 4, col = "red")
#  lines(1-paicov0, 1-csicov0, lty = 1, lwd = 4, col = "blue")
#  lines(1-paicov0, 1-csicov1, lty = 1, lwd = 4, col = "black")
#  lines(1-paicov1, 1-csicov0, lty = 1, lwd = 4, col = "green")
#  legend("bottomleft", legend = c("Man-User", "Man-Not User",
#     "Woman-User", "Woman-Not User"), col = c("black", "blue", "red", "green"),
#     lty = 1, text.col = c("black", "blue", "red", "green"), cex = 0.6)
#  text(0.1, 0.85, labels = "Young", offset = 0.3, cex = 0.8, font = 4)
#  text(0.5, 0.5, labels = "Elderly", offset = 0.3, cex = 0.8, font = 4)

## ----eval=TRUE,echo=FALSE,fig.width=4.5,fig.height=4.5,comment=NA--------
average<-mean(log(age))
ageseq<-log(seq(17, 51, by = 0.1))-average;
param<-coef(cub_pai_csi)
####################
paicov0<-logis(cbind(ageseq, 0), param[1:3])
paicov1<-logis(cbind(ageseq, 1), param[1:3])

csicov0<-logis(cbind(ageseq, 0), param[4:6])
csicov1<-logis(cbind(ageseq, 1), param[4:6])
####################
plot(1-paicov0, 1-csicov0, type = "n", col = "blue", cex = 1,
     xlim = c(0, 0.6), ylim =  c(0.5, 1), font.main = 4, las = 1,
     main = "CUB models with covariates",
     xlab = expression(paste("Uncertainty     ", (1-pi))),
     ylab = expression(paste("Feeling      ", (1-xi))), cex.main = 0.9, 
     cex.lab = 0.9)
lines(1-paicov1, 1-csicov1, lty = 1, lwd = 4, col = "red")
lines(1-paicov0, 1-csicov0, lty = 1, lwd = 4, col = "blue")
lines(1-paicov0, 1-csicov1, lty = 1, lwd = 4, col = "black")
lines(1-paicov1, 1-csicov0, lty = 1, lwd = 4, col = "green")
legend("bottomleft", legend = c("Man-User", "Man-Not User", 
   "Woman-User", "Woman-Not User"), col = c("black", "blue", "red", "green"),
   lty = 1, text.col = c("black", "blue", "red", "green"), cex = 0.6)
text(0.08, 0.95, labels = "Young", offset = 0.3, cex = 0.8, font = 4)
text(0.4, 0.7, labels = "Elderly", offset = 0.3, cex = 0.8, font = 4)

## ----cube,cache=TRUE,eval=TRUE,echo=TRUE,comment=NA----------------------
starting<-c(0.5, 0.5, 0.1)       
cubefit<-GEM(Formula(willingn~0|0|0),family="cube", starting = starting, 
             maxiter = 100, toler = 1e-4,data=univer)
summary(cubefit,digits=7)

## ----eval=FALSE,echo=TRUE,comment=NA-------------------------------------
#  GEM(Formula(ordinal~0|W|0),family="cube")

## ----eval=FALSE,echo=TRUE,comment=NA-------------------------------------
#  GEM(Formula(ordinal~Y|W|Z),family="cube")

## ----ihg,cache=TRUE,eval=TRUE,echo=TRUE,comment=NA-----------------------
ihgfit<-GEM(Formula(willingn~0),family="ihg",data=univer)
summary(ihgfit,digits=7)

## ----cache=TRUE,eval=TRUE,echo=TRUE,comment=NA---------------------------
llcube<-logLik(cubefit)
llihg<-logLik(ihgfit)
lrt<- -2*(llihg - llcube)   ### 495.9135
pv<- 1-pchisq(lrt, 2)       ### 0

## ----eval=TRUE,echo=FALSE,cache=TRUE,comment=NA--------------------------
data(univer)
starting<-c(0.5, 0.5, 0.1)
cubefit<-GEM(Formula(willingn~0|0|0),family="cube", starting = starting, maxiter = 100, toler = 1e-4,data=univer)
makeplot(cubefit)

## ----eval=TRUE,echo=FALSE,cache=TRUE,comment=NA--------------------------
ihgfit<-GEM(Formula(willingn~0),family="ihg",data=univer)
makeplot(ihgfit)

## ----cub_she,eval=TRUE,echo=TRUE,comment=NA------------------------------
cub_she<-GEM(Formula(Writing~0|0|0),family="cub", shelter = 1,
             maxiter=500,toler=1e-3,data=relgoods) 
summary(cub_she)

## ----cush,cache=TRUE,eval=TRUE,echo=TRUE,comment=NA----------------------
cush<-GEM(Formula(Writing~0),family="cush",shelter = 1,data=relgoods) 
summary(cush,digits=3)

## ----eval=TRUE,echo=FALSE,comment=NA-------------------------------------
data(relgoods)
cub_she<-GEM(Formula(Writing~0|0|0),family="cub", shelter = 1,
             maxiter=500,toler=1e-3,data=relgoods) 
makeplot(cub_she)

## ----eval=TRUE,echo=FALSE,comment=NA-------------------------------------
cush<-GEM(Formula(Writing~0),family="cush",shelter = 1,data=relgoods) 
makeplot(cush)

## ----eval=FALSE,echo=TRUE,comment=NA-------------------------------------
#  simCUB   <- simcub(n, m, pai, csi)
#  simCUBE  <- simcube(n, m, pai, csi, phi)
#  simCUBshe <- simcubshe(n, m, pai, csi, delta, shelter)
#  simCUSH  <- simcush(n, m, delta, shelter)
#  simIHG   <- simihg(n, m, theta)

## ----eval=FALSE,echo=TRUE,comment=NA-------------------------------------
#  m<-9; n<-500
#  pai<-0.7; csi<-0.2
#  pr<-probcub00(m, pai, csi)
#  set.seed(123)
#  ordinal<-simcub(n, m, pai, csi)
#  cub<-GEM(Formula(ordinal~0|0|0),family="cub", maxiter = 50, toler = 1e-4)
#  pr_est<-fitted(cub)[,1]
#  plot(1:m, pr, type = "h", xlab = "Ordinal categories",
#       ylab = "Probability", lwd = 3, ylim = c(0, 0.3))
#  vett<-1:m + 0.2
#  lines(vett, pr_est, type = "h", col = "blue", lwd = 3, lty = 2)
#  legend(1, 0.3, legend = c("Theoretical", "Fitted"), col = c("black", "blue"),
#         lty = c(1, 2), lwd = 3, text.col = c("black", "blue"), bty = "n")

## ----eval=TRUE,echo=FALSE,fig.height=3.8,fig.width=3.8,comment=NA--------
m<-9; n<-500
pai<-0.7; csi<-0.2
pr<-probcub00(m, pai, csi)
ordinal<-simcub(n, m, pai, csi)
cub<-GEM(Formula(ordinal~0|0|0),family="cub", maxiter = 50, toler = 1e-4)
est<-coef(cub)
est
pr_est<-fitted(cub)[,1]
plot(1:m, pr, type = "h", xlab = "Ordinal categories", 
     ylab = "Probability", lwd = 3, ylim = c(0, 0.3))
vett<-1:m + 0.2
lines(vett, pr_est, type = "h", col = "blue", lwd = 3, lty = 2)
legend(1, 0.3, legend = c("Theoretical", "Fitted"), col = c("black", "blue"),
       lty = c(1, 2), lwd = 3, text.col = c("black", "blue"), bty = "n")

## ----eval=FALSE,echo=TRUE,comment=NA-------------------------------------
#     omega0<- -1.5
#     omega1<- -2
#     delta0<-as.numeric(logis(0, c(omega0, omega1)))  ## 0.1824255
#     delta1<-as.numeric(logis(1, c(omega0, omega1)))  ## 0.0293122
#     m<-9
#     n0<-700
#     n1<-1300
#     set.seed(1234)
#     ord0<-simcush(n0, m, delta0, shelter = s)
#     ord1<-simcush(n1, m, delta1, shelter = s)
#     ordinal<-c(ord0, ord1)
#     X<-c(rep(0, n0), rep(1, n1))
#     cushcov<-GEM(Formula(ordinal~X),family="cush",shelter = m)
#     coef(cushcov)
#     makeplot(cushcov)

## ----eval=TRUE,echo=FALSE,fig.height=4,fig.width=4,comment=NA------------
omega0<- -1.5
omega1<- -2
delta0<-as.numeric(logis(0, c(omega0, omega1)))  ## 0.1824255
delta1<-as.numeric(logis(1, c(omega0, omega1)))  ## 0.0293122
m<-9
n0<-700
n1<-1300
s<-m          # shelter category
ord0<-simcush(n0, m, delta0, shelter = s)
ord1<-simcush(n1, m, delta1, shelter = s)
ordinal<-c(ord0, ord1)
X<-c(rep(0, n0), rep(1, n1))
cushcov<-GEM(Formula(ordinal~X), family="cush", shelter = s)
coef(cushcov)
makeplot(cushcov)

## ----eval=FALSE,echo=TRUE,comment=NA-------------------------------------
#  m<-7
#  pai<-0.4
#  csi<-0.2
#  prob<-probcub00(m, pai, csi)
#  Giniindex<-round(gini(prob), digits = 3)
#  Laaksoindex<-round(laakso(prob), digits = 3)
#  Delta<-round(deltaprob(prob), digits = 3)
#  plot(1:m, prob, type = "n", ylab = "", xlab = "", ylim = c(0, 0.4), las = 1)
#  lines(1:m, prob, type = "h", lwd = 3)
#  legend("topleft", xjust = 1, legend = c(paste("Gini       =", Giniindex),
#                    paste("Laakso  =", Laaksoindex),
#                    paste("Delta     =", Delta)), cex = 0.8)

## ----eval=TRUE,echo=FALSE,comment=NA,fig.height=4,fig.width=4------------
m<-7
pai<-0.4
csi<-0.2
prob<-probcub00(m, pai, csi)
Giniindex<-round(gini(prob), digits = 3)
Laaksoindex<-round(laakso(prob), digits = 3)
Delta<-round(deltaprob(prob), digits = 3)
plot(1:m, prob, type = "h", ylab = "", xlab = "", ylim = c(0, 0.4), las = 1)
legend("topleft", xjust = 1, legend = c(paste("Gini       =", Giniindex),
                  paste("Laakso  =", Laaksoindex),
                  paste("Delta     =", Delta)), cex = 0.8)

## ----eval=FALSE,echo=TRUE,comment=NA-------------------------------------
#    pai<-0.3; csi<-0.8
#    nsimul<-10000
#    n<-300; m<-7
#    vectdiss<-rep(NA, nsimul)
#    for (j in 1:nsimul){
#      ordinal<-simcub(n, m, pai, csi)
#      mod<-GEM(Formula(ordinal~0|0|0),family="cub")
#      theor<-fitted(mod)[,1]
#      freq<-tabulate(ordinal, nbins = m)/n
#      vectdiss[j]<-dissim(freq, theor)
#    }
#  
#    sortvect<-sort(vectdiss)
#    alpha<-0.05
#    signif<-sortvect[(1-alpha)*nsimul] # empirical percentile 0.05
#    cr<-vectdiss[vectdiss>signif]       # critical region
#  
#    effe<-density(vectdiss)
#    band<-effe$bw     # band width of the kernel plot
#    f<-function(x){   # compute kernel density (the default is Gaussian kernel)
#      (1/(band*length(vectdiss)))*sum(dnorm((x-vectdiss)/band))
#    }
#    sortcr<-sort(cr)
#    sup<-numeric(length(cr))
#    for (j in 1:length(cr)){
#      sup[j]=f(sortcr[j])    # compute kernel density values for critical values
#    }
#    title <- paste("Normalized Dissimilarity distribution, Critical level(0.05) = ",
#                  round(signif, 3))
#    plot(density(vectdiss), main = title, cex.main = 0.7, lwd = 3, xlab = "",
#         cex.main = 0.7, las = 1)
#    polygon(c(signif, sortcr, sortcr[length(sortcr)], signif), c(0, sup, 0, 0),
#            col = "gray")
#    abline(h=0)

## ----eval=TRUE,echo=FALSE,fig.width=5,fig.height=5,comment=NA------------
  pai<-0.3; csi<-0.8
  nsimul<-10000
  n<-300; m<-7
  vectdiss<-rep(NA, nsimul)
  for (j in 1:nsimul){
    ordinal<-simcub(n, m, pai, csi)
    mod<-GEM(Formula(ordinal~0|0|0),family="cub")
    paiest<-coef(mod)[1]
    csiest<-coef(mod)[2]
    theor<-fitted(mod)[,1]
    freq<-tabulate(ordinal, nbins = m)/n
    vectdiss[j]<-dissim(freq, theor)
  }
  
  sortvect<-sort(vectdiss)
  alpha<-0.05
  signif<-sortvect[(1-alpha)*nsimul] # empirical percentile 0.05
  cr=vectdiss[vectdiss>signif]       # critical region
  
  effe<-density(vectdiss)
  band<-effe$bw     # band width of the kernel plot
  f<-function(x){   # compute kernel density (the default is Gaussian kernel)
    (1/(band*length(vectdiss)))*sum(dnorm((x-vectdiss)/band))
  }
  sortcr<-sort(cr)
  sup<-numeric(length(cr))
  for (j in 1:length(cr)){
    sup[j]=f(sortcr[j])    # compute kernel density values for critical values
  }
 title = paste("Normalized Dissimilarity distribution \n Critical level(0.05) = ", round(signif, 3))
  plot(density(vectdiss), main = title, cex.main = 0.7, lwd = 3, xlab = "", 
       cex.main = 0.7, las = 1)
  polygon(c(signif, sortcr, sortcr[length(sortcr)], signif), c(0, sup, 0, 0),
          col = "gray")
  abline(h=0)

## ----eval=FALSE,echo=TRUE,comment=NA-------------------------------------
#  data(univer)
#  ordinal<-univer$global
#  lage<-log(univer$age)-mean(log(univer$age)) #Deviation from mean of logged Age
#  Y<-W<-cbind(univer$officeho,lage)
#  cub_pai_csi<-GEM(Formula(global~Y|W|0),family="cub",data=univer)
#  bet<-coef(cub_pai_csi)[1:3]
#  gama<-coef(cub_pai_csi)[4:6]
#  paivett<-logis(Y,bet)
#  csivett<-logis(W,gama)
#  n<-length(ordinal)
#  main<- "Scatter plot of estimated parameters"
#  vettcol<-symb<-rep(NA,n)
#  vettcol[univer$officeho<=3]<-"red"
#  vettcol[univer$officeho==4]<-"black"
#  vettcol[univer$officeho>=5]<-"blue"
#  
#  symb[univer$officeho<=3]<-0
#  symb[univer$officeho==4]<-1
#  symb[univer$officeho>=5]<-2
#  
#  plot(1-paivett,1-csivett,xlim=c(0,1),ylim=c(0,1),
#       cex=0.8,pch=symb,col=vettcol,
#       xlab=expression(1-pi),ylab=expression(1-xi),
#       main=main,cex.main=1,font.main=4)
#  legend("topright",legend=c("Unsatisfied","Indifferent","Satisfied"),
#         cex=0.7,text.col=c("red","black","blue"),pch=c(0,1,2),
#         col=c("red","black","blue"))

## ----eval=TRUE,echo=FALSE,fig.width=4.5,fig.height=4.5,comment=NA--------
data(univer)
ordinal<-univer$global
lage<-log(univer$age)-mean(log(univer$age)) #Deviation from mean of logged Age
Y<-W<-cbind(univer$officeho,lage)
cub_pai_csi<-GEM(Formula(global~Y|W|0),family="cub",data=univer)
bet<-coef(cub_pai_csi)[1:3]
gama<-coef(cub_pai_csi)[4:6]
paivett<-logis(Y,bet)
csivett<-logis(W,gama)
n<-length(ordinal)
caption<- "Scatter plot of estimated parameters"
vettcol<-symb<-rep(NA,n)
vettcol[univer$officeho<=3]<-"red"
vettcol[univer$officeho==4]<-"black"
vettcol[univer$officeho>=5]<-"blue"
  
symb[univer$officeho<=3]<-0
symb[univer$officeho==4]<-1
symb[univer$officeho>=5]<-2
  
plot(1-paivett,1-csivett,xlim=c(0,1),ylim=c(0,1),
     cex=0.8,pch=symb,col=vettcol,
     xlab=expression(1-pi),ylab=expression(1-xi),
     main=caption,cex.main=1,font.main=4)
legend("topright",legend=c("Unsatisfied","Indifferent","Satisfied"),
       cex=0.7,text.col=c("red","black","blue"),pch=c(0,1,2),
       col=c("red","black","blue"))



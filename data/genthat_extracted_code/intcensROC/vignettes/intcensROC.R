## ----setup1, include=FALSE, echo=FALSE-----------------------------------
require(knitr)

## ----setup2, include=FALSE,echo=FALSE-----------------------------------------
options(width=80)  # make the printing fit on the page
set.seed(1121)     # make the results repeatable
stdt<-date()

## ----beta, eval=FALSE---------------------------------------------------------
#  res <- intcensROC(U, V, Marker, Delta, PredictTime, gridNumber = 500)

## ----var, eval=FALSE----------------------------------------------------------
#  auc <- intcensAUC(ROCdata)

## ----startOffExample----------------------------------------------------------
library(intcensROC)
## example interval censored data
U <- runif(100, min = 0.1, max = 5)
V <- runif(100, min = 0.1, max = 5) + U
Marker <- runif(100, min = 5, max = 10)
Delta  <- sample.int(3, size = 100, replace = TRUE)
pTime  <- 4
## compute the ROC curve
res <- intcensROC(U, V, Marker, Delta, pTime, gridNumber = 500)
head(res)
##compute the AUC
auc <- intcensAUC(res)
print(auc)

## ----inputPara, eval=TRUE, echo=FALSE-----------------------------------------
library(copula)
f<-function(x,L0,rate,censor){
  1/((x-L0)*rate)*exp(-L0*rate)-1/((x-L0)*rate)*exp(-x*rate)-censor}
dataSim <- function(kendall_tau = 0.3, n = 100, rho = 0.3, lambda = log(2)/6)
{
  b_alpha     <- 2.35
  b_beta      <- 1.87
  scale       <- 10
  kendall_tau <- iTau( claytonCopula(), kendall_tau)
  Int_cop     <- claytonCopula(param = kendall_tau, dim = 2)
  Int_mvdc    <- mvdc(Int_cop, c("exp","beta"),  paramMargins =
                 list(list(rate = lambda), list(shape1=b_alpha,shape2=b_beta)))
  Int_obs_data <- rMvdc(n, Int_mvdc)
  colnames(Int_obs_data) <- c("event_time", "marker")
  Int_obs_data[,"marker"] <- Int_obs_data[,"marker"]*scale
  L0       <-0.1; size     <-n; U        <-rep(0,size)
  L        <-uniroot(f, lower = 10^(-6), upper = 500, tol=0.000001, 
             L0=L0, rate=lambda, censor=rho)
  V        <-runif(size,L0,L$root)
  for (i in 1:size)
      U[i] <-runif(1,0,(V[i]-L0))
  delta_1      <- Int_obs_data[ ,"event_time"] < U
  delta_2      <- Int_obs_data[ ,"event_time"] >= U&
                  Int_obs_data[ ,"event_time"] <= V
  delta_3      <- Int_obs_data[ ,"event_time"] > V
  data         <- data.frame(U = U, V = V, delta = delta_1+2*delta_2+3*delta_3, 
                  marker=Int_obs_data[,"marker"])
}

## ----inputPara_1, eval=FALSE, echo=TRUE---------------------------------------
#  library(copula)
#  f<-function(x,L0,rate,censor){
#    1/((x-L0)*rate)*exp(-L0*rate)-1/((x-L0)*rate)*exp(-x*rate)-censor}
#  dataSim <- function(kendall_tau = 0.3, n = 100, rho = 0.3, lambda = log(2)/6)
#  {
#    b_alpha     <- 2.35
#    b_beta      <- 1.87
#    scale       <- 10
#    kendall_tau <- iTau( claytonCopula(), kendall_tau)
#    Int_cop     <- claytonCopula(param = kendall_tau, dim = 2)
#    Int_mvdc    <- mvdc(Int_cop, c("exp","beta"),  paramMargins =
#                   list(list(rate = lambda),
#                   list(shape1=b_alpha,shape2=b_beta)))
#    Int_obs_data <- rMvdc(n, Int_mvdc)
#    colnames(Int_obs_data) <- c("event_time", "marker")

## ----inputPara_2, eval=FALSE, echo=TRUE---------------------------------------
#    Int_obs_data[,"marker"] <- Int_obs_data[,"marker"]*scale
#    L0       <-0.1; size     <-n; U        <-rep(0,size)
#    L        <-uniroot(f, lower = 10^(-6), upper = 500, tol=0.000001,
#               L0=L0, rate=lambda, censor=rho)
#    V        <-runif(size,L0,L$root)
#    for (i in 1:size)
#        U[i] <-runif(1,0,(V[i]-L0))
#    delta_1      <- Int_obs_data[ ,"event_time"] < U
#    delta_2      <- Int_obs_data[ ,"event_time"] >= U&
#                    Int_obs_data[ ,"event_time"] <= V
#    delta_3      <- Int_obs_data[ ,"event_time"] > V
#    data         <- data.frame(U = U, V = V, delta =
#                    delta_1+2*delta_2+3*delta_3,
#                    marker=Int_obs_data[,"marker"])
#  }

## ----loadpkg,out.width='2.5in', fig.width=5, fig.height=4---------------------
mydata <- dataSim(kendall_tau = 0.7, n = 300, rho = 0.3, lambda = log(2)/24)
roc    <- intcensROC(U=mydata[,"U"],V=mydata[,"V"], Marker=mydata[,"marker"],
                  Delta=mydata[,"delta"], PredictTime=12)
print(intcensAUC(roc))
plot(roc$fp, roc$tp, type = "l", lwd = 1.2, col="blue", main = "Example ROC",
     xlab = "False Positive Rate", ylab = "True Positive Rate" )

## ----sessinfo, echo=FALSE, include=TRUE, results='asis'-----------------------
toLatex(sessionInfo(), locale=FALSE)

## ----times, echo=FALSE, include=TRUE------------------------------------------
print(paste("Start Time",stdt))
print(paste("End Time  ",date()))


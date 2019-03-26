## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----install1, eval=F----------------------------------------------------
#  install.packages("PSTR")

## ----install2, eval=F----------------------------------------------------
#  devtools::install_github("yukai-yang/PSTR")

## ----attach--------------------------------------------------------------
library(PSTR)

## ----version-------------------------------------------------------------
version()

## ----contents------------------------------------------------------------
ls( grep("PSTR", search()) ) 

## ----data, eval=F--------------------------------------------------------
#  ?Hansen99

## ----new-----------------------------------------------------------------
pstr = NewPSTR(Hansen99, dep='inva', indep=4:20, indep_k=c('vala','debta','cfa','sales'),
               tvars=c('vala'), im=1, iT=14)
print(pstr)

## ----lintest-------------------------------------------------------------
pstr = LinTest(use=pstr) 
print(pstr, "tests")

## ----lintest3, eval=F----------------------------------------------------
#  iB = 5000 # the number of repetitions in the bootstrap
#  library(snowfall)
#  pstr = WCB_LinTest(use=pstr,iB=iB,parallel=T,cpus=50)

## ----lintest4, eval=F----------------------------------------------------
#  pstr = WCB_LinTest(use=pstr,iB=4,parallel=T,cpus=2)

## ----estimate, eval=F----------------------------------------------------
#  pstr = EstPSTR(use=pstr,im=1,iq=1,useDelta=T,par=c(1.6,.5), vLower=4, vUpper=4)
#  print(pstr,"estimates")

## ----estimate1-----------------------------------------------------------
pstr = EstPSTR(use=pstr,im=1,iq=1,useDelta=T,par=c(1.6,.5), method="CG")
print(pstr,"estimates")

## ----estimate2, eval=F---------------------------------------------------
#  pstr = EstPSTR(use=pstr,im=1,iq=1,useDelta=T,par=c(1.6,.5), method="CG")
#  pstr = EstPSTR(use=pstr,im=1,iq=1,par=c(exp(1.6),.5), method="CG")

## ----plot----------------------------------------------------------------
plot_transition(pstr, log_scale=TRUE, color = "blue", size = 2,
    x="Tobin's Q in log scale", title="The Estimated Transition Function",
    caption="If you wanna write something in the caption, do it here.")

## ----estimate3-----------------------------------------------------------
pstr0 = EstPSTR(use=pstr)
print(pstr0,"estimates")

## ----evaluation, eval=F--------------------------------------------------
#  ## evaluatio tests
#  pstr1 = EvalTest(use=pstr,vq=pstr$mQ[,1])

## ----evaluation1, eval=F-------------------------------------------------
#  iB = 5000
#  cpus = 50
#  
#  ## wild bootstrap time-varyint evaluation test
#  pstr = WCB_TVTest(use=pstr,iB=iB,parallel=T,cpus=cpus)
#  
#  ## wild bootstrap heterogeneity evaluation test
#  pstr1 = WCB_HETest(use=pstr1,vq=pstr$mQ[,1],iB=iB,parallel=T,cpus=cpus)

## ----plot0---------------------------------------------------------------
ret = plot_response(obj=pstr, vars=1:4, log_scale = c(F,T), length.out=100)

## ----plot2, eval=F-------------------------------------------------------
#  ret1 = plot_response(obj=pstr, vars=1, log_scale = c(F,T), length.out=100)
#  ret2 = plot_response(obj=pstr, vars=2, log_scale = c(T,T), length.out=100)

## ------------------------------------------------------------------------
attributes(ret)

## ----vala, message=F-----------------------------------------------------
ret$vala

## ----vala2, message=F----------------------------------------------------
ret$vala + ggplot2::scale_x_log10(breaks=c(.02,.05,.1,.2,.5,1,2,5,10,20)) +
    ggplot2::labs(x="Tobin's Q")

## ----debta, eval=F-------------------------------------------------------
#  ret$debta

## ----cfa, eval=F---------------------------------------------------------
#  ret$cfa

## ----sales, eval=F-------------------------------------------------------
#  ret$sales


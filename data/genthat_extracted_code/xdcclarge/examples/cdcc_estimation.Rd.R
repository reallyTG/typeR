library(xdcclarge)


### Name: cdcc_estimation
### Title: This function estimates the parameters(alpha,beta) and
###   time-varying correlation matrices(Rt) of cDCC-GARCH model.
### Aliases: cdcc_estimation

### ** Examples

  library(rugarch)
  library(xdcclarge)
  #load data
  data(us_stocks)
  n<-3
  Rtn<-log(us_stocks[-1,1:n]/us_stocks[-nrow(us_stocks),1:n])
  
  # Step 1:GARCH Parameter Estimation with rugarch
  spec = ugarchspec()
  mspec = multispec( replicate(spec, n = n) )
  fitlist = multifit(multispec = mspec, data = Rtn)
  ht<-sigma(fitlist)^2
  residuals<-residuals(fitlist)
  
  # Step 2:cDCC-GARCH Parameter Estimation with xdcclarge
  cDCC<-cdcc_estimation(ini.para=c(0.05,0.93) ,ht ,residuals)
  #Time varying correlation matrix Rt at time t
  (Rt<-matrix(cDCC$cdcc_Rt,n,n))

  ## Not run: 
##D   #If you want Rt at time t-s,then
##D   s<-10
##D   cDCC<-cdcc_estimation(ini.para=c(0.05,0.93) ,ht ,residuals,ts = s)
##D   matrix(cDCC$cdcc_Rt[s,],n,n)
##D   
## End(Not run)
  




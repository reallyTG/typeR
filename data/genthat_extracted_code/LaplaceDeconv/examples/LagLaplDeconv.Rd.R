library(LaplaceDeconv)


### Name: LagLaplDeconv
### Title: function LagLaplDeconv
### Aliases: LagLaplDeconv LagLaplaceDeconv, LagLaplaceDeconvolution,
###   LaguerreLaplaceDeconvolution, LaguerrePenalizedQR LaplDeconv,
###   LaplaceDeconv, LaplaceDeconvolution,

### ** Examples

## Not run: 
##D  #### AN ARTICIAL EXAMPLE ####
##D 
##D  library(LaplaceDeconv)
##D  par(mfrow=c(1,1))
##D  set.seed(29102015)
##D 
##D  sigma=0.02
##D  a = 1
##D  t = seq(0,5,l=100)
##D  g = 20*t^2*exp(-5*t)
##D  f.coef = c(0.4,0.02,0.01)
##D 
##D  # compute the Laplace convolution from g, kernel computed at times t, and the function
##D  # described by its decomposition in Laguerre function basis with scale a :
##D  fg = LaguerreLaplaceConvolution(t,g,f.coef,a)
##D 
##D  # the noisy observations :
##D  Y = fg+sigma*rnorm(length(fg))
##D 
##D  # estimation of f from the observation and the kernel :
##D  L = LagLaplDeconv(Y,g,t,sigma)
##D  matplot(t,cbind(g,MakeLaguerreMatrix(a,3)(t)%*%f.coef,fg,L$q.hat,L$f.hat,Y),lty=1,
##D    type=c('b',rep('l',4),'p'),ylab='',pch='x')
##D 
##D  # display results of estimation
##D  legend('topright',lty=c(rep(1,5),0),pch=c('x',rep('',4),'x'),
##D    legend=c(
##D      'g: partially observed kernel',
##D      'f: unknown',
##D      'q=fxg: unknown convolution',
##D      expression(hat(q)*': plug-in convolution'),
##D      expression(hat(f)*': estimation of f'),
##D      'Y: observations'),
##D    col=1:6)
##D  
## End(Not run)

 ## Not run: 
##D  #### A REAL EXAMPLE USING DCE-MRI DATA FROM A TUMOR ####
##D 
##D  library(LaplaceDeconv)
##D  par(mfrow=c(1,2))
##D 
##D  # load data from patient before the treatment
##D  data(EX_DCEMRI_t0)
##D 
##D  # display AIF and tumoral enhancements
##D  matplot(ex_dcemri$times,
##D    cbind(ex_dcemri$AIF,ex_dcemri$TUM_1,ex_dcemri$TUM_2,ex_dcemri$TUM_3),
##D    ylab='',lty=1,type=c('b',rep('p',3)),pch='+',main='Observations')
##D  legend('topright',pch='+',legend=c('AIF','TUM_1','TUM_2','TUM_3'),col=1:4)
##D 
##D  # estimation of the contrast agent survival functions
##D  L1 = LagLaplDeconv(ex_dcemri$TUM_1,ex_dcemri$AIF,ex_dcemri$times,ex_dcemri$sigma)
##D  L2 = LagLaplDeconv(ex_dcemri$TUM_2,ex_dcemri$AIF,ex_dcemri$times,ex_dcemri$sigma)
##D  L3 = LagLaplDeconv(ex_dcemri$TUM_3,ex_dcemri$AIF,ex_dcemri$times,ex_dcemri$sigma)
##D 
##D  matlines(ex_dcemri$times,cbind(L1$q.hat,L2$q.hat,L3$q.hat),type='l',lty=1,col=2:4)
##D 
##D  # display results of estimation
##D  matplot(ex_dcemri$times,cbind(L1$f.hat,L2$f.hat,L3$f.hat),type='l',lty=1,col=2:4,
##D    ylab='survival',main='Contrast agent survival fcts')
##D  legend('topright',lty=1,col=2:4,
##D    legend=c(
##D      paste0('TUM_1 - a.hat=',round(L1$a.hat,digits=2)),
##D      paste0('TUM_2 - a.hat=',round(L2$a.hat,digits=2)),
##D      paste0('TUM_3 - a.hat=',round(L3$a.hat,digits=2))
##D      )
##D    )
##D  
## End(Not run)




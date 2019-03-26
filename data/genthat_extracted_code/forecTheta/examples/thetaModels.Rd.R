library(forecTheta)


### Name: Theta Models
### Title: Theta Models
### Aliases: dotm dstm otm stm stheta
### Keywords: DOTM DSTM OTM STM STheta time series forecasting

### ** Examples


y1 = 2+ 0.15*(1:20) + rnorm(20)
y2 = y1[20]+ 0.3*(1:30) + rnorm(30)
y =  as.ts(c(y1,y2))
out <- dotm(y, h=10)
summary(out)
plot(out)

#### additive seasonal decomposition ###
x = sin(2*pi*seq(0,9,len=300)) + exp((1:300)/150) + rnorm(mean=0,sd=0.5,n=300)
y = ts(x, frequency=33)
out <- dotm(y, h=50, s='additive')
summary(out)
plot(out)

######### Reproducing the M3 results by DOTM ############
# library(Mcomp)
# data(M3)
#
# forec = matrix(NA, nrow=3003, ncol=18)
# obs = matrix(NA, nrow=3003, ncol=18) #matrix of the out-sample values
# meanDiff <- rep(1, 3003)
# 
# for(i in 1:3003){
#	 if(i %% 100 == 0){print(i);}
#	 x=M3[[i]]$x
#	 h=M3[[i]]$h
#	 out = dotm(x,h,level=NULL)
#	 forec[i,1:h] = out$mean
#	 obs[i,1:h] = M3[[i]]$xx
#	 meanDiff[i] = mean(abs(diff(x, lag = frequency(x))))
# }

############## sMAPE ###################
#	sAPE_matrix = errorMetric(obs=obs, forec=forec, type="sAPE", statistic="N")
#### Yearly ###
#	mean( sAPE_matrix[1:645, 1:6] )
#### QUARTERLY ###
#	mean( sAPE_matrix[646:1401, 1:8] )
#### MONTHLY ###
#	mean( sAPE_matrix[1402:2829, 1:18] )
#### Other ###
#	mean( sAPE_matrix[2830:3003, 1:8] )
#### ALL ###
#	mean( sAPE_matrix, na.rm=TRUE )
#	
############# MASE ######################	
#	AE_matrix = errorMetric(obs=obs, forec=forec, type="AE", statistic="N")
#   ASE_matrix=AE_matrix/meanDiff
#### Yearly ###
#	mean( ASE_matrix[1:645, 1:6] )
#### QUARTERLY ###
#	mean( ASE_matrix[646:1401, 1:8] )
#### MONTHLY ###
#	mean( ASE_matrix[1402:2829, 1:18] )
#### Other ###
#	mean( ASE_matrix[2830:3003, 1:8] )
#### ALL ###
#	mean( ASE_matrix, na.rm=TRUE )
########################################################	




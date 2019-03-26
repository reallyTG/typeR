library(forecTheta)


### Name: otm.arxiv
### Title: Optimised Theta Method
### Aliases: otm.arxiv
### Keywords: otm thetaM theta-method time series forecasting

### ** Examples


y1 = 2+ 0.15*(1:20) + rnorm(20,2)
y2 = y1[20]+ 0.3*(1:30) + rnorm(30,2)
y =  as.ts(c(y1,y2))

otm.arxiv(y, h=10)

### running the M3-competition data base by OTM approach (a) ###
#require(Mcomp)
#data(M3)
#
#forec = matrix(NA, nrow=3003, ncol=18)
#obs = matrix(NA, nrow=3003, ncol=18) #matrix of the out-sample values
#
#for(i in 1:3003){
#	if(i %% 100 == 0){print(i)}
#	x=M3[[i]]$x
#	h=M3[[i]]$h
#	out = otm.arxiv(x,h,approach='a',tLineExtrap=ses)
#	forec[i,1:h] = out$mean
#	obs[i,1:h] = M3[[i]]$xx
#}
#
#sAPE = errorMetric(obs, forec, type="sAPE", statistic="N") ## sAPE matrix
#
##### sMAPE results ##
### Yearly
#mean( sAPE[1:645, 1:6] )
### QUARTERLY
#mean( sAPE[646:1401, 1:8] )
### MONTHLY
#mean( sAPE[1402:2829, 1:18] )
### Other
#mean( sAPE[2830:3003, 1:8] )
### ALL
#mean( sAPE, na.rm=TRUE )
	




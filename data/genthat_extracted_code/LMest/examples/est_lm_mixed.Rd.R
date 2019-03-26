library(LMest)


### Name: est_lm_mixed
### Title: Estimate mixed LM model
### Aliases: est_lm_mixed

### ** Examples

## Not run: 
##D # Example based of criminal data
##D # load data
##D data(data_criminal_sim)
##D out = long2wide(data_criminal_sim,"id","time","sex",
##D 	 c("y1","y2","y3","y4","y5","y6","y7","y8","y9","y10"),aggr=T,full=999)	
##D 
##D XX = out$XX
##D YY = out$YY
##D freq = out$freq
##D n1 = sum(freq[XX[,1]==1])
##D n2 = sum(freq[XX[,1]==2])
##D n = sum(freq)
##D 
##D # fit mixed LM model only for females
##D YY = YY[XX[,1]==2,,]; freq = freq[XX[,1]==2]
##D k1 = 2; k2 = 2
##D res = est_lm_mixed(YY,freq,k1,k2,tol=10^-8)
##D summary(res)
## End(Not run)




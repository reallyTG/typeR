library(LMest)


### Name: est_lm_basic
### Title: Estimate basic LM model
### Aliases: est_lm_basic

### ** Examples

# Example of drug consumption data
# load data
data(data_drug)
data_drug = as.matrix(data_drug)
S = data_drug[,1:5]-1
yv = data_drug[,6]
# fit of the Basic LM model
k = 3
out = est_lm_basic(S,yv,k,mod=1)
summary(out)

## Not run: 
##D # Example based on criminal data
##D # load criminal data
##D data(data_criminal_sim)
##D out = long2wide(data_criminal_sim,"id","time","sex",
##D c("y1","y2","y3","y4","y5","y6","y7","y8","y9","y10"),aggr=T,full=999)	
##D XX = out$XX
##D YY = out$YY
##D freq = out$freq
##D # fit basic LM model with increasing number of states to select the most suitable
##D Res0 = vector("list",7)
##D for(k in 1:7){
##D     Res0[[k]] = est_lm_basic(YY,freq,k,mod=1,tol=10^-4)
##D     save(list = ls(),file="example_criminal_temp.RData")
##D }
##D out1 = Res0[[6]]
## End(Not run)




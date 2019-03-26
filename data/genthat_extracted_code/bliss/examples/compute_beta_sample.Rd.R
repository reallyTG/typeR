library(bliss)


### Name: compute_beta_sample
### Title: compute_beta_sample
### Aliases: compute_beta_sample

### ** Examples

library(RColorBrewer)
data(data1)
data(param1)
param1$grids<-data1$grids
# result of res_bliss1<-fit_Bliss(data=data1,param=param1)
data(res_bliss1)
beta_sample <- compute_beta_sample(posterior_sample=res_bliss1$posterior_sample,
                                   param=param1,Q=1)
indexes <- sample(nrow(beta_sample[[1]]),1e2,replace=FALSE)
cols <- colorRampPalette(brewer.pal(9,"YlOrRd"))(1e2)
matplot(param1$grids[[1]],t(beta_sample[[1]][indexes,]),type="l",lty=1,col=cols,
xlab="grid",ylab="")




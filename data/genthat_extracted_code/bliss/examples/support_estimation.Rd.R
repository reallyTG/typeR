library(bliss)


### Name: support_estimation
### Title: support_estimation
### Aliases: support_estimation

### ** Examples

data(data1)
data(param1)
# result of res_bliss1<-fit_Bliss(data=data1,param=param1)
data(res_bliss1)
res_support <- support_estimation(res_bliss1$beta_sample[[1]])

### The estimate
res_support$estimate
### Plot the result
grid <- res_bliss1$data$grids[[1]]
plot(grid,res_support$alpha,ylim=c(0,1),type="l",xlab="",ylab="")
for(k in 1:nrow(res_support$estimate)){
    segments(grid[res_support$estimate[k,1]],0.5,
             grid[res_support$estimate[k,2]],0.5,lwd=2,col=2)
    points(grid[res_support$estimate[k,1]],0.5,pch="|",lwd=2,col=2)
    points(grid[res_support$estimate[k,2]],0.5,pch="|",lwd=2,col=2)
}
abline(h=0.5,col=2,lty=2)




library(ppsbm)


### Name: bootstrap_and_CI
### Title: Bootstrap and Confidence Interval
### Aliases: bootstrap_and_CI

### ** Examples


# data of a synthetic graph with 50 individuals and 3 clusters

n <- 50
Q <- 3

Time <- generated_Q3$data$Time
data <- generated_Q3$data
z <- generated_Q3$z

Dmax <- 2^3

# VEM-algo hist
sol.hist <- mainVEM(list(Nijk=statistics(data,n,Dmax,directed=FALSE),Time=Time),
     n,Qmin=3,directed=FALSE,method='hist',d_part=1,n_perturb=0)[[1]]

# compute bootstrap confidence bands
boot <- bootstrap_and_CI(sol.hist,Time,R=10,alpha=0.1,nbcores=1,d_part=1,n_perturb=0,
     directed=FALSE)

# plot confidence bands
alpha.hat <- exp(sol.hist$logintensities.ql)
vec.x <- (0:Dmax)*Time/Dmax
ind.ql <- 0
par(mfrow=c(2,3))
for (q in 1:Q){
  for (l in q:Q){
    ind.ql <- ind.ql+1
    ymax <- max(c(boot$CI.limits[ind.ql,2,],alpha.hat[ind.ql,]))
    plot(vec.x,c(alpha.hat[ind.ql,],alpha.hat[ind.ql,Dmax]),type='s',col='black',
        ylab='Intensity',xaxt='n',xlab= paste('(',q,',',l,')',sep=""),
        cex.axis=1.5,cex.lab=1.5,ylim=c(0,ymax),main='Confidence bands')
    lines(vec.x,c(boot$CI.limits[ind.ql,1,],boot$CI.limits[ind.ql,1,Dmax]),col='blue',
        type='s',lty=3)
    lines(vec.x,c(boot$CI.limits[ind.ql,2,],boot$CI.limits[ind.ql,2,Dmax]),col='blue',
        type='s',lty=3)
  }
}





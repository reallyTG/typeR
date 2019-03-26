library(packHV)


### Name: plot_mm
### Title: Spaghetti plot and plot of the mean at each time
### Aliases: plot_mm

### ** Examples

N=10
time=rep(1:4,N)
obs=1.1*time + rep(0:1,each=2*N) + rnorm(4*N)
my.data=data.frame(id=rep(1:N,each=4),time,obs,group=rep(1:2,each=N*2))
par(xaxs="i",yaxs="i")
plot_mm(obs~time+(group|id),my.data,col.spag=my.data$group,
        col.mean=c("blue","red"),type="both",main="Test plot_mm")




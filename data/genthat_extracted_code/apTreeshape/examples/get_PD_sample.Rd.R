library(apTreeshape)


### Name: get_PD_sample
### Title: Computes the proportion of conserved PD
### Aliases: get_PD_sample

### ** Examples

set.seed(813)
sampl.frac=seq(0,1,by=0.05) 

PD = get_PD_sample(epsilon=0.01,beta=0,alpha=0,N=50,
                sampl.frac=sampl.frac,ntree=10,equal.ab=FALSE,
                eta=0.5,lengths="yule",b=1,d=0)
probs = c(0.1, 0.9, 0.5)  
PD_stats = as.vector(t(sapply(1:nrow(PD), function(i){quantile(PD[i,], probs)}))) 
par(mgp=c(2.2, 0.8, 0))
par(mar=c(4, 4, 1, 1))
plot(1, type="n", xlab="Fraction of extinct species, p",
    ylab="PD loss", ylim=c(0,1), xlim=c(0,1))
points(c(0,1),c(0,1),t="l",col=grey(0),lty=3)
# plot 95% confidence intervals (grey area)
polygon(c(1-sampl.frac, rev(1-sampl.frac)), c(1-PD_stats[(1:length(sampl.frac))],
      rev(1-PD_stats[((length(sampl.frac)+1):(2*length(sampl.frac)))])),
      border=NA, col=grey(0.7))
# plot median value (black line) 
points(1-sampl.frac, 1-PD_stats[((2*length(sampl.frac)+1):(3*length(sampl.frac)))],t="l")





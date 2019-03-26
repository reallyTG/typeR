library(IDSpatialStats)


### Name: est.transdist.temporal
### Title: Change in mean transmission distance over time
### Aliases: est.transdist.temporal

### ** Examples

set.seed(123)

# Exponentially distributed transmission kernel with mean and standard deviation = 100
dist.func <- alist(n=1, a=1/100, rexp(n, a)) 

# Simulate epidemic
a <- sim.epidemic(R=2,
                  gen.t.mean=7,
                  gen.t.sd=2,
                  tot.generations=7,
                  min.cases=30,
                  trans.kern.func=dist.func)

a <- a[sample(1:nrow(a), 50),] # subsample a to 50 observations

# Estimate mean transmission kernel over time
b <- est.transdist.temporal(epi.data=a,
                            gen.t.mean=7,
                            gen.t.sd=2,
                            t1=0,
                            max.sep=1e10,
                            max.dist=1e10,
                            n.transtree.reps=5,
                            mean.equals.sd=TRUE,
                            parallel=FALSE)

plot(b[,1], pch=19, col='grey', ylim=c(min(b[,1], na.rm=TRUE), max(b[,1], na.rm=TRUE)), 
     xlab='Time step', ylab='Estimated mean of transmission kernel')
abline(h=100, col='red', lty=2)
axis(3, b[,2])

low <- loess(b[,1] ~ as.vector(1:length(b[,1])))
low <- predict(low, newdata=data.frame(as.vector(1:length(b[,1]))))
lines(low, lwd=3, col='blue')




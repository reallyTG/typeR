library(genomic.autocorr)


### Name: block.glm
### Title: block.glm
### Aliases: block.glm

### ** Examples


## simulate data with 10 repeated observations in a row - ie there
## should be autocorrelation only within windows <= 10
library(data.table)
data <- genomic.autocorr:::.sim.data(beta=0.2) 

## suppose we ignored the autocorrelation and look at the
## confidence interval for the effect of x on y1
r1<-summary(glm(y1 ~ x, data=data))$coefficients
r1

## if we know the block structure, as here, we can see the
## confidence interval is (inappropriately) much tighter than
## if we used just independent observations
r2<-summary(glm(y1 ~ x, data=data[!duplicated(name),]))$coefficients
r2

## use block bootstrap - x should only have a significant effect
## on y1 and the confidence interval around its effect should be
## closer to r2, above
r <- block.glm(f.lhs=c("y0","y1"), f.rhs="x",data=data,block.size=20,B=200)
r

## compare the block bootstrap and model based confidence intervals for x on y1
results <- rbind(c(r1[2,1], r1[2,1]-1.96*r1[2,2], r1[2,1]+1.96*r1[2,2]),
c(r2[2,1], r2[2,1]-1.96*r2[2,2], r2[2,1]+1.96*r2[2,2]),
as.numeric(r[4,.(beta,beta.025,beta.975)]))
dimnames(results) <- list(c("standard, ignore blocked","standard, independent obs","bootstrap"),
c("beta","LCI","UCI"))
results

with(as.data.frame(results), {
plot(1:nrow(results), beta,ylim=c(min(c(-0.01,LCI)),max(UCI)),axes=FALSE,xlab="Method",
main="Comparison of confidence intervals around coefficient estimates")
segments(x0=1:nrow(results),y0=LCI,y1=UCI)
abline(h=c(0,0.2),lty="dotted")
axis(1,1:nrow(results),rownames(results))
axis(2)
text(x=c(3,3),y=c(0,0.2),labels=c("null","true"),adj=c(1.1,0))
box()
})





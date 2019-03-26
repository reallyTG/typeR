library(DescTools)


### Name: SampleTwins
### Title: Sample Twins
### Aliases: SampleTwins
### Keywords: survey

### ** Examples

m <- rbind(matrix(rep("nc",165), 165, 1, byrow=TRUE), 
           matrix(rep("sc", 70), 70, 1, byrow=TRUE))
m <- cbind.data.frame(m, c(rep(1, 100), rep(2,50), rep(3,15), 
                           rep(1,30), rep(2,40)), 1000*runif(235))
names(m) <- c("state","region","income")

# this would be our sample to be reproduced by a twin sample
d.smp <- m[sample(nrow(m), size=10, replace=TRUE),]

# draw the sample
s <- SampleTwins(x = m, stratanames=c("state","region"), twins = d.smp, method="srswor")

d.twin <- m[s$id,]
d.twin




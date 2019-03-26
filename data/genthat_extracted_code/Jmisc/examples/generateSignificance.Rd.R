library(Jmisc)


### Name: generateSignificance
### Title: Generate t-statistics, p-value and significance
### Aliases: generateSignificance

### ** Examples

n<-1000
x_data<-cbind(rnorm(n,mean=0),rnorm(n,mean=1))
x_estimates<-cbind(apply(x_data,2,mean),apply(x_data,2,sd)/sqrt(n))
generateSignificance(x_estimates)
generateSignificance(x_estimates,row_names=c("mean0","mean1") )




library(ANOVAreplication)


### Name: prior.predictive.check
### Title: Prior predictive check
### Aliases: prior.predictive.check
### Keywords: htest

### ** Examples

#analysis original data
data_o <- data.frame(y=ChickWeight$weight,g=ChickWeight$Diet)
Gibbs.ANOVA(data_o,it=75,burnin=50) #we advise >1000 iterations, >500 burnin for reliable results

#analysis new data
data_r <- data.frame(y=rnorm(660, mean(data_o$y), sd=sd(data_o$y)),g=round(runif(660,1,4)))
n.r = as.numeric(table(data_r$g))
Amat <- (rbind(c(-1,0,0,1),c(0,-1,0,1),c(0,0,-1,1)))
difmin=c(0.8,0.5,0.2)
r.F.dif.efsz <- Fbar.dif(data_r,Amat,difmin,effectsize=TRUE)

#prior predictive check
result <- prior.predictive.check(n=n.r,posterior=output_m,F_n=r.F.dif.efsz,statistic="dif",
effectsize=TRUE,Amat=Amat,difmin=difmin,seed=1)

result$sumFdist #summary of the f(F_y_sim)
result$ppp      #the prior predictive p-value




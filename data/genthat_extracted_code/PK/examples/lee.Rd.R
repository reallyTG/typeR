library(PK)


### Name: lee
### Title: Two-phase half-life estimation by linear fitting
### Aliases: lee
### Keywords: misc

### ** Examples

#### example for preparation 1 from Lee et al. (1990)
time <- c(0.5, 1.0, 4.0, 8.0, 12.0, 24.0)
conc <- c(75, 72, 61, 54, 36, 6)
res1 <- lee(conc=conc, time=time, method='ols', points=2, lt=TRUE)
res2 <- lee(conc=conc, time=time, method='ols', points=2, lt=FALSE)
plot(res1, log='y', ylim=c(1,100))
plot(res2, add=TRUE, lty=2)

#### example for preparation 2 from Lee et al. (1990)
time <- c(0.5, 1.0, 2.0, 6.5, 8.0, 12.5, 24.0)
conc <- c(75, 55, 48, 51, 39, 9, 5)
res3 <- lee(conc=conc, time=time, method='ols', points=2, lt=FALSE)
print(res3$parms)
plot(res2, log='y', ylim=c(1,100), lty=1, pch=20)
plot(res3, add=TRUE, lty=2, pch=21)
legend(x=0, y=10, pch=c(20,21), lty=c(1,2), legend=c('Preperation 1','Preperation 2'))

#### artificial example
time <- seq(1:10)
conc <- c(1,2,3,4,5,5,4,3,2,1)
res4 <- lee(conc=conc, time=time, method='lad', points=2, lt=FALSE)
plot(res4, log='y', ylim=c(1,7), main='', xlab='', ylab='', pch=19)

#### dataset Indometh of package datasets
require(datasets)
res5 <- data.frame(matrix(ncol=3, nrow=length(unique(Indometh$Subject))))
colnames(res5) <- c('ID', 'initial', 'terminal')
row <- 1
for(i in unique(Indometh$Subject)){
   temp <- subset(Indometh, Subject==i)
   res5[row, 1] <- unique(temp$Subject)
   res5[row, c(2:3)] <- lee(conc=temp$conc, time=temp$time, method='lad')$parms[1,]
   row <- row + 1
}
print(res5)

## geometric means and corresponding two-sided CIs
exp(mean(log(res5$initial)))
exp(t.test(log(res5$initial), conf.level=0.95)$conf.int)

exp(mean(log(res5$terminal)))
exp(t.test(log(res5$terminal), conf.level=0.95)$conf.int)

#### example from Gabrielsson and Weiner (2000, page 743) 
#### endogenous concentration is assumed to be constant over time 
time <- c(-1, 0.167E-01, 0.1167, 0.1670, 0.25, 0.583, 0.8330, 1.083, 1.583, 2.083, 4.083, 8.083,
          12, 23.5, 24.25, 26.75, 32)
conc <- c(20.34, 3683, 884.7, 481.1, 215.6, 114, 95.8, 87.89, 60.19, 60.17, 34.89, 20.99, 20.54, 
          19.28, 18.18, 19.39, 22.72)
data <- data.frame(conc,time)

## naive adjustment for endogenous concentration by subtraction of pre-value
## see also help for function biexp for modelling approaches  
data$concadj <- data$conc - data$conc[1]
data$concadj[min(which(data$concadj<0)):nrow(data)] <- NA
res6 <- lee(conc=data$concadj[-1], time=data$time[-1]) 

## plot results 
split.screen(c(1,2)) 
screen(1)
plot(res6, xlab='Time (hours)', ylab='Baseline-adjusted concentration (pmol/L)')
screen(2)
plot(res6, log='y', ylim=c(0.1, 1E4), xlab='Time (hours)', 
     ylab='Log of baseline-adjusted concentration (pmol/L)')
close.screen(all.screens=TRUE)





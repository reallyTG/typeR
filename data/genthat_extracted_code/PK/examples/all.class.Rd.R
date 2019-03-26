library(PK)


### Name: all.class
### Title: Different generic functions for class PK.
### Aliases: plot.PK print.PK summary.PK
### Keywords: classes

### ** Examples

## serial sampling desing: example from Nedelman et al. (1995)
conc <- c(2790, 3280, 4980, 7550, 5500, 6650, 2250, 3220, 213, 636)
time <- c(1, 1, 2, 2, 4, 4, 8, 8, 24, 24)

obj <- auc(conc=conc, time=time, method=c("z", "t"), design="ssd")

print(obj)

summary(obj)

## serial sampling design: example from Nedelman et al. (1995)
conc.m <- c(391, 396, 649, 1990, 3290, 3820, 844, 1650, 75.7, 288)
conc.f <- c(353, 384, 625, 1410, 1020, 1500, 933, 1030, 0, 80.5)
time <- c(1, 1, 2, 2, 4, 4, 8, 8, 24, 24)

res1 <- auc(conc=conc.m, time=time, method=c('t','z'), design='ssd')
res2 <- auc(conc=conc.f, time=time, method=c('t','z'), design='ssd')

plot(res1, pch=19, ylim=c(0,5000), xlim=c(0,25))
plot(res2, pch=21, col='red', add=TRUE)
legend(x=25, y=5000, xjust=1, pch=c(19,21), col=c('black','red'), 
       legend=c('Male', 'Female'))


## batch design: example from Jaki and Wolfsegger (2009),
## originally in Holder et al. (1999) using data for call
data(Rats)

data1 <- subset(Rats,Rats$dose==100)
data2 <- subset(Rats,Rats$dose==300)
res1 <- auc(data=data1,method='t', design='batch')
res2 <- auc(data=data2,method='t', design='batch')

plot(res1, col='black', ylim=c(0,8), xlim=c(0,25))
plot(res2, col='red', add=TRUE)
legend(x=0, y=8, xjust=0, lty=1, col=c('black','red'), 
       legend=c('Dose of 100', 'Dose of 300'))

data3 <- subset(Rats,Rats$dose==100 | Rats$dose==300)
data3$group <- data3$dose
res3 <- auc(data=data3,method='t', design='batch')
plot(res3,bygroup=TRUE)

## complete data design example
## originally in Hand and Crowler (1996)
data(Glucose)
data1 <- subset(Glucose, date==1)
data2 <- subset(Glucose, date==2)
res1 <- auc(conc=data1$conc, time=data1$time, design='complete', method='t')
res2 <- auc(conc=data2$conc, time=data2$time, design='complete', method='t')
plot(res1, pch=19, col='black', ylim=c(0,5))
plot(res2, pch=21, col='red', add=TRUE)

## more informative plot 
plot(x=c(0, 30), y=c(0, 5), type='n', main='Complete Data Design', xlab='Time', 
      ylab='Concentration')
for(i in unique(Glucose$id)){
   for(j in unique(Glucose$date)){
        temp <- subset(Glucose, id==i & date==j)
        col <- ifelse(j==1, 'black', 'red')
        lty <- ifelse(j==1, 1, 2)
        pch <- ifelse(j==1, 19, 21)
	points(x=temp$time, y=temp$conc, col=col, lty=lty, pch=pch, type='b')
   }
}
legend(x=30, y=5, xjust=1, pch=c(19,21), col=c('black','red'), lty=c(1,2), 
       legend=c('Date 1', 'Date 2'))





